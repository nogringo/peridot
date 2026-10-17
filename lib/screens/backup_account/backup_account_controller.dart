import 'package:flutter/services.dart';
import 'package:peridot/utils/toast_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:toastification/toastification.dart';
import 'package:ndk/ndk.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:nip49/nip49.dart';
import 'package:peridot/controllers/controller.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';

class BackupAccountController extends Controller {
  final String pubkey;
  final passwordFieldController = TextEditingController();
  bool canEncrypt = false;

  BackupAccountController(this.pubkey);

  void onPasswordFieldChanged(String value) {
    canEncrypt = value.trim().isNotEmpty;
    update();
  }

  Future<void> copySecureBackup(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final password = passwordFieldController.text.trim();
    if (password.isEmpty) {
      toastification.show(
        context: context,
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

      final signer = account.signer as NdkEventSigner;
      final privateKey = signer.privateKey;

      // Encrypt with NIP-49
      final encryptedKey = await Nip49.encrypt(privateKey!, password);

      // Copy to clipboard
      await Clipboard.setData(ClipboardData(text: encryptedKey));
      showCopyToast();

      // Clear password field for security
      passwordFieldController.clear();
      canEncrypt = false;
      update();
    } catch (e) {
      if (!context.mounted) return;
      toastification.show(
        context: context,
        title: Text(l10n.backupFailed),
        description: Text(e.toString()),
        type: ToastificationType.error,
        autoCloseDuration: Duration(seconds: 5),
        alignment: Alignment.bottomRight,
        showProgressBar: true,
      );
    }
  }

  Future<void> copyUnsecureBackup(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      // Get the account and its private key
      final account = Repository.ndk.accounts.accounts[pubkey];
      if (account == null) {
        throw Exception('Account not found');
      }

      final signer = account.signer as NdkEventSigner;
      final privateKey = signer.privateKey;

      // Convert to nsec format
      final nsec = Nip19.encodePrivateKey(privateKey!);

      // Copy to clipboard
      await Clipboard.setData(ClipboardData(text: nsec));
      showCopyToast();
    } catch (e) {
      if (!context.mounted) return;
      toastification.show(
        context: context,
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
  void dispose() {
    passwordFieldController.dispose();
    super.dispose();
  }
}
