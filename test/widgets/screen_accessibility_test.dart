import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ndk/ndk.dart';
import 'package:ndk/shared/nips/nip01/bip340.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/l10n/app_localizations_en.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/destinations/applications_view.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/screens/manage_app/manage_app_page.dart';
import 'package:peridot/screens/manage_app/switch_account_dialog.dart';
import 'package:peridot/screens/request/request_page.dart';
import 'package:peridot/screens/request/widgets/kind_3_widget.dart';
import 'package:peridot/theme.dart';
import 'package:peridot/widgets/not_found_page.dart';
import 'package:sembast/sembast_memory.dart';

import '../helpers/fixtures.dart';

final l10n = AppLocalizationsEn();
final firstUser = Bip340.generatePrivateKey().publicKey;
final secondUser = Bip340.generatePrivateKey().publicKey;

Widget testApp(Widget home, {ThemeData? theme}) {
  return MaterialApp(
    navigatorKey: AppRoutes.navigatorKey,
    theme: theme,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: home,
  );
}

// NPicture and NName query metadata from relays, and each query keeps a 5 s timeout timer.
Future<void> drainMetadataRequests(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox());
  await tester.pump(const Duration(seconds: 6));
}

void main() {
  var dbCount = 0;

  // Repository's dependencies are `static late final`: set once per file.
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
  });

  setUp(() async {
    Repository.to.db = await databaseFactoryMemory.openDatabase(
      'test_${dbCount++}',
    );
    Repository.to.usersPubkeys = {firstUser, secondUser};
    Repository.bunker.apps = [
      app(
        appPubkey: 'app1',
        bunkerPubkey: 'bunker',
        userPubkey: firstUser,
        name: 'Alpha',
      ),
      app(
        appPubkey: 'app2',
        bunkerPubkey: 'bunker',
        userPubkey: firstUser,
        name: 'Beta',
      ),
    ];
  });

  tearDown(() => Repository.to.db.close());

  group('sort buttons', () {
    testWidgets('announce the active sort and its direction', (tester) async {
      final handle = tester.ensureSemantics();
      final controller = HomeController();
      await tester.pumpWidget(
        testApp(Scaffold(body: ApplicationsView(controller: controller))),
      );

      SemanticsNode sortButton(String label) =>
          tester.getSemantics(find.widgetWithText(TextButton, label));

      expect(
        sortButton(l10n.sortByName),
        isSemantics(
          isButton: true,
          isSelected: true,
          value: l10n.sortAscending,
        ),
      );
      expect(
        sortButton(l10n.sortByLastUsed),
        isSemantics(isButton: true, isSelected: false, value: ''),
      );

      await tester.tap(find.text(l10n.sortByName));
      await tester.pump();

      expect(
        sortButton(l10n.sortByName),
        isSemantics(isSelected: true, value: l10n.sortDescending),
      );
      handle.dispose();
      await drainMetadataRequests(tester);
    });
  });

  group('request page', () {
    Future<void> pumpRequestPage(
      WidgetTester tester, {
      ThemeData? theme,
    }) async {
      await tester.runAsync(
        () => stringMapStoreFactory
            .store('requests')
            .record('req1')
            .put(
              Repository.to.db,
              bunkerRequest(id: 'req1', appPubkey: 'app1').toJson(),
            ),
      );
      await tester.pumpWidget(
        testApp(RequestPage(requestId: 'req1'), theme: theme),
      );
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      expect(find.text('Alpha'), findsOneWidget);
    }

    testWidgets('the app name is a button that names the route', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      await pumpRequestPage(tester);

      expect(
        tester.getSemantics(find.text('Alpha')),
        isSemantics(
          label: 'Alpha',
          tooltip: l10n.manageApplication,
          isButton: true,
          isHeader: true,
          isFocusable: true,
          hasTapAction: true,
        ),
      );
      handle.dispose();
      await drainMetadataRequests(tester);
    });

    testWidgets('an unknown request id says it was not found', (tester) async {
      await tester.pumpWidget(testApp(RequestPage(requestId: 'missing')));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      expect(tester.takeException(), isNull);
      expect(find.text(l10n.requestNotFound), findsOneWidget);
      expect(find.text(l10n.requestNotFoundMessage), findsOneWidget);
    });

    testWidgets('a request from a deleted app only offers to delete it', (
      tester,
    ) async {
      await tester.runAsync(
        () => stringMapStoreFactory
            .store('requests')
            .record('orphan')
            .put(
              Repository.to.db,
              bunkerRequest(id: 'orphan', appPubkey: 'deleted').toJson(),
            ),
      );
      await tester.pumpWidget(testApp(RequestPage(requestId: 'orphan')));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      expect(tester.takeException(), isNull);
      expect(find.text(l10n.deletedApp), findsOneWidget);
      expect(find.text(l10n.delete), findsOneWidget);
      expect(find.text(l10n.allowOnce), findsNothing);
      await tester.tap(find.text(l10n.deletedApp));
      expect(tester.takeException(), isNull);
    });

    for (final brightness in Brightness.values) {
      testWidgets('is readable in the ${brightness.name} theme', (
        tester,
      ) async {
        final handle = tester.ensureSemantics();
        await pumpRequestPage(tester, theme: appTheme(brightness));
        await expectLater(tester, meetsGuideline(textContrastGuideline));
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        handle.dispose();
        await drainMetadataRequests(tester);
        await drainMetadataRequests(tester);
      });
    }
  });

  for (final brightness in Brightness.values) {
    testWidgets('follow changes are readable in the ${brightness.name} theme', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        testApp(
          Scaffold(
            body: FollowChangesView(
              addedFollows: {firstUser},
              removedFollows: {secondUser},
            ),
          ),
          theme: appTheme(brightness),
        ),
      );

      expect(find.text(l10n.addingFollowsCount(1)), findsOneWidget);
      expect(find.text(l10n.removingFollowsCount(1)), findsOneWidget);
      await expectLater(tester, meetsGuideline(textContrastGuideline));
      handle.dispose();
      await drainMetadataRequests(tester);
    });
  }

  group('switch account dialog', () {
    testWidgets('exposes which account is selected', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(testApp(const SizedBox()));
      final controller = ManageAppController('app1');
      await tester.pumpWidget(
        testApp(Scaffold(body: SwitchAccountDialog(controller: controller))),
      );

      List<SemanticsNode> accounts() => [
        for (final element in find.byType(ListTile).evaluate())
          tester.getSemantics(find.byWidget(element.widget)),
      ];

      expect(accounts(), [
        isSemantics(
          isSelected: true,
          isInMutuallyExclusiveGroup: true,
          hasTapAction: true,
        ),
        isSemantics(
          isSelected: false,
          isInMutuallyExclusiveGroup: true,
          hasTapAction: true,
        ),
      ]);

      await tester.tap(find.byType(ListTile).last);
      await tester.pump();

      expect(accounts(), [
        isSemantics(isSelected: false),
        isSemantics(isSelected: true),
      ]);
      controller.dispose();
      handle.dispose();
      await drainMetadataRequests(tester);
    });
  });

  group('not found page', () {
    testWidgets('an unknown app says it was not found', (tester) async {
      await tester.pumpWidget(
        testApp(const ManageAppPage(appPubkey: 'missing')),
      );

      expect(tester.takeException(), isNull);
      expect(find.text(l10n.appNotFound), findsOneWidget);
      expect(find.text(l10n.appNotFoundMessage), findsOneWidget);
    });

    for (final brightness in Brightness.values) {
      testWidgets('is readable in the ${brightness.name} theme', (
        tester,
      ) async {
        final handle = tester.ensureSemantics();
        await tester.pumpWidget(
          testApp(
            NotFoundPage(
              title: l10n.requestNotFound,
              message: l10n.requestNotFoundMessage,
            ),
            theme: appTheme(brightness),
          ),
        );
        await expectLater(tester, meetsGuideline(textContrastGuideline));
        handle.dispose();
      });
    }
  });
}
