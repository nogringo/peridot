import 'dart:io';
import 'package:get/get.dart';
import 'package:launch_at_startup/launch_at_startup.dart';

class AutoStartService extends GetxService {
  static AutoStartService get to => Get.find();

  final RxBool isEnabled = false.obs;

  Future<AutoStartService> init() async {
    _setupAutoStart();
    await checkAutoStartStatus();
    return this;
  }

  void _setupAutoStart() {
    final appName = 'Peridot';
    final appPath = Platform.resolvedExecutable;

    launchAtStartup.setup(
      appName: appName,
      appPath: appPath,
      packageName: 'com.peridot.app',
    );
  }

  Future<void> checkAutoStartStatus() async {
    isEnabled.value = await launchAtStartup.isEnabled();
  }

  Future<void> enableAutoStart() async {
    await launchAtStartup.enable();
    isEnabled.value = true;
  }

  Future<void> disableAutoStart() async {
    await launchAtStartup.disable();
    isEnabled.value = false;
  }

  Future<void> toggleAutoStart() async {
    if (isEnabled.value) {
      await disableAutoStart();
    } else {
      await enableAutoStart();
    }
  }
}
