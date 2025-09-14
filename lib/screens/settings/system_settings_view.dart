import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/services/auto_start_service.dart';
import 'package:peridot/services/notification_service.dart';
import 'package:peridot/widgets/border_area_view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SystemSettingsView extends StatelessWidget {
  const SystemSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final autoStartService = AutoStartService.to;
    final notificationService = NotificationService.to;
    final controller = Get.put(SystemSettingsController());
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
              value: autoStartService.isEnabled.value,
              onChanged: (value) async {
                await autoStartService.toggleAutoStart();
              },
            ),
          ),
          Obx(
            () => SwitchListTile(
              title: Text(l10n.desktopNotifications),
              subtitle: Text(l10n.desktopNotificationsDescription),
              value: notificationService.isNotificationEnabled.value,
              onChanged: (value) async {
                await notificationService.setNotificationsEnabled(value);
              },
            ),
          ),
          Obx(
            () => SwitchListTile(
              title: Text(l10n.useTor),
              subtitle: Text(l10n.useTorComingSoon),
              value: controller.isTorEnabled.value,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}

class SystemSettingsController extends GetxController {
  final _storage = const FlutterSecureStorage();
  final RxBool isTorEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadTorPreference();
  }

  Future<void> _loadTorPreference() async {
    final savedPref = await _storage.read(key: 'tor_enabled');
    isTorEnabled.value = savedPref == 'true';
  }

  Future<void> setTorEnabled(bool enabled) async {
    isTorEnabled.value = enabled;
    await _storage.write(key: 'tor_enabled', value: enabled.toString());
  }
}
