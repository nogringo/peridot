import 'package:flutter_test/flutter_test.dart';
import 'package:peridot/l10n/app_localizations_en.dart';
import 'package:peridot/utils/nostr_kinds.dart';

import '../helpers/localized_context.dart';

void main() {
  final l10n = AppLocalizationsEn();

  testWidgets('describes known kinds', (tester) async {
    final context = await pumpLocalizedContext(tester);

    expect(NostrKinds.getDescription(context, 0), l10n.userMetadata);
    expect(NostrKinds.getDescription(context, 1), l10n.shortTextNote);
    expect(NostrKinds.getDescription(context, 39701), l10n.webBookmarks);
  });

  testWidgets('describes kind ranges, bounds included', (tester) async {
    final context = await pumpLocalizedContext(tester);

    expect(NostrKinds.getDescription(context, 5000), l10n.jobRequest);
    expect(NostrKinds.getDescription(context, 5999), l10n.jobRequest);
    expect(NostrKinds.getDescription(context, 6000), l10n.jobResult);
    expect(NostrKinds.getDescription(context, 6999), l10n.jobResult);
    expect(NostrKinds.getDescription(context, 9000), l10n.groupControlEvent);
    expect(NostrKinds.getDescription(context, 9030), l10n.groupControlEvent);
  });

  testWidgets('falls back to the kind number', (tester) async {
    final context = await pumpLocalizedContext(tester);

    expect(
      NostrKinds.getDescription(context, 9031),
      l10n.unknownEventKind(9031),
    );
    expect(NostrKinds.getDescription(context, 4999), 'Event Kind 4999');
  });
}
