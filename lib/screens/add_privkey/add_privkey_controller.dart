import 'package:flutter/widgets.dart';
import 'package:ndk/shared/nips/nip01/bip340.dart';
import 'package:nip49/nip49.dart';
import 'package:peridot/controllers/controller.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/utils/parse_private_key.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';

class AddPrivkeyController extends Controller {
  final privkeyFieldController = TextEditingController();
  final ncryptsecPasswordFieldController = TextEditingController();
  bool isNcryptsec = false;
  bool isPrivkeyVisible = false;
  bool isPasswordVisible = false;
  String? privkeyError;
  String? passwordError;

  String get privkey => privkeyFieldController.text.trim().toLowerCase();
  String get password => ncryptsecPasswordFieldController.text.trim();

  @override
  void dispose() {
    privkeyFieldController.dispose();
    ncryptsecPasswordFieldController.dispose();
    super.dispose();
  }

  void onPrivkeyFieldChanged(String value) {
    isNcryptsec = privkey.startsWith("ncryptsec1");
    privkeyError = null;
    passwordError = null;
    update();
  }

  void onPasswordFieldChanged(String value) {
    if (passwordError == null) return;
    passwordError = null;
    update();
  }

  void togglePrivkeyVisibility() {
    isPrivkeyVisible = !isPrivkeyVisible;
    update();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  Future<void> importPrivateKey(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final String input;
    if (isNcryptsec) {
      if (password.isEmpty) {
        passwordError = l10n.pleaseEnterPassword;
        update();
        return;
      }
      // Nip49 throws ArgumentError for a wrong password, bech32 errors for a malformed ncryptsec.
      try {
        input = await Nip49.decrypt(privkey, password);
      } on ArgumentError {
        passwordError = l10n.decryptionFailed;
        update();
        return;
      } catch (e) {
        privkeyError = l10n.invalidNcryptsec;
        update();
        return;
      }
    } else {
      input = privkey;
    }

    final String privateKey;
    try {
      privateKey = parsePrivateKey(input);
    } on InvalidPrivateKeyException catch (e) {
      privkeyError = _privateKeyErrorMessage(l10n, e);
      update();
      return;
    }
    await addAccount(privateKey);
  }

  String _privateKeyErrorMessage(
    AppLocalizations l10n,
    InvalidPrivateKeyException e,
  ) {
    return switch (e.error) {
      PrivateKeyError.empty => l10n.privateKeyRequired,
      PrivateKeyError.publicKey => l10n.publicKeyEntered,
      PrivateKeyError.invalidNsec => l10n.invalidNsec,
      PrivateKeyError.notHex => l10n.unrecognizedKeyFormat,
      PrivateKeyError.wrongLength => l10n.wrongHexKeyLength(e.input.length),
      PrivateKeyError.outOfRange => l10n.invalidPrivateKey,
    };
  }

  Future<void> addAccount(String privateKey) async {
    await Repository.to.addAccount(privateKey);
    AppRoutes.navigator.pushNamedAndRemoveUntil(
      AppRoutes.applications,
      (_) => false,
    );
  }

  void createAccount() {
    addAccount(Bip340.generatePrivateKey().privateKey!);
  }
}
