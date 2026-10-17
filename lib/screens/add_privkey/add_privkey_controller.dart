import 'package:flutter/widgets.dart';
import 'package:ndk/shared/nips/nip01/bip340.dart';
import 'package:nip49/nip49.dart';
import 'package:peridot/controllers/controller.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/utils/parse_private_key.dart';
import 'package:peridot/utils/toast_utils.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';

class AddPrivkeyController extends Controller {
  final privkeyFieldController = TextEditingController();
  final ncryptsecPasswordFieldController = TextEditingController();
  bool isNcryptsec = false;
  bool isPrivkeyVisible = false;
  bool isPasswordVisible = false;

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

  void importPrivateKey(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final String input;
    if (isNcryptsec) {
      try {
        input = await Nip49.decrypt(privkey, password);
      } catch (e) {
        showErrorToast(l10n.decryptionFailed);
        return;
      }
    } else {
      input = privkey;
    }

    final privateKey = parsePrivateKey(input);
    if (privateKey == null) {
      showErrorToast(l10n.invalidPrivateKey);
      return;
    }
    await addAccount(privateKey);
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
