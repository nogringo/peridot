import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/add_privkey/add_privkey_page.dart';
import 'package:peridot/screens/add_application/add_application_page.dart';
import 'package:peridot/screens/home/home_shell.dart';
import 'package:peridot/screens/home/home_tab_page.dart';
import 'package:peridot/screens/request/request_page.dart';
import 'package:peridot/screens/settings/settings_page.dart';
import 'package:peridot/screens/backup_account/backup_account_page.dart';
import 'package:peridot/screens/manage_app/manage_app_page.dart';

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentContext!;

  static const String applications = '/';
  static const String requests = '/requests';
  static const String logs = '/logs';
  static const tabs = [applications, requests, logs];
  static const String addPrivkey = '/add-nsec';
  static const String addApplication = '/add-application';
  static const String settings = '/settings';
  static const String settingsAddPrivkey = '/settings/add-nsec';
  static String backupAccount(String pubkey) =>
      '/settings/backup-account/$pubkey';
  static String manageApp(String appPubkey) => '/manage-app/$appPubkey';
  static String appRequest(String appPubkey, String requestId) =>
      '/manage-app/$appPubkey/request/$requestId';
  static String pendingRequest(String requestId) => '$requests/$requestId';
  static String loggedRequest(String requestId) => '$logs/$requestId';

  // Repository notifies on every bunker request, the redirect only cares about this.
  static final _hasAccounts = () {
    final notifier = ValueNotifier(Repository.to.usersPubkeys.isNotEmpty);
    Repository.to.addListener(
      () => notifier.value = Repository.to.usersPubkeys.isNotEmpty,
    );
    return notifier;
  }();

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    refreshListenable: _hasAccounts,
    redirect: (context, state) {
      if (_hasAccounts.value || state.matchedLocation == addPrivkey) {
        return null;
      }
      return addPrivkey;
    },
    onException: (context, state, router) => router.go(applications),
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeShell(state: state, navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: applications,
                builder: (context, state) =>
                    const HomeTabPage(tab: HomeTab.applications),
                routes: [
                  GoRoute(
                    path: 'add-application',
                    builder: (context, state) => const AddApplicationPage(),
                  ),
                  GoRoute(
                    path: 'manage-app/:appPubkey',
                    builder: (context, state) => ManageAppPage(
                      appPubkey: state.pathParameters['appPubkey']!,
                    ),
                    routes: [_requestRoute('request/:requestId')],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: requests,
                builder: (context, state) =>
                    const HomeTabPage(tab: HomeTab.requests),
                routes: [_requestRoute(':requestId')],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: logs,
                builder: (context, state) =>
                    const HomeTabPage(tab: HomeTab.logs),
                routes: [_requestRoute(':requestId')],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: settings,
                builder: (context, state) => const SettingsPage(),
                routes: [
                  GoRoute(
                    path: 'add-nsec',
                    builder: (context, state) => const AddPrivkeyPage(),
                  ),
                  GoRoute(
                    path: 'backup-account/:pubkey',
                    builder: (context, state) => BackupAccountPage(
                      pubkey: state.pathParameters['pubkey']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: addPrivkey,
        builder: (context, state) => const AddPrivkeyPage(),
      ),
    ],
  );

  static GoRoute _requestRoute(String path) => GoRoute(
    path: path,
    builder: (context, state) =>
        RequestPage(requestId: state.pathParameters['requestId']!),
  );
}
