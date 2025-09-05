import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/settings/settings_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class DefaultBunkerRelaysView extends StatelessWidget {
  const DefaultBunkerRelaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderAreaView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          SizedBox(height: 8),
          TextField(
            controller: SettingsController.to.newRelayFieldController,
            decoration: InputDecoration(
              hintText: "wss://relay.example.com",
              suffixIcon: IconButton(
                onPressed: SettingsController.to.addDefaultBunkerRelay,
                icon: Icon(Icons.add),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onSubmitted: (_) => SettingsController.to.addDefaultBunkerRelay(),
          ),
        ],
      ),
    );
  }
}
