import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:sembast/sembast.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  final newRelayFieldController = TextEditingController();

  Future<void> addDefaultBunkerRelay() async {
    final relay = newRelayFieldController.text.trim();
    if (relay.isEmpty) return;

    try {
      final uri = Uri.parse(relay);
      if (uri.scheme != 'wss' && uri.scheme != 'ws') {
        return;
      }
      if (!uri.hasAuthority) {
        return;
      }
    } catch (e) {
      return;
    }

    final db = Repository.to.db;
    final store = stringMapStoreFactory.store('default_bunker_relays');

    await store.record(relay).put(db, {relay: relay});

    if (!Repository.to.bunkerDefaultRelays.contains(relay)) {
      Repository.to.bunkerDefaultRelays.add(relay);
    }

    newRelayFieldController.clear();
  }
}
