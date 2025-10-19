import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';

class ManageAppController extends GetxController {
  App? app;
  final renameController = TextEditingController();
  final renameFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();

    // First try to get the app from arguments (passed directly)
    final args = Get.arguments;
    if (args != null && args is App) {
      app = args;
    } else {
      // Otherwise, find the app by appPubkey from the route parameter
      final appPubkey = Get.parameters['appPubkey'];
      if (appPubkey != null) {
        app = Repository.bunker.apps.firstWhereOrNull(
          (a) => a.appPubkey == appPubkey,
        );
      }
    }

    if (app != null) {
      renameController.text = app!.name ?? "Unamed App";
    }

    // Listen to focus changes to auto-save
    renameFocusNode.addListener(_onFocusChange);
  }

  @override
  void onClose() {
    renameFocusNode.removeListener(_onFocusChange);
    renameController.dispose();
    renameFocusNode.dispose();
    super.onClose();
  }

  void _onFocusChange() {
    if (renameFocusNode.hasFocus) return;
    saveRename();
  }

  void togglePermission(Permission permission) async {
    if (app == null) return;

    permission.isAllowed = !permission.isAllowed;
    await Repository.to.saveBunkerState();
    update();
  }

  void saveRename() async {
    if (app == null) return;

    final newName = renameController.text.trim();
    if (newName.isEmpty) {
      renameController.text = app!.name ?? "Unamed App";
      return;
    }

    app!.name = newName;
    update();
    await Repository.to.saveBunkerState();
  }

  void deleteApp() async {
    if (app == null) return;

    final l10n = AppLocalizations.of(Get.context!)!;
    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        title: Text(l10n.deleteApplication),
        content: Text(l10n.deleteApplicationConfirm(app!.name ?? "Unamed App")),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Get.back(result: true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      Repository.bunker.removeApp(app!);
      Repository.to.update();
      Get.back();
      Repository.to.saveBunkerState();
    }
  }
}
