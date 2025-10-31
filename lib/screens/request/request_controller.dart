import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:sembast/sembast.dart';

class RequestController extends GetxController {
  static RequestController get to => Get.find();

  BunkerRequest? request;

  App? get app => Repository.bunker.apps
      .where((app) => app.appPubkey == request!.originalRequest.appPubkey)
      .firstOrNull;
  RxBool isJsonCopied = false.obs;

  bool get isRequestPending =>
      RequestController.to.request!.status == BunkerRequestStatus.pending;
  bool get isRequestBlocked =>
      RequestController.to.request!.status == BunkerRequestStatus.blocked;
  bool get isRequestProcessed =>
      RequestController.to.request!.status == BunkerRequestStatus.processed;

  @override
  void onInit() async {
    super.onInit();

    final requestId = Get.parameters['requestId']!;

    var store = stringMapStoreFactory.store('requests');
    final record = await store.record(requestId).get(Repository.to.db);

    request = BunkerRequest.fromJson(record as Map<String, dynamic>);

    update();
  }

  void copyJson(String json) async {
    if (isJsonCopied.value) return;
    Clipboard.setData(ClipboardData(text: json));
    isJsonCopied.value = true;
    await Future.delayed(Duration(seconds: 2));
    isJsonCopied.value = false;
  }

  void allowOnce() {
    Get.back();

    Repository.bunker.processRequest(request!.originalRequest);
  }

  void rejectOnce() async {
    Get.back();

    request!.status = BunkerRequestStatus.blocked;
    var store = stringMapStoreFactory.store('requests');
    await store
        .record(request!.originalRequest.id)
        .put(Repository.to.db, request!.toJson());
  }

  void allowForever() async {
    Get.back();

    Repository.bunker.allowForever(
      command: request!.originalRequest.commandString,
      app: app!,
    );

    ManageAppController.to.update();
    Repository.to.saveBunkerState();

    var store = stringMapStoreFactory.store('requests');
    final finder = Finder(
      filter: Filter.custom((record) {
        final req = BunkerRequest.fromJson(
          record.value as Map<String, dynamic>,
        );
        return req.status == BunkerRequestStatus.pending &&
            req.originalRequest.appPubkey ==
                request!.originalRequest.appPubkey &&
            req.originalRequest.commandString ==
                request!.originalRequest.commandString;
      }),
    );

    final pendingSnapshots = await store.find(Repository.to.db, finder: finder);

    for (var snapshot in pendingSnapshots) {
      final pendingRequest = BunkerRequest.fromJson(
        snapshot.value as Map<String, dynamic>,
      );

      Repository.bunker.processRequest(pendingRequest.originalRequest);
    }
  }

  void rejectForever() async {
    Get.back();

    Repository.bunker.rejectForever(
      command: request!.originalRequest.commandString,
      app: app!,
    );

    ManageAppController.to.update();
    Repository.to.saveBunkerState();

    var store = stringMapStoreFactory.store('requests');
    final finder = Finder(
      filter: Filter.custom((record) {
        final req = BunkerRequest.fromJson(
          record.value as Map<String, dynamic>,
        );
        return req.status == BunkerRequestStatus.pending &&
            req.originalRequest.appPubkey ==
                request!.originalRequest.appPubkey &&
            req.originalRequest.commandString ==
                request!.originalRequest.commandString;
      }),
    );

    final pendingSnapshots = await store.find(Repository.to.db, finder: finder);

    for (var snapshot in pendingSnapshots) {
      final pendingRequest = BunkerRequest.fromJson(
        snapshot.value as Map<String, dynamic>,
      );
      pendingRequest.status = BunkerRequestStatus.blocked;
      store
          .record(pendingRequest.originalRequest.id)
          .put(Repository.to.db, pendingRequest.toJson());
    }
  }

  Future<void> deleteRequest() async {
    Get.back();

    var store = stringMapStoreFactory.store('requests');
    await store.record(request!.originalRequest.id).delete(Repository.to.db);
  }
}
