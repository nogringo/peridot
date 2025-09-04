import 'dart:convert';
import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:nip01/nip01.dart';
import 'package:peridot/config.dart';
import 'package:peridot/utils/get_database.dart';
import 'package:sembast/sembast.dart' hide Filter;

class Repository extends GetxController {
  static Repository get to => Get.find();
  static Ndk get ndk => Get.find();

  bool isAppLoaded = false;
  NdkResponse? signingRequestsSubscription;

  late Database db;

  RxList<String> bunkerDefaultRelays = <String>[].obs;

  Future<void> loadApp() async {
    if (isAppLoaded) return;
    isAppLoaded = true;

    db = await getDatabase(appTitle);
    await loadSigners();
    await loadBunkerRelays();
    await listenSigningRequests();
  }

  Future<void> loadSigners() async {
    final storage = FlutterSecureStorage();

    final storedPrivateKeys = await storage.read(key: "private_keys");
    if (storedPrivateKeys == null) return;

    List<String> privateKeys = List<String>.from(jsonDecode(storedPrivateKeys));

    for (var privateKey in privateKeys) {
      final keyPair = KeyPair.fromPrivateKey(privateKey: privateKey);

      if (ndk.accounts.hasAccount(keyPair.publicKey)) continue;

      final signer = Bip340EventSigner(
        privateKey: keyPair.privateKey,
        publicKey: keyPair.publicKey,
      );

      ndk.accounts.addAccount(
        pubkey: keyPair.publicKey,
        type: AccountType.privateKey,
        signer: signer,
      );
    }
  }

  Future<void> savePrivateKeys() async {
    final privateKeys = ndk.accounts.accounts.values.map((account) {
      final signer = account.signer as Bip340EventSigner;
      return signer.privateKey;
    }).toList();

    final storage = FlutterSecureStorage();
    await storage.write(key: "private_keys", value: jsonEncode(privateKeys));
  }

  Future<void> addAccount(KeyPair keypair) async {
    if (ndk.accounts.hasAccount(keypair.publicKey)) return;

    ndk.accounts.loginPrivateKey(
      pubkey: keypair.publicKey,
      privkey: keypair.privateKey,
    );

    await savePrivateKeys();
  }

  Future<void> loadBunkerRelays() async {
    final store = stringMapStoreFactory.store('default_bunker_relays');
    final records = await store.find(db);

    if (records.isNotEmpty) {
      bunkerDefaultRelays.value = records.map((r) => r.key).toList();
    } else {
      bunkerDefaultRelays.value = [];
    }
  }

  Future<void> removeDefaultBunkerRelay(String relay) async {
    final store = stringMapStoreFactory.store('default_bunker_relays');
    await store.record(relay).delete(db);
    bunkerDefaultRelays.remove(relay);
  }

  Future<void> listenSigningRequests() async {
    stopSigningRequestsSubscription();

    // Get authorized keys from database
    final store = intMapStoreFactory.store('authorized_apps');
    final records = await store.find(db);
    final authorizedKeys = records
        .map((record) => record.value['pubkey'] as String?)
        .where((key) => key != null)
        .cast<String>()
        .toList();

    signingRequestsSubscription = ndk.requests.subscription(
      filters: [
        Filter(
          kinds: [24133],
          authors: authorizedKeys,
          pTags: ndk.accounts.accounts.keys.toList(),
        ),
      ],
    );

    signingRequestsSubscription!.stream.listen(processSigningRequest);
  }

  Future<void> stopSigningRequestsSubscription() async {
    if (signingRequestsSubscription == null) return;

    final subId = signingRequestsSubscription!.requestId;
    await ndk.requests.closeSubscription(subId);
    signingRequestsSubscription = null;
  }

  void processSigningRequest(Nip01Event event) async {
    final targetPubkey = event.getFirstTag("p");
    final account = ndk.accounts.accounts[targetPubkey];
    if (account == null) return;
    final signer = account.signer as Bip340EventSigner;

    try {
      // Try to decrypt with NIP-44 first, fallback to NIP-04
      String? decryptedContent;
      bool useNip44 = true; // Track which NIP was used for decryption
      try {
        decryptedContent = await signer.decryptNip44(
          ciphertext: event.content,
          senderPubKey: event.pubKey,
        );
      } catch (_) {
        // NIP-44 failed, try NIP-04
        try {
          decryptedContent = await signer.decrypt(event.content, event.pubKey);
          useNip44 = false; // Successfully decrypted with NIP-04
        } catch (e) {
          print('Failed to decrypt: $e');
          return;
        }
      }

      if (decryptedContent == null) return;

      // Parse the JSON request
      final request = jsonDecode(decryptedContent);
      final method = request['method'] as String?;
      final params = request['params'];
      final id = request['id'] as String?;

      if (method == null || id == null) return;

      // Handle different NIP-46 methods
      switch (method) {
        case 'sign_event':
          // Store request in database for user approval
          final store = intMapStoreFactory.store('pending_requests');
          await store.add(db, {
            'id': id,
            'method': method,
            'params': params,
            'from_pubkey': event.pubKey,
            'target_pubkey': targetPubkey,
            'timestamp': DateTime.now().millisecondsSinceEpoch,
          });
          // TODO: Show notification to user
          break;

        case 'get_public_key':
          await _sendResponse(
            event.pubKey,
            id,
            signer.publicKey,
            signer,
            useNip44,
          );
          break;

        case 'connect':
          await _sendResponse(event.pubKey, id, 'ack', signer, useNip44);
          break;

        case 'nip04_encrypt':
          if (params is List && params.length >= 2) {
            final thirdPartyPubkey = params[0] as String;
            final plaintext = params[1] as String;
            final encrypted = await signer.encrypt(plaintext, thirdPartyPubkey);
            await _sendResponse(event.pubKey, id, encrypted, signer, useNip44);
          }
          break;

        case 'nip04_decrypt':
          if (params is List && params.length >= 2) {
            final thirdPartyPubkey = params[0] as String;
            final ciphertext = params[1] as String;
            final decrypted = await signer.decrypt(
              ciphertext,
              thirdPartyPubkey,
            );
            await _sendResponse(event.pubKey, id, decrypted, signer, useNip44);
          }
          break;

        case 'nip44_encrypt':
          if (params is List && params.length >= 2) {
            final thirdPartyPubkey = params[0] as String;
            final plaintext = params[1] as String;
            final encrypted = await signer.encryptNip44(
              plaintext: plaintext,
              recipientPubKey: thirdPartyPubkey,
            );
            await _sendResponse(event.pubKey, id, encrypted, signer, useNip44);
          }
          break;

        case 'nip44_decrypt':
          if (params is List && params.length >= 2) {
            final thirdPartyPubkey = params[0] as String;
            final ciphertext = params[1] as String;
            final decrypted = await signer.decryptNip44(
              ciphertext: ciphertext,
              senderPubKey: thirdPartyPubkey,
            );
            await _sendResponse(event.pubKey, id, decrypted, signer, useNip44);
          }
          break;

        default:
          await _sendErrorResponse(
            event.pubKey,
            id,
            'Method not supported',
            signer,
            useNip44,
          );
      }
    } catch (e) {
      print('Error processing request: $e');
    }
  }

  Future<void> _sendResponse(
    String toPubkey,
    String id,
    dynamic result,
    Bip340EventSigner signer,
    bool useNip44,
  ) async {
    final response = jsonEncode({'id': id, 'result': result, 'error': null});

    // Use the same NIP that was used for decryption
    final String? encryptedContent;
    if (useNip44) {
      encryptedContent = await signer.encryptNip44(
        plaintext: response,
        recipientPubKey: toPubkey,
      );
    } else {
      encryptedContent = await signer.encrypt(response, toPubkey);
    }

    final responseEvent = Nip01Event(
      pubKey: signer.publicKey,
      kind: 24133,
      content: encryptedContent ?? '',
      tags: [
        ['p', toPubkey],
      ],
      createdAt: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );

    await signer.sign(responseEvent);
    ndk.broadcast.broadcast(nostrEvent: responseEvent);
  }

  Future<void> _sendErrorResponse(
    String toPubkey,
    String id,
    String error,
    Bip340EventSigner signer,
    bool useNip44,
  ) async {
    final response = jsonEncode({'id': id, 'result': null, 'error': error});

    // Use the same NIP that was used for decryption
    final String? encryptedContent;
    if (useNip44) {
      encryptedContent = await signer.encryptNip44(
        plaintext: response,
        recipientPubKey: toPubkey,
      );
    } else {
      encryptedContent = await signer.encrypt(response, toPubkey);
    }

    final responseEvent = Nip01Event(
      pubKey: signer.publicKey,
      kind: 24133,
      content: encryptedContent ?? '',
      tags: [
        ['p', toPubkey],
      ],
      createdAt: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );

    await signer.sign(responseEvent);
    ndk.broadcast.broadcast(nostrEvent: responseEvent);
  }

  String generateBunkerUrl() {
    // Get the current user's public key
    final account = ndk.accounts.getLoggedAccount();
    if (account == null) return '';

    // Generate a random secret token
    final random = Random.secure();
    final secretBytes = List<int>.generate(16, (i) => random.nextInt(256));
    final secret = secretBytes
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();

    // Use bunker default relays
    final relayParams = bunkerDefaultRelays
        .map((url) => 'relay=$url')
        .join('&');

    // Construct the bunker URL
    return 'bunker://${account.pubkey}?$relayParams&secret=$secret';
  }
}
