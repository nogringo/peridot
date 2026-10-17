import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ndk/shared/nips/nip01/bip340.dart';
import 'package:nip49/nip49.dart';
import 'package:peridot/l10n/app_localizations_en.dart';
import 'package:peridot/screens/add_privkey/add_privkey_controller.dart';
import 'package:peridot/screens/add_privkey/add_privkey_page.dart';

import '../helpers/localized_context.dart';

void main() {
  late AddPrivkeyController controller;

  setUp(() => controller = AddPrivkeyController());
  tearDown(() => controller.dispose());

  test('detects an ncryptsec regardless of case', () {
    controller.privkeyFieldController.text = ' NCRYPTSEC1abc ';
    controller.onPrivkeyFieldChanged(controller.privkeyFieldController.text);

    expect(controller.isNcryptsec, isTrue);
    expect(controller.privkey, 'ncryptsec1abc');
  });

  test('decrypts a backup whose password has uppercase letters', () async {
    final privateKey = Bip340.generatePrivateKey().privateKey!;
    final ncryptsec = await Nip49.encrypt(privateKey, 'Correct Horse');

    controller.privkeyFieldController.text = ncryptsec;
    controller.ncryptsecPasswordFieldController.text = ' Correct Horse ';

    expect(controller.password, 'Correct Horse');
    expect(
      await Nip49.decrypt(controller.privkey, controller.password),
      privateKey,
    );
  });

  group('field errors', () {
    final l10n = AppLocalizationsEn();

    void enterKey(String key) {
      controller.privkeyFieldController.text = key;
      controller.onPrivkeyFieldChanged(key);
    }

    Future<String> newNcryptsec(WidgetTester tester) async {
      final ncryptsec = await tester.runAsync(
        () => Nip49.encrypt(Bip340.generatePrivateKey().privateKey!, 'right'),
      );
      return ncryptsec!;
    }

    final keyErrors = {
      '': l10n.privateKeyRequired,
      'npub1notakey': l10n.publicKeyEntered,
      'nsec1notakey': l10n.invalidNsec,
      'hello': l10n.unrecognizedKeyFormat,
      'abc123': l10n.wrongHexKeyLength(6),
      '0' * 64: l10n.invalidPrivateKey,
    };

    for (final MapEntry(key: input, value: message) in keyErrors.entries) {
      testWidgets('"$input" shows "$message" under the key field', (
        tester,
      ) async {
        final context = await pumpLocalizedContext(tester);
        enterKey(input);

        await controller.importPrivateKey(context);

        expect(controller.privkeyError, message);
        expect(controller.passwordError, isNull);
      });
    }

    testWidgets('editing the key clears its error', (tester) async {
      final context = await pumpLocalizedContext(tester);
      await controller.importPrivateKey(context);
      expect(controller.privkeyError, isNotNull);

      controller.onPrivkeyFieldChanged('a');

      expect(controller.privkeyError, isNull);
    });

    testWidgets('a wrong password shows an error under the password field', (
      tester,
    ) async {
      final context = await pumpLocalizedContext(tester);
      enterKey(await newNcryptsec(tester));
      controller.ncryptsecPasswordFieldController.text = 'wrong';

      await tester.runAsync(() => controller.importPrivateKey(context));

      expect(controller.passwordError, l10n.decryptionFailed);
      expect(controller.privkeyError, isNull);

      controller.onPasswordFieldChanged('wrong!');
      expect(controller.passwordError, isNull);
    });

    testWidgets('an empty password asks for the password', (tester) async {
      final context = await pumpLocalizedContext(tester);
      enterKey(await newNcryptsec(tester));

      await controller.importPrivateKey(context);

      expect(controller.passwordError, l10n.pleaseEnterPassword);
      expect(controller.privkeyError, isNull);
    });

    testWidgets('a corrupted ncryptsec shows an error under the key field', (
      tester,
    ) async {
      final context = await pumpLocalizedContext(tester);
      final ncryptsec = await newNcryptsec(tester);
      enterKey(ncryptsec.substring(0, ncryptsec.length - 3));
      controller.ncryptsecPasswordFieldController.text = 'right';

      await tester.runAsync(() => controller.importPrivateKey(context));

      expect(controller.privkeyError, l10n.invalidNcryptsec);
      expect(controller.passwordError, isNull);
    });

    testWidgets('the page shows the error text', (tester) async {
      await tester.pumpWidget(localizedApp(const AddPrivkeyPage()));
      await tester.enterText(find.byType(TextField).first, 'hello');
      await tester.tap(find.text(l10n.importKey));
      await tester.pump();

      expect(find.text(l10n.unrecognizedKeyFormat), findsOneWidget);
    });
  });
}
