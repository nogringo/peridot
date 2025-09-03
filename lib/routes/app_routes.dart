import 'package:get/get.dart';
import 'package:peridot/screens/applications/applications_page.dart';
import 'package:peridot/screens/add_privkey/add_privkey_page.dart';
import 'package:peridot/screens/add_application/add_application_page.dart';
import 'package:peridot/middlewares/auth_middleware.dart';

class AppRoutes {
  static const String applications = '/';
  static const String addPrivkey = '/add-nsec';
  static const String addApplication = '/add-application';

  static List<GetPage> pages = [
    GetPage(
      name: applications,
      page: () => ApplicationsPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(name: addPrivkey, page: () => AddPrivkeyPage()),
    GetPage(name: addApplication, page: () => AddApplicationPage()),
  ];
}
