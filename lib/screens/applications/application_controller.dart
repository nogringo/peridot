import 'package:get/get.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/repository.dart';

class ApplicationController extends GetxController {
  static ApplicationController get to => Get.find();

  static void allowForever({required String command, required App app}) {
    Repository.bunker.allowForever(command: command, app: app);
    Repository.to.update();
    Repository.to.saveBunkerState();
  }

  static void rejectForever({required String command, required App app}) {
    Repository.bunker.rejectForever(command: command, app: app);
    Repository.to.update();
    Repository.to.saveBunkerState();
  }
}
