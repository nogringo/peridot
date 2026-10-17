import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ndk/ndk.dart';
import 'package:ndk/shared/nips/nip01/bip340.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/config.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:sembast/sembast_memory.dart';

import '../helpers/fixtures.dart';

final requestsStore = stringMapStoreFactory.store('requests');
final appsStore = stringMapStoreFactory.store('apps');

void main() {
  late Ndk ndk;
  late Repository repository;
  var dbCount = 0;

  // Repository.ndk and Repository.bunker are `static late final`: set once per file.
  setUpAll(() {
    ndk = Ndk(
      NdkConfig(
        eventVerifier: Bip340EventVerifier(),
        cache: MemCacheManager(),
        bootstrapRelays: const [],
      ),
    );
    Repository.ndk = ndk;
    Repository.bunker = Bunker(ndk: ndk, defaultBunkerRelays: const []);
  });

  tearDownAll(() => ndk.destroy());

  Repository newRepository(Database db) => Repository()..db = db;

  setUp(() async {
    FlutterSecureStorage.setMockInitialValues({});
    final bunker = Repository.bunker;
    for (final privateKey in bunker.privateKeys) {
      bunker.removePrivateKey(Bip340.getPublicKey(privateKey));
    }
    bunker.apps = [];
    bunker.defaultBunkerRelays = [];

    final db = await databaseFactoryMemory.openDatabase('test_${dbCount++}');
    repository = newRepository(db);
  });

  tearDown(() => repository.db.close());

  group('accounts', () {
    test('addAccount registers the key and persists it', () async {
      final keyPair = Bip340.generatePrivateKey();

      await repository.addAccount(keyPair.privateKey!);

      expect(repository.usersPubkeys, {keyPair.publicKey});
      expect(Repository.bunker.privateKeys, [keyPair.privateKey]);
      expect(ndk.accounts.accounts.keys, contains(keyPair.publicKey));

      final stored = await const FlutterSecureStorage().read(
        key: StorageKeys.privateKeys,
      );
      expect(jsonDecode(stored!), [keyPair.privateKey]);
    });

    test('removeAccount forgets the key and persists it', () async {
      final kept = Bip340.generatePrivateKey();
      final removed = Bip340.generatePrivateKey();
      await repository.addAccount(kept.privateKey!);
      await repository.addAccount(removed.privateKey!);

      await repository.removeAccount(removed.publicKey);

      expect(repository.usersPubkeys, {kept.publicKey});
      expect(Repository.bunker.privateKeys, [kept.privateKey]);
      expect(ndk.accounts.accounts.keys, isNot(contains(removed.publicKey)));

      final stored = await const FlutterSecureStorage().read(
        key: StorageKeys.privateKeys,
      );
      expect(jsonDecode(stored!), [kept.privateKey]);
    });
  });

  group('bunker state', () {
    test('a new repository restores what the previous one saved', () async {
      final keyPair = Bip340.generatePrivateKey();
      await repository.addAccount(keyPair.privateKey!);
      Repository.bunker.apps = [
        app(appPubkey: 'app1', bunkerPubkey: 'bunker1', name: 'Coracle'),
      ];
      Repository.bunker.defaultBunkerRelays = ['wss://relay.example.com'];
      repository.appLastUsed = {'app1': 1700000000000};
      await repository.saveBunkerState();
      await repository.saveAppLastUsed();

      Repository.bunker.removePrivateKey(keyPair.publicKey);
      Repository.bunker.apps = [];
      Repository.bunker.defaultBunkerRelays = [];

      final restored = newRepository(repository.db);
      await restored.loadBunkerState();

      expect(restored.usersPubkeys, {keyPair.publicKey});
      expect(restored.appLastUsed, {'app1': 1700000000000});
      expect(Repository.bunker.privateKeys, [keyPair.privateKey]);
      expect(Repository.bunker.defaultBunkerRelays, [
        'wss://relay.example.com',
      ]);
      expect(Repository.bunker.apps, hasLength(1));
      final restoredApp = Repository.bunker.apps.single;
      expect(restoredApp.appPubkey, 'app1');
      expect(restoredApp.bunkerPubkey, 'bunker1');
      expect(restoredApp.name, 'Coracle');
      expect(restoredApp.permissions.single.command, 'ping');
    });

    test('loading with nothing saved leaves the bunker empty', () async {
      await repository.loadBunkerState();

      expect(repository.usersPubkeys, isEmpty);
      expect(Repository.bunker.privateKeys, isEmpty);
      expect(Repository.bunker.apps, isEmpty);
    });
  });

  group('requests', () {
    Future<void> putRequest(BunkerRequest request) {
      return requestsStore
          .record(request.originalRequest.id)
          .put(repository.db, request.toJson());
    }

    setUp(() async {
      await putRequest(bunkerRequest(id: 'pending1', appPubkey: 'app1'));
      await putRequest(
        bunkerRequest(
          id: 'blocked1',
          appPubkey: 'app1',
          status: BunkerRequestStatus.blocked,
        ),
      );
      await putRequest(
        bunkerRequest(
          id: 'processed1',
          appPubkey: 'app1',
          status: BunkerRequestStatus.processed,
        ),
      );
      await putRequest(bunkerRequest(id: 'pending2', appPubkey: 'app2'));
    });

    test('getPendingAndBlockedRequests skips processed requests', () async {
      final requests = await repository.getPendingAndBlockedRequests();

      expect(
        requests.map((r) => r.originalRequest.id),
        unorderedEquals(['pending1', 'blocked1', 'pending2']),
      );
    });

    test('getPendingAndBlockedRequests filters by app', () async {
      final requests = await repository.getPendingAndBlockedRequests(
        appPubkey: 'app1',
      );

      expect(
        requests.map((r) => r.originalRequest.id),
        unorderedEquals(['pending1', 'blocked1']),
      );
    });

    test('removeApp deletes the app and only its requests', () async {
      final removed = app(appPubkey: 'app1', bunkerPubkey: 'bunker1');
      final kept = app(appPubkey: 'app2', bunkerPubkey: 'bunker2');
      Repository.bunker.apps = [removed, kept];
      await repository.saveApps();

      await repository.removeApp(removed);

      expect(Repository.bunker.apps, [kept]);
      expect(await appsStore.record('bunker1').exists(repository.db), isFalse);
      expect(await appsStore.record('bunker2').exists(repository.db), isTrue);
      final remaining = await requestsStore.findKeys(repository.db);
      expect(remaining, ['pending2']);
    });
  });
}
