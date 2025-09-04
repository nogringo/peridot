import 'package:get/get.dart';
import 'package:peridot/screens/applications/applications_page.dart';
import 'package:peridot/screens/add_privkey/add_privkey_page.dart';
import 'package:peridot/screens/add_application/add_application_page.dart';
import 'package:peridot/screens/settings/settings_page.dart';
import 'package:peridot/screens/backup_account/backup_account_page.dart';
import 'package:peridot/middlewares/auth_middleware.dart';

class AppRoutes {
  static const String applications = '/';
  static const String addPrivkey = '/add-nsec';
  static const String addApplication = '/add-application';
  static const String settings = '/settings';
  static const String backupAccount = '/backup-account/:pubkey';

  static List<GetPage> pages = [
    GetPage(
      name: applications,
      page: () => ApplicationsPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(name: addPrivkey, page: () => AddPrivkeyPage()),
    GetPage(name: addApplication, page: () => AddApplicationPage()),
    GetPage(name: settings, page: () => SettingsPage()),
    GetPage(name: backupAccount, page: () => BackupAccountPage()),
  ];
}
