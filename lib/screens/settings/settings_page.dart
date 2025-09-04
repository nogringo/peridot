import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/controllers/repository.dart';
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
          Text("Default bunker relays", style: Get.textTheme.titleLarge),
          Obx(() {
            return Column(
              children: Repository.to.bunkerDefaultRelays.map((relay) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(relay),
                  trailing: IconButton(
                    onPressed: () =>
                        Repository.to.removeDefaultBunkerRelay(relay),
                    icon: Icon(Icons.close),
                  ),
                );
              }).toList(),
            );
          }),
          TextField(
            controller: SettingsController.to.newRelayFieldController,
            decoration: InputDecoration(
              hintText: "wss://relay.example.com",
              suffixIcon: IconButton(
                onPressed: SettingsController.to.addDefaultBunkerRelay,
                icon: Icon(Icons.add),
              ),
            ),
            onSubmitted: (_) => SettingsController.to.addDefaultBunkerRelay(),
          ),
          SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
