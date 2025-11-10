import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/destinations/applications_view.dart';
import 'package:peridot/screens/home/destinations/requests_view.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/widgets/requests_icon_view.dart';

class HomeSmallLayout extends StatelessWidget {
  const HomeSmallLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            [
              AppLocalizations.of(context)!.applications,
              AppLocalizations.of(context)!.requests,
            ][HomeController.to.selectedIndex.value],
          ),
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(AppRoutes.settings),
              icon: Icon(Icons.settings),
            ),
            SizedBox(width: 12),
          ],
        ),
        body: [
          ApplicationsView(),
          RequestsView(),
        ][HomeController.to.selectedIndex.value],
        bottomNavigationBar: NavigationBar(
          selectedIndex: HomeController.to.selectedIndex.value,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.apps),
              label: AppLocalizations.of(context)!.applications,
            ),
            NavigationDestination(
              icon: RequestsIconView(),
              label: AppLocalizations.of(context)!.requests,
            ),
          ],
          onDestinationSelected: HomeController.to.onDestinationSelected,
        ),
        floatingActionButton: HomeController.to.selectedIndex.value == 0
            ? FloatingActionButton(
                onPressed: () async {
                  Get.toNamed(AppRoutes.addApplication);
                },
                child: Icon(Icons.add),
              )
            : null,
      );
    });
  }
}
