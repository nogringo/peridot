import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:nip01/nip01.dart';
import 'package:peridot/config.dart';
import 'package:peridot/models/authorized_app.dart';
import 'package:peridot/utils/get_database.dart';
import 'package:peridot/utils/nip46_parser.dart';
import 'package:peridot/widgets/unknown_permission_dialog.dart';
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

    db = await getDatabase(databaseName);
    await loadSigners();
    await loadBunkerRelays();
    await loadAuthorizedApps();
    await listenSigningRequests();
  }

  Future<void> loadSigners() async {
    final storage = FlutterSecureStorage();

    final storedPrivateKeys = await storage.read(key: StorageKeys.privateKeys);
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
    await storage.write(
      key: StorageKeys.privateKeys,
      value: jsonEncode(privateKeys),
    );
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

  Future<void> updateAuthorizedApp(AuthorizedApp app) async {
    final store = sembast.intMapStoreFactory.store('authorized_apps');
    final records = await store.find(db);

    // Find the record with matching app
    for (final record in records) {
      final existingApp = AuthorizedApp.fromJson(record.value);
      if (existingApp.appPubkey == app.appPubkey &&
          existingApp.signerPubkey == app.signerPubkey) {
        // Update the record
        await store.record(record.key).put(db, app.toJson());
        break;
      }
    }

    // Reload authorized apps to update the UI
    await loadAuthorizedApps();
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
        Filter(kinds: [24133], pTags: ndk.accounts.accounts.keys.toList()),
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
    final nip46Request = await parseNip46Request(event);
    if (nip46Request == null) return;

    // Find the authorized app for this client
    final authorizedApp = authorizedApps.firstWhereOrNull(
      (app) =>
          app.appPubkey == nip46Request.clientPubkey &&
          app.signerPubkey == nip46Request.remotePubkey,
    );

    if (authorizedApp == null) return;

    final commandString = nip46CommandToString(nip46Request.command);
    PermissionStatus permissionStatus = authorizedApp.getPermissionStatus(
      commandString,
    );

    if (permissionStatus == PermissionStatus.unknown) {
      final bool? shouldAuthorize = await Get.dialog<bool>(
        UnknownPermissionDialog(app: authorizedApp, permission: commandString),
      );

      if (shouldAuthorize != null) {
        if (shouldAuthorize) {
          authorizedApp.authorizePermission(commandString);
          permissionStatus = PermissionStatus.authorized;
        } else {
          authorizedApp.blockPermission(commandString);
          permissionStatus = PermissionStatus.blocked;
        }
        // Update the app in storage
        await updateAuthorizedApp(authorizedApp);
      }
    }
  }
}
