import 'package:flutter/material.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/add_privkey/add_privkey_page.dart';
import 'package:peridot/screens/add_application/add_application_page.dart';
import 'package:peridot/screens/home/home_page.dart';
import 'package:peridot/screens/request/request_page.dart';
import 'package:peridot/screens/settings/settings_page.dart';
import 'package:peridot/screens/backup_account/backup_account_page.dart';
import 'package:peridot/screens/manage_app/manage_app_page.dart';

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigator => navigatorKey.currentState!;
  static BuildContext get context => navigatorKey.currentContext!;

  static const String applications = '/';
  static const String addPrivkey = '/add-nsec';
  static const String addApplication = '/add-application';
  static const String settings = '/settings';
  static String backupAccount(String pubkey) => '/backup-account/$pubkey';
  static String manageApp(String appPubkey) => '/manage-app/$appPubkey';
  static String request(String requestId) => '/request/$requestId';

  static Route<void>? onGenerateRoute(RouteSettings settings) {
    var name = settings.name ?? applications;
    if (name == applications && Repository.to.usersPubkeys.isEmpty) {
      name = addPrivkey;
    }

    final Widget? page = switch (Uri.parse(name).pathSegments) {
      [] => const HomePage(),
      ['add-nsec'] => const AddPrivkeyPage(),
      ['add-application'] => const AddApplicationPage(),
      ['settings'] => const SettingsPage(),
      ['backup-account', final pubkey] => BackupAccountPage(pubkey: pubkey),
      ['manage-app', final appPubkey] => ManageAppPage(appPubkey: appPubkey),
      ['request', final requestId] => RequestPage(requestId: requestId),
      _ => null,
    };
    if (page == null) return null;

    return MaterialPageRoute(
      settings: RouteSettings(name: name, arguments: settings.arguments),
      builder: (_) => page,
    );
  }
}
