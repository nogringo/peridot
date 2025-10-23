import 'package:get/get.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:sembast/sembast.dart';

class AppWithRequests {
  App app;
  List<BunkerRequest> pending;
  List<BunkerRequest> blocked;

  AppWithRequests({
    required this.app,
    required this.pending,
    required this.blocked,
  });
}

class ApplicationController extends GetxController {
  static ApplicationController get to => Get.find();

  static Stream<List<RecordSnapshot<String, Map<String, Object?>>>>
  requestsStream = stringMapStoreFactory
      .store('requests')
      .query(
        finder: Finder(
          filter: Filter.not(
            Filter.equals("status", BunkerRequestStatus.processed.name),
          ),
        ),
      )
      .onSnapshots(Repository.to.db);

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

  static List<AppWithRequests> getSortedApps(List<BunkerRequest> requests) {
    var apps = Repository.bunker.apps;
    List<AppWithRequests> result = [];

    for (var app in apps) {
      final pending = requests
          .where(
            (req) =>
                req.originalRequest.appPubkey == app.appPubkey &&
                req.status == BunkerRequestStatus.pending,
          )
          .toList();
      final blocked = requests
          .where(
            (req) =>
                req.originalRequest.appPubkey == app.appPubkey &&
                req.status == BunkerRequestStatus.blocked,
          )
          .toList();

      result.add(AppWithRequests(app: app, pending: pending, blocked: blocked));
    }

    result.sort((a, b) => b.pending.length.compareTo(a.pending.length));

    return result;
  }
}
