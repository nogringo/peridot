import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/controllers/repository.dart';
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
        final isExtraWide = constraints.maxWidth > 1200;

        final requestsIconWidget = GetBuilder<Repository>(
          builder: (_) {
            return GetBuilder<HomeController>(
              builder: (c) {
                final child = Icon(Icons.inbox);

                if (c.requests.isEmpty) return child;

                return Badge(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: Text(c.requests.length.toString()),
                  child: child,
                );
              },
            );
          },
        );

        return Obx(() {
          if (isWide) {
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
              body: Row(
                children: [
                  NavigationRail(
                    extended: isExtraWide,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.apps),
                        label: Text(AppLocalizations.of(context)!.applications),
                      ),
                      NavigationRailDestination(
                        icon: requestsIconWidget,
                        label: Text(AppLocalizations.of(context)!.requests),
                      ),
                    ],
                    selectedIndex: HomeController.to.selectedIndex.value,
                    onDestinationSelected:
                        HomeController.to.onDestinationSelected,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primaryContainer.withValues(alpha: 0.1),
                        border: Border(
                          top: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.1),
                            width: 1.5,
                          ),
                          left: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.1),
                            width: 1.5,
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                        ),
                      ),
                      child: [
                        ApplicationsView(),
                        RequestsView(),
                      ][HomeController.to.selectedIndex.value],
                    ),
                  ),
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
                  icon: requestsIconWidget,
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
      },
    );
  }
}
