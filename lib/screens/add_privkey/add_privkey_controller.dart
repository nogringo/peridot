import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nip01/nip01.dart';
import 'package:nip19/nip19.dart';
import 'package:nip49/nip49.dart';
import 'package:peridot/l10n/app_localizations.dart';
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
        addAccount(privateKey);
      } catch (e) {
        final l10n = AppLocalizations.of(Get.context!)!;
        showErrorToast(l10n.decryptionFailed);
      }
    } else if (privkey.startsWith("nsec1")) {
      final nsec = privkey;
      try {
        final privateKey = Nip19.nsecToHex(nsec);
        addAccount(privateKey);
      } catch (e) {
        final l10n = AppLocalizations.of(Get.context!)!;
        showErrorToast(l10n.invalidPrivateKey);
      }
    } else {
      try {
        addAccount(privkey);
      } catch (e) {
        final l10n = AppLocalizations.of(Get.context!)!;
        showErrorToast(l10n.invalidPrivateKey);
      }
    }
  }

  Future<void> addAccount(String privateKey) async {
    await Repository.to.addAccount(privateKey);
    Get.offAllNamed(AppRoutes.applications);
  }

  void createAccount() {
    addAccount(KeyPair.generate().privateKey);
  }
}
