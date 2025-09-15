import 'package:flutter/services.dart';
import 'package:peridot/utils/toast_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:nip19/nip19.dart';
import 'package:nip49/nip49.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';

class BackupAccountController extends GetxController {
  static BackupAccountController get to => Get.find();

  final pubkey = Get.parameters["pubkey"];
  final passwordFieldController = TextEditingController();
  RxBool canEncrypt = false.obs;

  void onPasswordFieldChanged(String value) {
    canEncrypt.value = value.trim().isNotEmpty;
  }

  Future<void> copySecureBackup() async {
    final password = passwordFieldController.text.trim();
    if (password.isEmpty) {
      final l10n = AppLocalizations.of(Get.context!)!;
      toastification.show(
        context: Get.context!,
        title: Text(l10n.pleaseEnterPassword),
        type: ToastificationType.error,
        autoCloseDuration: Duration(seconds: 5),
        alignment: Alignment.bottomRight,
        showProgressBar: true,
      );
      return;
    }

    try {
      // Get the account and its private key
      final account = Repository.ndk.accounts.accounts[pubkey];
      if (account == null) {
        throw Exception('Account not found');
      }

      final signer = account.signer as Bip340EventSigner;
      final privateKey = signer.privateKey;

      // Encrypt with NIP-49
      final encryptedKey = await Nip49.encrypt(privateKey!, password);

      // Copy to clipboard
      await Clipboard.setData(ClipboardData(text: encryptedKey));
      showCopyToast();

      // Clear password field for security
      passwordFieldController.clear();
      canEncrypt.value = false;
    } catch (e) {
      final l10n = AppLocalizations.of(Get.context!)!;
      toastification.show(
        context: Get.context!,
        title: Text(l10n.backupFailed),
        description: Text(e.toString()),
        type: ToastificationType.error,
        autoCloseDuration: Duration(seconds: 5),
        alignment: Alignment.bottomRight,
        showProgressBar: true,
      );
    }
  }

  Future<void> copyUnsecureBackup() async {
    try {
      // Get the account and its private key
      final account = Repository.ndk.accounts.accounts[pubkey];
      if (account == null) {
        throw Exception('Account not found');
      }

      final signer = account.signer as Bip340EventSigner;
      final privateKey = signer.privateKey;

      // Convert to nsec format
      final nsec = Nip19.nsecFromHex(privateKey!);

      // Copy to clipboard
      await Clipboard.setData(ClipboardData(text: nsec));
      showCopyToast();
    } catch (e) {
      final l10n = AppLocalizations.of(Get.context!)!;
      toastification.show(
        context: Get.context!,
        title: Text(l10n.copyFailed),
        description: Text(e.toString()),
        type: ToastificationType.error,
        autoCloseDuration: Duration(seconds: 5),
        alignment: Alignment.bottomRight,
        showProgressBar: true,
      );
    }
  }

  @override
  void onClose() {
    passwordFieldController.dispose();
    super.onClose();
  }
}
