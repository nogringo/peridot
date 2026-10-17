import 'dart:async';

import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/controllers/controller.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:sembast/sembast.dart';

enum AppSortOption { name, lastUsed }

enum AppSortOrder { ascending, descending }

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

class HomeController extends Controller {
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

  static List<AppWithRequests> getSortedApps(
    List<BunkerRequest> requests, {
    AppSortOption sortOption = AppSortOption.name,
    AppSortOrder sortOrder = AppSortOrder.ascending,
    String? filterByAccount,
  }) {
    var apps = Repository.bunker.apps;

    if (filterByAccount != null) {
      apps = apps.where((app) => app.userPubkey == filterByAccount).toList();
    }

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

    final isAscending = sortOrder == AppSortOrder.ascending;

    switch (sortOption) {
      case AppSortOption.name:
        result.sort((a, b) {
          final nameA = a.app.name?.toLowerCase() ?? '';
          final nameB = b.app.name?.toLowerCase() ?? '';
          return isAscending ? nameA.compareTo(nameB) : nameB.compareTo(nameA);
        });
        break;
      case AppSortOption.lastUsed:
        final lastUsedMap = Repository.to.appLastUsed;
        result.sort((a, b) {
          final lastUsedA = lastUsedMap[a.app.appPubkey] ?? 0;
          final lastUsedB = lastUsedMap[b.app.appPubkey] ?? 0;
          return isAscending
              ? lastUsedA.compareTo(lastUsedB)
              : lastUsedB.compareTo(lastUsedA);
        });
        break;
    }

    return result;
  }

  late StreamSubscription requestsSub;
  late StreamSubscription allRequestsSub;
  List<BunkerRequest> requests = [];
  List<BunkerRequest> allRequests = [];
  List<AppWithRequests> appsWithRequests = [];

  AppSortOption sortOption = AppSortOption.name;
  AppSortOrder sortOrder = AppSortOrder.ascending;
  String? filterByAccount;

  List<BunkerRequest> get pendingRequests => requests
      .where((req) => req.status == BunkerRequestStatus.pending)
      .toList();

  void init() {
    Repository.to.addListener(_onRepositoryChange);

    requestsSub = stringMapStoreFactory
        .store('requests')
        .query(
          finder: Finder(
            sortOrders: [SortOrder('date', false)],
            filter: Filter.not(
              Filter.equals("status", BunkerRequestStatus.processed.name),
            ),
          ),
        )
        .onSnapshots(Repository.to.db)
        .listen((requests) {
          this.requests = requests
              .map((e) => BunkerRequest.fromJson(e.value))
              .where(
                (req) => Repository.bunker.getApp(req.originalRequest) != null,
              )
              .toList();
          _updateAppsWithRequests(
            requests.values
                .map((e) => BunkerRequest.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          update();
        });

    allRequestsSub = stringMapStoreFactory
        .store('requests')
        .query(finder: Finder(sortOrders: [SortOrder('date', false)]))
        .onSnapshots(Repository.to.db)
        .listen((requests) {
          allRequests = requests
              .map((e) => BunkerRequest.fromJson(e.value))
              .where(
                (req) => Repository.bunker.getApp(req.originalRequest) != null,
              )
              .toList();
          update();
        });
  }

  void _onRepositoryChange() {
    _updateAppsWithRequests(requests);
    update();
  }

  void _updateAppsWithRequests(List<BunkerRequest> requests) {
    appsWithRequests = getSortedApps(
      requests,
      sortOption: sortOption,
      sortOrder: sortOrder,
      filterByAccount: filterByAccount,
    );
  }

  void toggleSort(AppSortOption option) {
    if (sortOption == option) {
      // Toggle order if same column clicked
      sortOrder = sortOrder == AppSortOrder.ascending
          ? AppSortOrder.descending
          : AppSortOrder.ascending;
    } else {
      // New column, reset to ascending
      sortOption = option;
      sortOrder = AppSortOrder.ascending;
    }
    _updateAppsWithRequests(requests);
    update();
  }

  void setFilterByAccount(String? pubkey) {
    filterByAccount = pubkey;
    _updateAppsWithRequests(requests);
    update();
  }

  @override
  void dispose() {
    Repository.to.removeListener(_onRepositoryChange);
    requestsSub.cancel();
    allRequestsSub.cancel();
    super.dispose();
  }

  Future<void> deleteAllLogs() async {
    final requestsStore = stringMapStoreFactory.store('requests');
    final recordKeys = allRequests
        .map((req) => req.originalRequest.id)
        .toList();
    await requestsStore.records(recordKeys).delete(Repository.to.db);
  }
}
