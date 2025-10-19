import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/settings/settings_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class DefaultBunkerRelaysView extends StatelessWidget {
  const DefaultBunkerRelaysView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BorderAreaView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.defaultBunkerRelays, style: Get.textTheme.titleLarge),
          GetBuilder<SettingsController>(
            builder: (_) {
              return Column(
                children: Repository.bunker.defaultBunkerRelays.map((relay) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(relay),
                    trailing: IconButton(
                      onPressed: () => _confirmRemoveRelay(context, relay),
                      icon: Icon(Icons.close),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          SizedBox(height: 8),
          TextField(
            controller: SettingsController.to.newRelayFieldController,
            decoration: InputDecoration(
              hintText: l10n.enterRelayUrl,
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

  void _confirmRemoveRelay(BuildContext context, String relay) async {
    final l10n = AppLocalizations.of(context)!;

    // Check if this is the last relay
    if (Repository.bunker.defaultBunkerRelays.length <= 1) {
      await Get.dialog(
        AlertDialog(
          title: Text(l10n.cannotRemoveLastRelay),
          content: Text(l10n.cannotRemoveLastRelayMessage),
          actions: [
            FilledButton(onPressed: () => Get.back(), child: Text(l10n.ok)),
          ],
        ),
      );
      return;
    }

    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        title: Text(l10n.removeRelay),
        content: Text(l10n.removeRelayConfirm(relay)),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Get.back(result: true),
            child: Text(l10n.remove),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      Repository.bunker.defaultBunkerRelays.remove(relay);
      SettingsController.to.update();
      await Repository.to.saveBunkerState();
    }
  }
}
