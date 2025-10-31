import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/destinations/applications_view.dart';
import 'package:peridot/screens/home/destinations/requests_view.dart';
import 'package:peridot/screens/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController()..init());

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;

        final appBarWidget = AppBar(
          title: Text(
            [
              AppLocalizations.of(context)!.applications,
              "Requests",
            ][HomeController.to.selectedIndex.value],
          ),
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(AppRoutes.settings),
              icon: Icon(Icons.settings),
            ),
            SizedBox(width: 12),
          ],
        );

        return Obx(() {
          if (isWide) {
            return Scaffold(
              appBar: appBarWidget,
              body: Row(
                children: [
                  NavigationRail(
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.apps),
                        label: Text(AppLocalizations.of(context)!.applications),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.inbox),
                        label: Text("Requests"),
                      ),
                    ],
                    selectedIndex: HomeController.to.selectedIndex.value,
                    onDestinationSelected:
                        HomeController.to.onDestinationSelected,
                  ),
                  [
                    ApplicationsView(),
                    RequestsView(),
                  ][HomeController.to.selectedIndex.value],
                ],
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
          }

          return Scaffold(
            appBar: appBarWidget,
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
                  icon: Icon(Icons.inbox),
                  label: "Requests",
                ),
              ],
              onDestinationSelected: HomeController.to.onDestinationSelected,
            ),
          );
        });
      },
    );
  }
}
