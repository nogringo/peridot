import 'package:flutter/services.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/utils/toast_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart' hide NostrConnect;
import 'package:peridot/controllers/repository.dart';

class AddApplicationController extends GetxController {
  static AddApplicationController get to => Get.find();

  final nostrConnectFieldController = TextEditingController();
  final appNameFieldController = TextEditingController();
  late RxString selectedPubkey;
  String? bunkerUrl;
  String? currentSecret;
  NdkResponse? bunkerSubscription;
  App? app;

  RxBool isNostrConnectConnecting = false.obs;
  Rx<AuthorisationMode> appAuthorisationMode =
      AuthorisationMode.allowCommonRequests.obs;

  bool get hasNostrConnectURL {
    try {
      NostrConnectUrl.fromUrl(nostrConnectFieldController.text.trim());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get canContinue {
    if (currentStep == 0) return true;

    return false;
  }

  int get currentStep {
    if (bunkerUrl == null) {
      if (Repository.to.usersPubkeys.length == 1) {
        chooseAccountStepDone();
        return 1;
      }
      return 0;
    }
    if (app == null) return 1;
    return 2;
  }

  bool get isConnected => app != null;

  bool get canAddApp => appNameFieldController.text.trim().isNotEmpty;

  AddApplicationController() {
    selectedPubkey = Repository.to.usersPubkeys.first.obs;
    if (Repository.ndk.accounts.accounts.length == 1) {
      chooseAccountStepDone();
    }
  }

  @override
  void onClose() {
    stopListeningBunker();
    nostrConnectFieldController.dispose();
    appNameFieldController.dispose();
    super.onClose();
  }

  Future<void> stopListeningBunker() async {
    if (bunkerSubscription == null) return;
    final subId = bunkerSubscription!.requestId;
    await Repository.ndk.requests.closeSubscription(subId);
  }

  void copyBunkerUrl() {
    if (bunkerUrl == null || bunkerUrl!.isEmpty) return;

    Clipboard.setData(ClipboardData(text: bunkerUrl!));
    showCopyToast();
  }

  void chooseAccountStepDone() {
    bunkerUrl = Repository.bunker.getBunkerUrl(
      signerPubkey: selectedPubkey.value,
      onConnected: (app) {
        this.app = app;
        update();
        Repository.to.update();
      },
    );
    update();
  }

  void connectWithNostrConnect() async {
    isNostrConnectConnecting.value = true;

    app = await Repository.bunker.connectApp(
      signerPubkey: selectedPubkey.value,
      nostrConnect: NostrConnectUrl.fromUrl(
        nostrConnectFieldController.text.trim(),
      ),
    );

    isNostrConnectConnecting.value = false;

    if (app!.name != null) {
      appNameFieldController.text = app!.name!;
    }

    update();
    Repository.to.update();
  }

  void onNostrConnectFieldChanged(String value) {
    update();
  }

  void finish() {
    app!.isEnabled = true;

    final newName = appNameFieldController.text;
    if (newName.isNotEmpty) {
      app!.name = newName;
    }

    app!.authorisationMode = appAuthorisationMode.value;

    for (var req in Repository.bunker.blockedRequests) {
      Repository.bunker.processNip46Request(req);
    }

    Repository.to.update();

    Get.back();

    Repository.to.saveBunkerState();
  }
}
