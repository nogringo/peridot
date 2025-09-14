import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/models/authorized_app.dart';
import 'package:peridot/models/permission.dart';
import 'package:sembast/sembast.dart';

class ManageAppController extends GetxController {
  AuthorizedApp? app;

  @override
  void onInit() {
    super.onInit();

    // First try to get the app from arguments (passed directly)
    final args = Get.arguments;
    if (args != null && args is AuthorizedApp) {
      app = args;
    } else {
      // Otherwise, find the app by appPubkey from the route parameter
      final appPubkey = Get.parameters['appPubkey'];
      if (appPubkey != null) {
        app = Repository.to.authorizedApps.firstWhereOrNull(
          (a) => a.appPubkey == appPubkey,
        );
      }
    }
  }

  void togglePermission(Permission permission) async {
    if (app == null) return;

    permission.isAllowed = !permission.isAllowed;
    await Repository.to.updateAuthorizedApp(app!);
    update();
  }

  void deleteApp() async {
    if (app == null) return;

    final l10n = AppLocalizations.of(Get.context!)!;
    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        title: Text(l10n.deleteApplication),
        content: Text(l10n.deleteApplicationConfirm(app!.name)),
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
      final db = Repository.to.db;
      final store = intMapStoreFactory.store('authorized_apps');
      final records = await store.find(db);

      for (final record in records) {
        final existingApp = AuthorizedApp.fromJson(record.value);
        if (existingApp.appPubkey == app!.appPubkey &&
            existingApp.signerPubkey == app!.signerPubkey) {
          await store.record(record.key).delete(db);
          break;
        }
      }

      await Repository.to.loadAuthorizedApps();
      await Repository.to.listenSigningRequests();

      Get.back();
    }
  }
}
