import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peridot/utils/toast_utils.dart';
import 'package:get/get.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:nip19/nip19.dart';
import 'package:peridot/config.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/settings/remove_account_dialog.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  final newRelayFieldController = TextEditingController();
  final RxBool isAutoStartEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkAutoStartStatus();
  }

  Future<void> checkAutoStartStatus() async {
    try {
      // Setup first before checking status
      _setupLaunchAtStartup();
      isAutoStartEnabled.value = await launchAtStartup.isEnabled();
    } catch (e) {
      // If checking fails, assume it's disabled
      isAutoStartEnabled.value = false;
    }
  }

  void _setupLaunchAtStartup() {
    launchAtStartup.setup(
      appName: appTitle,
      appPath: Platform.resolvedExecutable,
      packageName: 'io.github.nogringo.peridot',
    );
  }

  Future<void> toggleAutoStart() async {
    try {
      _setupLaunchAtStartup(); // Ensure it's setup before any operation

      if (isAutoStartEnabled.value) {
        // Disable auto-start
        await launchAtStartup.disable();
        isAutoStartEnabled.value = false;
      } else {
        // Enable auto-start
        await launchAtStartup.enable();
        isAutoStartEnabled.value = true;
      }
    } catch (e) {
      // If toggle fails, keep the current state
      // Could show a toast notification here if needed
    }
  }

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
    showCopyToast();
  }

  void showBackupAccount(String pubkey) {
    Get.toNamed(AppRoutes.backupAccount.replaceAll(':pubkey', pubkey));
  }

  void removeAccount(String pubkey) async {
    final shouldRemove = await Get.dialog<bool>(
      RemoveAccountDialog(pubkey: pubkey),
    );

    if (shouldRemove != true) return;

    await Repository.to.removeAccount(pubkey);

    if (Repository.to.usersPubkeys.isEmpty) {
      Get.offAllNamed(AppRoutes.addPrivkey);
    }
  }

  Future<void> addDefaultBunkerRelay() async {
    final relay = newRelayFieldController.text.trim();
    if (relay.isEmpty) return;

    try {
      final uri = Uri.parse(relay);
      if (uri.scheme != 'wss' && uri.scheme != 'ws') {
        showErrorToast('Relay URL must use wss:// or ws:// protocol');
        return;
      }
      if (!uri.hasAuthority) {
        showErrorToast('Invalid relay URL format');
        return;
      }
    } catch (e) {
      showErrorToast('Invalid relay URL');
      return;
    }

    Repository.bunker.defaultBunkerRelays.add(relay);
    newRelayFieldController.clear();
    update();
    await Repository.to.saveBunkerState();
  }
}
