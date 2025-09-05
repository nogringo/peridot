import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/nostr_app.dart';
import 'package:peridot/models/bunker.dart';
import 'package:peridot/utils/nip46_parser.dart';
import 'package:toastification/toastification.dart';

class AddApplicationController extends GetxController {
  static AddApplicationController get to => Get.find();

  final nostrConnectFieldController = TextEditingController();
  final appNameFieldController = TextEditingController();
  late RxString selectedPubkey;
  Bunker? bunkerUrl;
  String? currentSecret;
  NdkResponse? bunkerSubscription;
  NdkResponse? nostrConnectSubscription;
  NostrApp? app;

  bool get hasNostrConnectURL {
    try {
      NostrApp.fromNostrConnectUrl(nostrConnectFieldController.text.trim());
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
    if (bunkerUrl == null) return 0;
    if (app == null) return 1;
    return 2;
  }

  bool get isConnected => app != null;

  AddApplicationController() {
    selectedPubkey = Repository.ndk.accounts.accounts.keys.first.obs;
  }

  void listenBunker() {
    if (bunkerUrl == null) return;

    bunkerSubscription = Repository.ndk.requests.subscription(
      filters: [
        Filter(kinds: [24133], pTags: [bunkerUrl!.pubkey], limit: 0),
      ],
      explicitRelays: bunkerUrl!.relays,
    );

    bunkerSubscription!.stream.listen(onBunkerEvent);
  }

  void onBunkerEvent(Nip01Event event) async {
    if (bunkerUrl == null) return;

    final request = await parseNip46Request(event);
    if (request == null) return;
    if (request.command != Nip46Commands.connect) return;
    if (request.params.length < 2) return;

    final secret = request.params[1];
    if (bunkerUrl!.secret != secret) return;

    final requestedPermissions = request.params.length > 2
        ? (request.params[2]).split(',').map((p) => p.trim()).toList()
        : <String>[];

    app = NostrApp(
      pubkey: request.clientPubkey,
      relays: bunkerUrl!.relays,
      permissions: requestedPermissions,
    );
    update();
  }

  Future<void> stopListeningBunker() async {
    if (bunkerSubscription == null) return;
    final subId = bunkerSubscription!.requestId;
    await Repository.ndk.requests.closeSubscription(subId);
  }

  Future<void> stopListeningNostrConnect() async {
    if (nostrConnectSubscription == null) return;
    final subId = nostrConnectSubscription!.requestId;
    await Repository.ndk.requests.closeSubscription(subId);
  }

  void copyBunkerUrl() {
    if (bunkerUrl == null || bunkerUrl!.url.isEmpty) return;

    Clipboard.setData(ClipboardData(text: bunkerUrl!.url));

    toastification.show(
      context: Get.context!,
      title: const Text('Copied to clipboard'),
      description: const Text('Bunker URL copied successfully'),
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomRight,
      type: ToastificationType.success,
      showProgressBar: true,
    );
  }

  void chooseAccountStepDone() {
    bunkerUrl = Bunker(
      pubkey: selectedPubkey.value,
      relays: Repository.to.bunkerDefaultRelays,
    );
    listenBunker();
    update();
  }

  void connectWithNostrConnect() {
    app = NostrApp.fromNostrConnectUrl(nostrConnectFieldController.text.trim());
    if (app!.name != null) {
      appNameFieldController.text = app!.name!;
    }
    update();
  }

  void onNostrConnectFieldChanged(String value) {
    update();
  }
}
