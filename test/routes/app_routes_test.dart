import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ndk/ndk.dart';
import 'package:ndk/shared/nips/nip01/bip340.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/l10n/app_localizations_en.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/manage_app/manage_app_page.dart';
import 'package:peridot/screens/request/request_page.dart';
import 'package:peridot/screens/settings/controllers/settings_controller.dart';
import 'package:peridot/screens/settings/settings_page.dart';
import 'package:peridot/services/notification_service.dart';
import 'package:sembast/sembast_memory.dart';

import '../helpers/fixtures.dart';

final l10n = AppLocalizationsEn();
final user = Bip340.generatePrivateKey().publicKey;
final appPubkey = Bip340.generatePrivateKey().publicKey;
final bunkerPubkey = Bip340.generatePrivateKey().publicKey;

void main() {
  var dbCount = 0;

  setUpAll(() {
    final ndk = Ndk(
      NdkConfig(
        eventVerifier: Bip340EventVerifier(),
        cache: MemCacheManager(),
        bootstrapRelays: const [],
      ),
    );
    Repository.ndk = ndk;
    Repository.ndkFlutter = NdkFlutter(ndk: ndk);
    Repository.bunker = Bunker(ndk: ndk, defaultBunkerRelays: const []);
    Repository.to = Repository();
    SettingsController.to = SettingsController();
    NotificationService.to = NotificationService();
  });

  setUp(() async {
    Repository.to.db = await databaseFactoryMemory.openDatabase(
      'routes_${dbCount++}',
    );
    Repository.to.usersPubkeys = {user};
    Repository.bunker.apps = [
      app(appPubkey: appPubkey, bunkerPubkey: bunkerPubkey, userPubkey: user),
    ];
  });

  tearDown(() => Repository.to.db.close());

  Future<void> pumpRouter(
    WidgetTester tester, {
    required Size size,
    required String location,
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.runAsync(
      () => stringMapStoreFactory
          .store('requests')
          .record('req1')
          .put(
            Repository.to.db,
            bunkerRequest(id: 'req1', appPubkey: appPubkey).toJson(),
          ),
    );
    AppRoutes.router.go(location);
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: AppRoutes.router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
    await settle(tester);
  }

  // NPicture and NName query metadata from relays, and each query keeps a 5 s timeout timer.
  Future<void> unmount(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 6));
  }

  group('small screen', () {
    const size = Size(400, 800);

    testWidgets('shows the bottom bar on a tab root only', (tester) async {
      await pumpRouter(tester, size: size, location: AppRoutes.requests);
      expect(find.byType(NavigationBar), findsOneWidget);

      AppRoutes.router.go(AppRoutes.pendingRequest('req1'));
      await settle(tester);
      expect(find.byType(RequestPage), findsOneWidget);
      expect(find.byType(NavigationBar), findsNothing);

      await tester.tap(find.byType(BackButton));
      await settle(tester);
      expect(find.byType(RequestPage), findsNothing);
      expect(find.byType(NavigationBar), findsOneWidget);
      await unmount(tester);
    });

    testWidgets('settings go back to the last tab', (tester) async {
      await pumpRouter(tester, size: size, location: AppRoutes.logs);

      await tester.tap(find.byTooltip(l10n.settings));
      await settle(tester);
      expect(find.byType(SettingsPage), findsOneWidget);
      expect(find.byType(NavigationBar), findsNothing);

      await tester.tap(find.byType(BackButton));
      await settle(tester);
      expect(AppRoutes.router.state.uri.path, AppRoutes.logs);
      await unmount(tester);
    });
  });

  group('large screen', () {
    const size = Size(1200, 800);

    testWidgets('keeps the rail next to a detail page', (tester) async {
      await pumpRouter(
        tester,
        size: size,
        location: AppRoutes.manageApp(appPubkey),
      );

      expect(find.byType(NavigationRail), findsOneWidget);
      expect(find.byType(ManageAppPage), findsOneWidget);
      final rail = tester.widget<NavigationRail>(find.byType(NavigationRail));
      expect(rail.selectedIndex, 0);
      await unmount(tester);
    });

    testWidgets('each tab keeps its own page stack', (tester) async {
      await pumpRouter(
        tester,
        size: size,
        location: AppRoutes.loggedRequest('req1'),
      );
      expect(find.byType(RequestPage), findsOneWidget);

      await tester.tap(find.text(l10n.applications));
      await settle(tester);
      expect(find.byType(RequestPage), findsNothing);

      await tester.tap(find.text(l10n.logs));
      await settle(tester);
      expect(find.byType(RequestPage), findsOneWidget);
      expect(AppRoutes.router.state.uri.path, AppRoutes.loggedRequest('req1'));
      await unmount(tester);
    });
  });
}

Future<void> settle(WidgetTester tester) async {
  for (var i = 0; i < 10; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}
