import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/utils/translate_permission.dart';
import 'package:sembast/sembast.dart';

// Top-level function for background notification handling
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  // Handle background notification tap
  // Since this is a background handler, we can't directly access the NotificationService instance
  // The actual handling will be done when the app comes to foreground
}

class NotificationAction {
  final String id;
  final String title;

  NotificationAction({required this.id, required this.title});
}

class NotificationService extends GetxService {
  static NotificationService get to => Get.find();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  final _storage = const FlutterSecureStorage();

  // Store callbacks for permission requests
  final Map<int, Function(bool)> _permissionCallbacks = {};

  // Observable for notification enabled state
  final RxBool isNotificationEnabled = true.obs;

  Future<NotificationService> init() async {
    // Load saved notification preference
    final savedPref = await _storage.read(key: 'notifications_enabled');
    isNotificationEnabled.value = savedPref != 'false';

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const linuxSettings = LinuxInitializationSettings(
      defaultActionName: 'Open notification',
    );

    const windowsSettings = WindowsInitializationSettings(
      appName: 'Peridot',
      appUserModelId: 'io.github.nogringo.peridot',
      guid: '7b1565e4-22ff-42ab-96b6-de142e608e98',
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
      linux: linuxSettings,
      windows: windowsSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    return this;
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    isNotificationEnabled.value = enabled;
    var store = StoreRef.main();
    await store.record("notifications_enabled").put(Repository.to.db, enabled);
  }

  void _onNotificationTapped(NotificationResponse response) {
    // Handle notification action
    if (response.actionId != null) {
      final notificationId = response.id;
      if (notificationId != null) {
        final callback = _permissionCallbacks[notificationId];
        if (callback != null) {
          // Call the callback based on action
          if (response.actionId == 'authorize') {
            callback(true);
          } else if (response.actionId == 'reject') {
            callback(false);
          }
          // Remove callback after use
          _permissionCallbacks.remove(notificationId);
        }
      }
    }
  }

  Future<bool> requestPermissions() async {
    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (androidPlugin != null) {
      final granted = await androidPlugin.requestNotificationsPermission();
      return granted ?? false;
    }

    final iosPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();

    if (iosPlugin != null) {
      final granted = await iosPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    final macosPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >();

    if (macosPlugin != null) {
      final granted = await macosPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    return true;
  }

  Future<int?> showPermissionRequestNotification({
    required BuildContext context,
    required String appName,
    required String permission,
    required String accountName,
    Function(bool)? onAction,
  }) async {
    // Check if notifications are enabled
    if (!isNotificationEnabled.value) return null;

    final l10n = AppLocalizations.of(context)!;
    final translatedPermission = translatePermission(context, permission);

    final title = l10n.permissionRequested;
    final body = l10n.unknownPermissionMessage(
      appName,
      translatedPermission,
      accountName,
    );

    final notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    // Store callback if provided
    if (onAction != null) {
      _permissionCallbacks[notificationId] = onAction;
    }

    await showNotificationWithActions(
      id: notificationId,
      title: title,
      body: body,
      actions: [
        NotificationAction(id: 'reject', title: l10n.reject),
        NotificationAction(id: 'authorize', title: l10n.authorize),
      ],
      payload: 'permission_request',
    );

    return notificationId;
  }

  Future<void> showNotificationWithActions({
    required int id,
    required String title,
    required String body,
    required List<NotificationAction> actions,
    String? payload,
  }) async {
    // Android notification with actions
    final androidDetails = AndroidNotificationDetails(
      'permission_channel',
      'Permission Notifications',
      channelDescription: 'Notifications for permission requests',
      importance: Importance.high,
      priority: Priority.high,
      actions: actions
          .map(
            (action) => AndroidNotificationAction(
              action.id,
              action.title,
              showsUserInterface: true,
            ),
          )
          .toList(),
    );

    // Darwin (iOS/macOS) notification with actions
    final darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      categoryIdentifier: 'permission_category',
    );

    // Linux notification with actions
    final linuxDetails = LinuxNotificationDetails(
      actions: actions
          .map(
            (action) =>
                LinuxNotificationAction(key: action.id, label: action.title),
          )
          .toList(),
    );

    // Windows notification details
    const windowsDetails = WindowsNotificationDetails();

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
      linux: linuxDetails,
      windows: windowsDetails,
    );

    await _notifications.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'permission_channel',
      'Permission Notifications',
      channelDescription: 'Notifications for permission requests',
      importance: Importance.high,
      priority: Priority.high,
    );

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const linuxDetails = LinuxNotificationDetails();

    const windowsDetails = WindowsNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
      linux: linuxDetails,
      windows: windowsDetails,
    );

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
    // Also remove any stored callback for this notification
    _permissionCallbacks.remove(id);
  }

  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }
}
