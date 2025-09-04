import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nip19/nip19.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:sembast/sembast.dart';
import 'package:toastification/toastification.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  final newRelayFieldController = TextEditingController();

  void handleAccountMenuAction(String action, String pubkey) {
    switch (action) {
      case 'copy':
        copyNpubToClipboard(pubkey);
        break;
      case 'backup':
        showBackupAccount(pubkey);
        break;
      case 'remove':
        removeAccount(pubkey);
        break;
    }
  }

  void copyNpubToClipboard(String pubkey) {
    final npub = Nip19.npubFromHex(pubkey);
    Clipboard.setData(ClipboardData(text: npub));

    toastification.show(
      context: Get.context!,
      title: const Text('Copied to clipboard'),
      description: const Text('Public key copied successfully'),
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomRight,
      type: ToastificationType.success,
      showProgressBar: true,
    );
  }

  void showBackupAccount(String pubkey) {
    Get.toNamed(AppRoutes.backupAccount.replaceAll(':pubkey', pubkey));
  }

  void removeAccount(String pubkey) {
    // TODO: Implement remove account with confirmation dialog
    toastification.show(
      context: Get.context!,
      title: const Text('Remove account'),
      description: const Text('Feature coming soon'),
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomRight,
      type: ToastificationType.warning,
      showProgressBar: true,
    );
  }

  Future<void> addDefaultBunkerRelay() async {
    final relay = newRelayFieldController.text.trim();
    if (relay.isEmpty) return;

    try {
      final uri = Uri.parse(relay);
      if (uri.scheme != 'wss' && uri.scheme != 'ws') {
        return;
      }
      if (!uri.hasAuthority) {
        return;
      }
    } catch (e) {
      return;
    }

    final db = Repository.to.db;
    final store = stringMapStoreFactory.store('default_bunker_relays');

    await store.record(relay).put(db, {relay: relay});

    if (!Repository.to.bunkerDefaultRelays.contains(relay)) {
      Repository.to.bunkerDefaultRelays.add(relay);
    }

    newRelayFieldController.clear();
  }
}
