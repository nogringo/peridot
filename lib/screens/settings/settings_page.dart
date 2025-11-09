import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/settings/default_bunker_relays_view.dart';
import 'package:peridot/screens/settings/logged_accounts_view.dart';
import 'package:peridot/screens/settings/controllers/settings_controller.dart';
import 'package:peridot/screens/settings/system_settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: const [
          LoggedAccountsView(),
          SizedBox(height: 16),
          DefaultBunkerRelaysView(),
          SizedBox(height: 16),
          SystemSettingsView(),
          SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
