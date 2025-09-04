import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/authorized_app.dart';
import 'package:peridot/models/bunker.dart';
import 'package:peridot/utils/nip46_parser.dart';

class AddApplicationController extends GetxController {
  static AddApplicationController get to => Get.find();

  final nostrConnectFieldController = TextEditingController();

  late Bunker bunkerUrl;
  String? currentSecret;
  NdkResponse? bunkerSubscription;
  NdkResponse? nostrConnectSubscription;
  AuthorizedApp? app;

  bool get isConnected => app != null;

  AddApplicationController() {
    final pubkey = Repository.ndk.accounts.getPublicKey();
    if (pubkey == null) return;

    bunkerUrl = Bunker(
      pubkey: pubkey,
      relays: Repository.to.bunkerDefaultRelays.toList(),
    );
  }

  void listenBunker() {
    bunkerSubscription = Repository.ndk.requests.subscription(
      filters: [
        Filter(kinds: [24133], pTags: [bunkerUrl.pubkey], limit: 0),
      ],
    );

    bunkerSubscription!.stream.listen(onBunkerEvent);
  }

  void onBunkerEvent(Nip01Event event) async {
    final request = await parseNip46Request(event);
    if (request == null) return;
    if (request.command != Nip46Commands.connect) return;
    if (request.params.length < 2) return;

    final secret = request.params[1];
    if (bunkerUrl.secret != secret) return;

    final requestedPermissions = request.params.length > 2
        ? (request.params[2]).split(',').map((p) => p.trim()).toList()
        : <String>[];

    app = AuthorizedApp(
      pubkey: request.clientPubkey,
      relays: bunkerUrl.relays,
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
}
