import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/controller.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/manage_app/switch_account_dialog.dart';
import 'package:sembast/sembast.dart';

class ManageAppController extends Controller {
  App? app;
  final renameController = TextEditingController();
  final renameFocusNode = FocusNode();

  String selectedPubkey = "";

  ManageAppController(String appPubkey) {
    app = Repository.bunker.apps
        .where((a) => a.appPubkey == appPubkey)
        .firstOrNull;

    if (app != null) {
      renameController.text =
          app!.name ?? AppLocalizations.of(AppRoutes.context)!.unnamedApp;
      selectedPubkey = app!.userPubkey;
    }

    // Listen to focus changes to auto-save
    renameFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    renameFocusNode.removeListener(_onFocusChange);
    renameController.dispose();
    renameFocusNode.dispose();
    super.dispose();
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
          app!.name ?? AppLocalizations.of(AppRoutes.context)!.unnamedApp;
      return;
    }

    app!.name = newName;
    update();
    await Repository.to.saveBunkerState();
  }

  void deleteApp(BuildContext context) async {
    if (app == null) return;

    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteApplication),
        content: Text(
          l10n.deleteApplicationConfirm(app!.name ?? l10n.unnamedApp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await Repository.to.removeApp(app!);
      if (context.mounted) Navigator.pop(context);
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

  void openSwitchAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => SwitchAccountDialog(controller: this),
    );
  }

  void selectAccount(String pubkey) {
    selectedPubkey = pubkey;
    update();
  }

  void switchAccount(BuildContext context) {
    app!.userPubkey = selectedPubkey;
    update();
    Navigator.pop(context);
    Repository.to.saveBunkerState();
  }

  void openReqScreen(BuildContext context, Nip46Request reqObj) {
    context.go(AppRoutes.appRequest(reqObj.appPubkey, reqObj.id));
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
