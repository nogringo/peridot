import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/controller.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:sembast/sembast.dart';

class RequestController extends Controller {
  BunkerRequest? request;

  App? get app => Repository.bunker.apps
      .where((app) => app.appPubkey == request!.originalRequest.appPubkey)
      .firstOrNull;
  bool isJsonCopied = false;

  bool get isRequestPending => request!.status == BunkerRequestStatus.pending;
  bool get isRequestBlocked => request!.status == BunkerRequestStatus.blocked;
  bool get isRequestProcessed =>
      request!.status == BunkerRequestStatus.processed;

  RequestController(String requestId) {
    _loadRequest(requestId);
  }

  Future<void> _loadRequest(String requestId) async {
    var store = stringMapStoreFactory.store('requests');
    final record = await store.record(requestId).get(Repository.to.db);

    request = BunkerRequest.fromJson(record as Map<String, dynamic>);

    update();
  }

  void copyJson(String json) async {
    if (isJsonCopied) return;
    Clipboard.setData(ClipboardData(text: json));
    isJsonCopied = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    isJsonCopied = false;
    update();
  }

  void allowOnce(BuildContext context) {
    Navigator.pop(context);

    Repository.bunker.processRequest(request!.originalRequest);
  }

  void rejectOnce(BuildContext context) async {
    Navigator.pop(context);

    request!.status = BunkerRequestStatus.blocked;
    var store = stringMapStoreFactory.store('requests');
    await store
        .record(request!.originalRequest.id)
        .put(Repository.to.db, request!.toJson());
  }

  void allowForever(BuildContext context) async {
    Navigator.pop(context);

    Repository.bunker.allowForever(
      command: request!.originalRequest.commandString,
      app: app!,
    );

    Repository.to.update();
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

  void rejectForever(BuildContext context) async {
    Navigator.pop(context);

    Repository.bunker.rejectForever(
      command: request!.originalRequest.commandString,
      app: app!,
    );

    Repository.to.update();
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

  Future<void> deleteRequest(BuildContext context) async {
    Navigator.pop(context);

    var store = stringMapStoreFactory.store('requests');
    await store.record(request!.originalRequest.id).delete(Repository.to.db);
  }
}
