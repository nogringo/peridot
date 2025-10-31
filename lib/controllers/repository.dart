import 'dart:async';
import 'dart:convert';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:nip01/nip01.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/config.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/services/notification_service.dart';
import 'package:peridot/utils/get_database.dart';
import 'package:sembast/sembast.dart' as sembast;

// TODO add an option on the settings page to remove the client tag
// TODO be able to edit the json
// TODO be able to view processed requests
// TODO show a diferent request screeen for know kinds like 0, 3, 5
// TODO floating buttons on requests

class Repository extends GetxController {
  static Repository get to => Get.find();
  static Ndk get ndk => Get.find();
  static Bunker get bunker => Get.find();

  bool isAppLoaded = false;
  RxSet<String> usersPubkeys = RxSet<String>({});

  StreamSubscription<Nip46Request>? pendingRequestsSub;
  StreamSubscription<Nip46Request>? blockedRequestsSub;
  StreamSubscription<Nip46Request>? processedRequestsSub;

  late sembast.Database db;

  Future<void> loadApp() async {
    if (isAppLoaded) return;
    isAppLoaded = true;

    db = await getDatabase(databaseName);
    await loadBunkerState();
    update();

    bunker.start();

    pendingRequestsSub = bunker.pendingRequestsStream.listen((req) {
      final reqObj = BunkerRequest(
        originalRequest: req,
        status: BunkerRequestStatus.pending,
      );
      var store = sembast.stringMapStoreFactory.store('requests');
      store.record(req.id).put(db, reqObj.toJson());

      final app = bunker.getApp(req);

      if (Get.context != null) {
        final l10n = AppLocalizations.of(Get.context!)!;
        final appName = app?.name ?? l10n.deletedApp;
        NotificationService.to.showNotification(
          title: l10n.newPendingRequest,
          body: l10n.newPendingRequestBody(appName),
        );
      }
      update();
    });

    blockedRequestsSub = bunker.blockedRequestsStream.listen((req) {
      final reqObj = BunkerRequest(
        originalRequest: req,
        status: BunkerRequestStatus.blocked,
      );
      var store = sembast.stringMapStoreFactory.store('requests');
      store.record(req.id).put(db, reqObj.toJson());
    });

    processedRequestsSub = bunker.processedRequestsStream.listen((req) async {
      final reqObj = BunkerRequest(
        originalRequest: req,
        status: BunkerRequestStatus.processed,
      );
      var store = sembast.stringMapStoreFactory.store('requests');
      await store.record(req.id).put(db, reqObj.toJson());
    });
  }

  Future<void> addAccount(String privateKey) async {
    final keyPair = KeyPair.fromPrivateKey(privateKey: privateKey);
    usersPubkeys.add(keyPair.publicKey);
    bunker.addPrivateKey(privateKey);
    update();
    await saveBunkerState();
  }

  Future<void> removeAccount(String pubkey) async {
    usersPubkeys.remove(pubkey);
    bunker.removePrivateKey(pubkey);
    update();
    await saveBunkerState();
  }

  Future<void> removeApp(App app) async {
    bunker.removeApp(app);
    update();
    var store = sembast.stringMapStoreFactory.store('apps');
    await store.record(app.bunkerPubkey).delete(db);
  }

  Future<void> saveApp(App app) async {
    var store = sembast.stringMapStoreFactory.store('apps');
    await store.record(app.bunkerPubkey).put(db, app.toJson());
  }

  Future<void> saveApps() async {
    await Future.wait(bunker.apps.map((app) => saveApp(app)));
  }

  Future<void> loadApps() async {
    var store = sembast.stringMapStoreFactory.store('apps');
    final records = await store.find(db);
    bunker.apps = records.map((record) => App.fromJson(record.value)).toList();
  }

  Future<void> saveRelays() async {
    var store = sembast.StoreRef.main();
    await store
        .record("default_bunker_relays")
        .put(db, bunker.defaultBunkerRelays);
  }

  Future<void> loadRelays() async {
    var store = sembast.StoreRef.main();
    final storedRelays = await store.record("default_bunker_relays").get(db);
    if (storedRelays == null) return;
    bunker.defaultBunkerRelays = List<String>.from(storedRelays as List);
  }

  Future<void> saveUsersPubkeys() async {
    var store = sembast.StoreRef.main();
    await store.record("user_pubkeys").put(db, usersPubkeys.toList());
  }

  Future<void> loadUsersPubkeys() async {
    var store = sembast.StoreRef.main();
    final storedUsersPubkeys = await store.record("user_pubkeys").get(db);
    if (storedUsersPubkeys == null) return;
    usersPubkeys.addAll(List<String>.from(storedUsersPubkeys as List));
  }

  Future<void> saveBunkerState() async {
    final storage = FlutterSecureStorage();

    await Future.wait([
      storage.write(
        key: StorageKeys.privateKeys,
        value: jsonEncode(bunker.privateKeys),
      ),

      saveApps(),
      saveRelays(),
      saveUsersPubkeys(),
    ]);
  }

  Future<void> loadBunkerState() async {
    final storage = FlutterSecureStorage();
    final storedPrivateKeys = await storage.read(key: StorageKeys.privateKeys);
    if (storedPrivateKeys == null) return;
    List<String> privateKeys = List<String>.from(jsonDecode(storedPrivateKeys));
    for (var privateKey in privateKeys) {
      bunker.addPrivateKey(privateKey);
    }

    await Future.wait([loadApps(), loadRelays(), loadUsersPubkeys()]);
  }
}
