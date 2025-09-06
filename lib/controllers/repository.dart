import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:nip01/nip01.dart';
import 'package:peridot/config.dart';
import 'package:peridot/models/authorized_app.dart';
import 'package:peridot/models/nip46_request.dart';
import 'package:peridot/utils/get_database.dart';
import 'package:peridot/utils/nip46_parser.dart';
import 'package:sembast/sembast.dart' as sembast;

class Repository extends GetxController {
  static Repository get to => Get.find();
  static Ndk get ndk => Get.find();

  bool isAppLoaded = false;
  NdkResponse? signingRequestsSubscription;

  late sembast.Database db;

  RxList<String> bunkerDefaultRelays = <String>[].obs;
  RxList<AuthorizedApp> authorizedApps = <AuthorizedApp>[].obs;

  Future<void> loadApp() async {
    if (isAppLoaded) return;
    isAppLoaded = true;

    db = await getDatabase(appTitle);
    await loadSigners();
    await loadBunkerRelays();
    await loadAuthorizedApps();
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

  Future<void> removeAccount(String pubkey) async {
    // Remove the account from NDK
    ndk.accounts.removeAccount(pubkey: pubkey);

    // Remove all apps associated with this account
    final store = sembast.intMapStoreFactory.store('authorized_apps');
    final records = await store.find(
      db,
      finder: sembast.Finder(
        filter: sembast.Filter.equals('signerPubkey', pubkey),
      ),
    );

    // Delete all matching records
    for (final record in records) {
      await store.record(record.key).delete(db);
    }

    // Reload authorized apps to update the UI
    await loadAuthorizedApps();

    // Save and update
    await savePrivateKeys();
    update();
  }

  Future<void> loadBunkerRelays() async {
    final store = sembast.stringMapStoreFactory.store('default_bunker_relays');
    final records = await store.find(db);

    if (records.isNotEmpty) {
      bunkerDefaultRelays.value = records.map((r) => r.key).toList();
    } else {
      bunkerDefaultRelays.value = [];
    }
  }

  Future<void> loadAuthorizedApps() async {
    final store = sembast.intMapStoreFactory.store('authorized_apps');
    final records = await store.find(db);

    authorizedApps.value = records.map((record) {
      return AuthorizedApp.fromJson(record.value);
    }).toList();
  }

  Future<void> removeDefaultBunkerRelay(String relay) async {
    final store = sembast.stringMapStoreFactory.store('default_bunker_relays');
    await store.record(relay).delete(db);
    bunkerDefaultRelays.remove(relay);
  }

  Future<void> listenSigningRequests() async {
    stopSigningRequestsSubscription();

    // Get all unique relays from authorized apps
    final Set<String> allRelays = {};
    for (final app in authorizedApps) {
      allRelays.addAll(app.relays);
    }
    
    // Add default bunker relays as fallback
    allRelays.addAll(bunkerDefaultRelays);

    signingRequestsSubscription = ndk.requests.subscription(
      filters: [
        Filter(
          kinds: [24133],
          pTags: ndk.accounts.accounts.keys.toList(),
        ),
      ],
      explicitRelays: allRelays.toList(),
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
    // Use the NIP-46 parser to parse the request
    final nip46Request = await parseNip46Request(event);
    print(nip46Request);
    if (nip46Request == null) return;

    final account = ndk.accounts.accounts[nip46Request.remotePubkey];
    if (account == null) return;
    final signer = account.signer as Bip340EventSigner;

    try {
      // Handle different NIP-46 methods
      switch (nip46Request.command) {
        case Nip46Commands.signEvent:
          // Store request in database for user approval
          final store = sembast.intMapStoreFactory.store('pending_requests');
          await store.add(db, {
            'id': nip46Request.id,
            'method': nip46CommandToString(nip46Request.command),
            'params': nip46Request.params,
            'from_pubkey': nip46Request.clientPubkey,
            'target_pubkey': nip46Request.remotePubkey,
            'timestamp': DateTime.now().millisecondsSinceEpoch,
          });
          // TODO: Show notification to user
          break;

        case Nip46Commands.getPublicKey:
          await _sendResponse(
            nip46Request.clientPubkey,
            nip46Request.id,
            signer.publicKey,
            signer,
            nip46Request.useNip44,
          );
          break;

        case Nip46Commands.connect:
          // await _sendResponse(
          //   nip46Request.clientPubkey,
          //   nip46Request.id,
          //   'ack',
          //   signer,
          //   nip46Request.useNip44,
          // );
          break;

        case Nip46Commands.nip04Encrypt:
          if (nip46Request.params.length >= 2) {
            final thirdPartyPubkey = nip46Request.params[0];
            final plaintext = nip46Request.params[1];
            final encrypted = await signer.encrypt(plaintext, thirdPartyPubkey);
            await _sendResponse(
              nip46Request.clientPubkey,
              nip46Request.id,
              encrypted,
              signer,
              nip46Request.useNip44,
            );
          }
          break;

        case Nip46Commands.nip04Decrypt:
          if (nip46Request.params.length >= 2) {
            final thirdPartyPubkey = nip46Request.params[0];
            final ciphertext = nip46Request.params[1];
            final decrypted = await signer.decrypt(
              ciphertext,
              thirdPartyPubkey,
            );
            await _sendResponse(
              nip46Request.clientPubkey,
              nip46Request.id,
              decrypted,
              signer,
              nip46Request.useNip44,
            );
          }
          break;

        case Nip46Commands.nip44Encrypt:
          if (nip46Request.params.length >= 2) {
            final thirdPartyPubkey = nip46Request.params[0];
            final plaintext = nip46Request.params[1];
            final encrypted = await signer.encryptNip44(
              plaintext: plaintext,
              recipientPubKey: thirdPartyPubkey,
            );
            await _sendResponse(
              nip46Request.clientPubkey,
              nip46Request.id,
              encrypted,
              signer,
              nip46Request.useNip44,
            );
          }
          break;

        case Nip46Commands.nip44Decrypt:
          if (nip46Request.params.length >= 2) {
            final thirdPartyPubkey = nip46Request.params[0];
            final ciphertext = nip46Request.params[1];
            final decrypted = await signer.decryptNip44(
              ciphertext: ciphertext,
              senderPubKey: thirdPartyPubkey,
            );
            await _sendResponse(
              nip46Request.clientPubkey,
              nip46Request.id,
              decrypted,
              signer,
              nip46Request.useNip44,
            );
          }
          break;

        case Nip46Commands.ping:
          await _sendResponse(
            nip46Request.clientPubkey,
            nip46Request.id,
            'pong',
            signer,
            nip46Request.useNip44,
          );
      }
    } catch (e) {
      //
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
}
