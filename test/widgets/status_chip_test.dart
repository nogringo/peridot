import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peridot/l10n/app_localizations_en.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/widgets/status_chip.dart';

import '../helpers/localized_context.dart';

void main() {
  final l10n = AppLocalizationsEn();

  final expectations = {
    BunkerRequestStatus.pending: (l10n.pending, Icons.access_time),
    BunkerRequestStatus.blocked: (l10n.blocked, Icons.block),
    BunkerRequestStatus.processed: (l10n.processed, Icons.check_circle),
  };

  for (final MapEntry(key: status, value: (label, icon))
      in expectations.entries) {
    testWidgets('shows the label and icon for ${status.name}', (tester) async {
      await tester.pumpWidget(localizedApp(StatusChip(status: status)));

      expect(find.text(label), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);
    });
  }
}
