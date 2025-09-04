import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nip19/nip19.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
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
          Text("Logged Accounts", style: Get.textTheme.titleLarge),
          SizedBox(height: 8),
          ...Repository.ndk.accounts.accounts.keys.map((pubkey) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: NPicture(ndk: Repository.ndk, pubkey: pubkey),
              title: NName(ndk: Repository.ndk, pubkey: pubkey),
              subtitle: Text(
                Nip19.npubFromHex(pubkey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: PopupMenuButton<String>(
                icon: Icon(Icons.more_vert),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Theme.of(context).dividerColor, width: 1),
                ),
                onSelected: (value) => SettingsController.to.handleAccountMenuAction(value, pubkey),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'copy',
                    child: Row(
                      children: [
                        Icon(Icons.copy, size: 20),
                        SizedBox(width: 8),
                        Text('Copy npub'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'backup',
                    child: Row(
                      children: [
                        Icon(Icons.vertical_align_bottom, size: 20),
                        SizedBox(width: 8),
                        Text('Backup account'),
                      ],
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    value: 'remove',
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 20, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Remove account', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: 24),
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
