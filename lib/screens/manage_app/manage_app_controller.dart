import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/manage_app/switch_account_dialog.dart';
import 'package:sembast/sembast.dart';

class ManageAppController extends GetxController {
  static ManageAppController get to => Get.find();

  App? app;
  final renameController = TextEditingController();
  final renameFocusNode = FocusNode();

  RxString selectedPubkey = "".obs;

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
      renameController.text =
          app!.name ?? AppLocalizations.of(Get.context!)!.unnamedApp;
    }

    // Listen to focus changes to auto-save
    renameFocusNode.addListener(_onFocusChange);

    selectedPubkey.value = app!.userPubkey;
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
      renameController.text =
          app!.name ?? AppLocalizations.of(Get.context!)!.unnamedApp;
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
        content: Text(
          l10n.deleteApplicationConfirm(
            app!.name ?? AppLocalizations.of(Get.context!)!.unnamedApp,
          ),
        ),
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
      await Repository.to.removeApp(app!);
      Get.back();
      await Repository.to.saveBunkerState();
    }
  }

  void updateAuthorisationMode(AuthorisationMode value) {
    app!.authorisationMode = value;
    update();
  }

  void appEnableChange(bool value) {
    app!.isEnabled = value;
    update();
    Repository.to.saveBunkerState();
  }

  void removeClientTagChange(bool value) {
    app!.removeClientTag = value;
    update();
    Repository.to.saveBunkerState();
  }

  void openSwitchAccountDialog() {
    Get.dialog(SwitchAccountDialog());
  }

  void selectAccount(String pubkey) {
    selectedPubkey.value = pubkey;
  }

  void switchAccount() {
    app!.userPubkey = selectedPubkey.value;
    update();
    Get.back();
    Repository.to.saveBunkerState();
  }

  void openReqScreen(Nip46Request reqObj) {
    Get.toNamed(AppRoutes.request.replaceAll(':requestId', reqObj.id));
  }

  Future<void> deleteRequest(String requestId) async {
    final requestsStore = stringMapStoreFactory.store('requests');
    await requestsStore.record(requestId).delete(Repository.to.db);
  }

  Future<void> deleteAllRequests(List<BunkerRequest> requests) async {
    final requestsStore = stringMapStoreFactory.store('requests');
    final db = Repository.to.db;

    final recordKeys = requests.map((req) => req.originalRequest.id).toList();
    await requestsStore.records(recordKeys).delete(db);
  }
}
