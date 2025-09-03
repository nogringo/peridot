import 'dart:math';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:peridot/config.dart';
import 'package:peridot/utils/get_database.dart';
import 'package:sembast/sembast.dart' hide Filter;

class Repository extends GetxController {
  static Repository get to => Get.find();
  static Ndk get ndk => Get.find();

  bool isAppLoaded = false;
  NdkResponse? signingRequestsSubscription;

  late Database db;

  List<String> get bunkerDefaultRelays => ["wss://relay.nsec.app"];

  void loadApp() async {
    if (isAppLoaded) return;
    isAppLoaded = true;

    db = await getDatabase(appTitle);
    listenSigningRequests();
  }

  void listenSigningRequests() async {
    stopSigningRequestsSubscription();

    // Get authorized keys from database
    final store = intMapStoreFactory.store('authorized_apps');
    final records = await store.find(db);
    final authorizedKeys = records
        .map((record) => record.value['pubkey'] as String?)
        .where((key) => key != null)
        .cast<String>()
        .toList();

    signingRequestsSubscription = ndk.requests.subscription(
      filters: [
        Filter(
          kinds: [24133],
          authors: authorizedKeys,
          pTags: ndk.accounts.accounts.keys.toList(),
        ),
      ],
    );

    signingRequestsSubscription!.stream.listen(processSigningRequest);
  }

  void stopSigningRequestsSubscription() async {
    if (signingRequestsSubscription == null) return;

    final subId = signingRequestsSubscription!.requestId;
    await ndk.requests.closeSubscription(subId);
    signingRequestsSubscription = null;
  }

  void processSigningRequest(Nip01Event event) {
    
  }

  String generateBunkerUrl() {
    // Get the current user's public key
    final account = ndk.accounts.getLoggedAccount();
    if (account == null) return '';

    // Generate a random secret token
    final random = Random.secure();
    final secretBytes = List<int>.generate(16, (i) => random.nextInt(256));
    final secret = secretBytes
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();

    // Use bunker default relays
    final relayParams = bunkerDefaultRelays
        .map((url) => 'relay=$url')
        .join('&');

    // Construct the bunker URL
    return 'bunker://${account.pubkey}?$relayParams&secret=$secret';
  }
}
