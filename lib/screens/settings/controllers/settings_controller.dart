import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ndk/shared/nips/nip19/nip19.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/utils/toast_utils.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:peridot/config.dart';
import 'package:peridot/controllers/controller.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/settings/remove_account_dialog.dart';

class SettingsController extends Controller {
  static late final SettingsController to;

  final newRelayFieldController = TextEditingController();
  bool isAutoStartEnabled = false;

  Future<void> checkAutoStartStatus() async {
    try {
      // Setup first before checking status
      _setupLaunchAtStartup();
      isAutoStartEnabled = await launchAtStartup.isEnabled();
    } catch (e) {
      // If checking fails, assume it's disabled
      isAutoStartEnabled = false;
    }
    update();
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

      if (isAutoStartEnabled) {
        // Disable auto-start
        await launchAtStartup.disable();
        isAutoStartEnabled = false;
      } else {
        // Enable auto-start
        await launchAtStartup.enable();
        isAutoStartEnabled = true;
      }
      update();
    } catch (e) {
      // If toggle fails, keep the current state
      // Could show a toast notification here if needed
    }
  }

  void handleAccountMenuAction(
    BuildContext context,
    String action,
    String pubkey,
  ) {
    switch (action) {
      case 'copy':
        copyNpubToClipboard(context, pubkey);
        break;
      case 'backup':
        showBackupAccount(context, pubkey);
        break;
      case 'remove':
        removeAccount(context, pubkey);
        break;
    }
  }

  void copyNpubToClipboard(BuildContext context, String pubkey) {
    final npub = Nip19.encodePubKey(pubkey);
    Clipboard.setData(ClipboardData(text: npub));
    showCopyToast(context);
  }

  void showBackupAccount(BuildContext context, String pubkey) {
    Navigator.pushNamed(context, AppRoutes.backupAccount(pubkey));
  }

  void removeAccount(BuildContext context, String pubkey) async {
    final shouldRemove = await showDialog<bool>(
      context: context,
      builder: (_) => RemoveAccountDialog(pubkey: pubkey),
    );

    if (shouldRemove != true) return;

    await Repository.to.removeAccount(pubkey);

    if (Repository.to.usersPubkeys.isEmpty) {
      AppRoutes.navigator.pushNamedAndRemoveUntil(
        AppRoutes.addPrivkey,
        (_) => false,
      );
    }
  }

  Future<void> addDefaultBunkerRelay(BuildContext context) async {
    final relay = newRelayFieldController.text.trim();
    if (relay.isEmpty) return;

    final l10n = AppLocalizations.of(context)!;
    try {
      final uri = Uri.parse(relay);
      if (uri.scheme != 'wss' && uri.scheme != 'ws') {
        showErrorToast(l10n.relayUrlProtocolError, context);
        return;
      }
      if (!uri.hasAuthority) {
        showErrorToast(l10n.invalidRelayUrlFormat, context);
        return;
      }
    } catch (e) {
      showErrorToast(l10n.invalidRelayUrl, context);
      return;
    }

    Repository.bunker.defaultBunkerRelays.add(relay);
    newRelayFieldController.clear();
    update();
    await Repository.to.saveBunkerState();
  }
}
