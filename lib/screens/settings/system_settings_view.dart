import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/settings/controllers/settings_controller.dart';
import 'package:peridot/screens/settings/controllers/system_settings_controller.dart';
import 'package:peridot/services/notification_service.dart';
import 'package:peridot/widgets/border_area_view.dart';

class SystemSettingsView extends StatelessWidget {
  const SystemSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.find<SettingsController>();
    final notificationService = NotificationService.to;
    Get.put(SystemSettingsController());
    final l10n = AppLocalizations.of(context)!;

    return BorderAreaView(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(l10n.systemSettings, style: Get.textTheme.titleLarge),
          ),
          SizedBox(height: 16),
          Obx(
            () => SwitchListTile(
              title: Text(l10n.startOnSystemStartup),
              subtitle: Text(l10n.startOnSystemStartupDescription),
              value: settingsController.isAutoStartEnabled.value,
              onChanged: (value) async {
                await settingsController.toggleAutoStart();
              },
            ),
          ),
          Obx(
            () => SwitchListTile(
              title: Text(l10n.notifications),
              subtitle: Text(l10n.notificationsDescription),
              value: notificationService.isNotificationEnabled.value,
              onChanged: (value) async {
                await notificationService.setNotificationsEnabled(value);
              },
            ),
          ),
          // Obx(
          //   () => SwitchListTile(
          //     title: Text(l10n.useTor),
          //     subtitle: Text(l10n.useTorComingSoon),
          //     value: controller.isTorEnabled.value,
          //     onChanged: null,
          //   ),
          // ),
        ],
      ),
    );
  }
}
