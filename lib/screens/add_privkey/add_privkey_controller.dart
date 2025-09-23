import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nip01/nip01.dart';
import 'package:nip19/nip19.dart';
import 'package:nip49/nip49.dart';
import 'package:peridot/utils/toast_utils.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';

class AddPrivkeyController extends GetxController {
  static AddPrivkeyController get to => Get.find();

  final privkeyFieldController = TextEditingController();
  final ncryptsecPasswordFieldController = TextEditingController();
  RxBool isNcryptsec = false.obs;

  String get privkey => privkeyFieldController.text.trim().toLowerCase();
  String get password =>
      ncryptsecPasswordFieldController.text.trim().toLowerCase();

  void onPrivkeyFieldChanged(String value) {
    isNcryptsec.value = privkey.startsWith("ncryptsec1");
  }

  void importPrivateKey() async {
    if (isNcryptsec.value) {
      final ncryptsec = privkey;
      try {
        final privateKey = await Nip49.decrypt(ncryptsec, password);
        final keyPair = KeyPair.fromPrivateKey(privateKey: privateKey);
        addAccount(keyPair);
      } catch (e) {
        showErrorToast("Sorry, we weren't able to decrypt your private key with that password.");
      }
    } else if (privkey.startsWith("nsec1")) {
      final nsec = privkey;
      try {
        final privateKey = Nip19.nsecToHex(nsec);
        final keyPair = KeyPair.fromPrivateKey(privateKey: privateKey);
        addAccount(keyPair);
      } catch (e) {
        showErrorToast("Sorry, it looks like that private key is invalid.");
      }
    } else {
      try {
        final keyPair = KeyPair.fromPrivateKey(privateKey: privkey);
        addAccount(keyPair);
      } catch (e) {
        showErrorToast("Sorry, it looks like that private key is invalid.");
      }
    }
  }

  Future<void> addAccount(KeyPair keypair) async {
    await Repository.to.addAccount(keypair);
    Get.offAllNamed(AppRoutes.applications);
  }

  void createAccount() {
    addAccount(KeyPair.generate());
  }
}
