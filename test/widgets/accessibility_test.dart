import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/screens/home/widgets/no_apps_view.dart';
import 'package:peridot/screens/home/widgets/no_requests_view.dart';
import 'package:peridot/theme.dart';
import 'package:peridot/utils/toast_utils.dart';
import 'package:peridot/widgets/status_chip.dart';
import 'package:peridot/widgets/trust_level_options_view.dart';
import 'package:toastification/toastification.dart';

import '../helpers/localized_context.dart';

Future<void> expectAccessibleScreen(WidgetTester tester) async {
  await expectLater(tester, meetsGuideline(textContrastGuideline));
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
}

Widget trustLevelOptions({
  required AuthorisationMode appMode,
  required void Function(AuthorisationMode) onSelected,
}) {
  return Column(
    children: [
      for (final mode in AuthorisationMode.values)
        TrustLevelOptionsView(
          appMode: appMode,
          optionMode: mode,
          onSelected: () => onSelected(mode),
        ),
    ],
  );
}

void main() {
  for (final brightness in Brightness.values) {
    group('${brightness.name} theme', () {
      final theme = appTheme(brightness);

      for (final view in const [NoAppsView(), NoRequestsView()]) {
        testWidgets('${view.runtimeType} is readable', (tester) async {
          final handle = tester.ensureSemantics();
          await tester.pumpWidget(localizedApp(view, theme: theme));
          await expectAccessibleScreen(tester);
          handle.dispose();
        });
      }

      testWidgets('status chips are readable', (tester) async {
        final handle = tester.ensureSemantics();
        await tester.pumpWidget(
          localizedApp(
            Column(
              children: [
                for (final status in BunkerRequestStatus.values)
                  StatusChip(status: status),
              ],
            ),
            theme: theme,
          ),
        );
        await expectAccessibleScreen(tester);
        handle.dispose();
      });

      testWidgets('trust level options are readable', (tester) async {
        final handle = tester.ensureSemantics();
        await tester.pumpWidget(
          localizedApp(
            trustLevelOptions(
              appMode: AuthorisationMode.allwaysAsk,
              onSelected: (_) {},
            ),
            theme: theme,
          ),
        );
        await expectAccessibleScreen(tester);
        handle.dispose();
      });
    });
  }

  group('trust level options', () {
    testWidgets('expose the selected option and tappable alternatives', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        localizedApp(
          trustLevelOptions(
            appMode: AuthorisationMode.allwaysAsk,
            onSelected: (_) {},
          ),
        ),
      );

      final tiles = find.byType(ListTile);
      expect(
        tester.getSemantics(tiles.at(0)),
        isSemantics(
          isSelected: true,
          isInMutuallyExclusiveGroup: true,
          hasTapAction: false,
        ),
      );
      for (final index in [1, 2]) {
        expect(
          tester.getSemantics(tiles.at(index)),
          isSemantics(
            isButton: true,
            isSelected: false,
            isInMutuallyExclusiveGroup: true,
            hasTapAction: true,
          ),
        );
      }
      handle.dispose();
    });

    testWidgets('can be selected with the keyboard', (tester) async {
      AuthorisationMode? selected;
      await tester.pumpWidget(
        localizedApp(
          trustLevelOptions(
            appMode: AuthorisationMode.allwaysAsk,
            onSelected: (mode) => selected = mode,
          ),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      expect(selected, AuthorisationMode.fullyTrust);
    });
  });

  testWidgets('error toasts are announced and readable', (tester) async {
    final announcements = <Map<Object?, Object?>>[];
    tester.binding.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(
      SystemChannels.accessibility,
      (message) async {
        announcements.add(message! as Map<Object?, Object?>);
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger
          .setMockDecodedMessageHandler<Object?>(
            SystemChannels.accessibility,
            null,
          ),
    );

    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
      ToastificationWrapper(child: localizedApp(const SizedBox())),
    );
    showErrorToast('Send failed', tester.element(find.byType(SizedBox)));
    // One frame adds the toast to its list, the next starts its entrance animation.
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Send failed'), findsOneWidget);
    expect(
      announcements.map((a) => (a['data'] as Map)['message']),
      contains('Send failed'),
    );
    await expectLater(tester, meetsGuideline(textContrastGuideline));

    handle.dispose();
    await tester.pump(const Duration(seconds: 6));
  });
}
