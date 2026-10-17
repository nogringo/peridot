import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peridot/l10n/app_localizations.dart';

Widget localizedApp(Widget child) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}

Future<BuildContext> pumpLocalizedContext(WidgetTester tester) async {
  late BuildContext context;
  await tester.pumpWidget(
    localizedApp(
      Builder(
        builder: (c) {
          context = c;
          return const SizedBox();
        },
      ),
    ),
  );
  return context;
}
