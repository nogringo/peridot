import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
