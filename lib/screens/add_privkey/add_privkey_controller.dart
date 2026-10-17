import 'package:flutter/widgets.dart';
import 'package:ndk/shared/nips/nip01/bip340.dart';
import 'package:ndk/shared/nips/nip19/nip19.dart';
import 'package:nip49/nip49.dart';
import 'package:peridot/controllers/controller.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/utils/toast_utils.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';

class AddPrivkeyController extends Controller {
  final privkeyFieldController = TextEditingController();
  final ncryptsecPasswordFieldController = TextEditingController();
  bool isNcryptsec = false;

  String get privkey => privkeyFieldController.text.trim().toLowerCase();
  String get password =>
      ncryptsecPasswordFieldController.text.trim().toLowerCase();

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

  void importPrivateKey(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    if (isNcryptsec) {
      final ncryptsec = privkey;
      try {
        final privateKey = await Nip49.decrypt(ncryptsec, password);
        addAccount(privateKey);
      } catch (e) {
        showErrorToast(l10n.decryptionFailed);
      }
    } else if (privkey.startsWith("nsec1")) {
      final nsec = privkey;
      try {
        final privateKey = Nip19.decode(nsec);
        addAccount(privateKey);
      } catch (e) {
        showErrorToast(l10n.invalidPrivateKey);
      }
    } else {
      try {
        addAccount(privkey);
      } catch (e) {
        showErrorToast(l10n.invalidPrivateKey);
      }
    }
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
