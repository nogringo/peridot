import 'package:flutter_test/flutter_test.dart';
import 'package:peridot/l10n/app_localizations_en.dart';
import 'package:peridot/utils/translate_permission.dart';

import '../helpers/localized_context.dart';

void main() {
  final l10n = AppLocalizationsEn();

  testWidgets('translates NIP-46 commands', (tester) async {
    final context = await pumpLocalizedContext(tester);

    expect(translatePermission(context, 'connect'), l10n.permission_connect);
    expect(
      translatePermission(context, 'get_public_key'),
      l10n.permission_get_public_key,
    );
    expect(
      translatePermission(context, 'nip44_decrypt'),
      l10n.permission_nip44_decrypt,
    );
  });

  testWidgets('accepts the permission_ prefix', (tester) async {
    final context = await pumpLocalizedContext(tester);

    expect(
      translatePermission(context, 'permission_ping'),
      l10n.permission_ping,
    );
  });

  testWidgets('appends the kind description to sign_event', (tester) async {
    final context = await pumpLocalizedContext(tester);

    expect(
      translatePermission(context, 'sign_event:1'),
      '${l10n.permission_sign_event}: ${l10n.shortTextNote}',
    );
    expect(
      translatePermission(context, 'sign_event:31337'),
      '${l10n.permission_sign_event}: ${l10n.unknownEventKind(31337)}',
    );
  });

  testWidgets('keeps a non numeric suffix in parentheses', (tester) async {
    final context = await pumpLocalizedContext(tester);

    expect(
      translatePermission(context, 'sign_event:kind'),
      '${l10n.permission_sign_event} (kind)',
    );
  });

  testWidgets('title cases unknown permissions', (tester) async {
    final context = await pumpLocalizedContext(tester);

    expect(translatePermission(context, 'switch_relays'), 'Switch Relays');
    expect(translatePermission(context, 'GET_RELAYS_V2'), 'Get Relays V2');
  });
}
