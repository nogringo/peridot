import 'package:flutter_test/flutter_test.dart';
import 'package:ndk/shared/nips/nip01/bip340.dart';
import 'package:nip49/nip49.dart';
import 'package:peridot/screens/add_privkey/add_privkey_controller.dart';

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
}
