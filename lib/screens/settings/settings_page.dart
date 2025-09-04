import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/screens/settings/default_bunker_relays_view.dart';
import 'package:peridot/screens/settings/logged_accounts_view.dart';
import 'package:peridot/screens/settings/settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          LoggedAccountsView(),
          SizedBox(height: 16),
          DefaultBunkerRelaysView(),
          SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
