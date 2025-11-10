import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/destinations/applications_view.dart';
import 'package:peridot/screens/home/destinations/requests_view.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/widgets/requests_icon_view.dart';

class HomeLargeLayout extends StatelessWidget {
  const HomeLargeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: Obx(() {
            return Scaffold(
              body: LayoutBuilder(
                builder: (context, constraints) {
                  final isExtraWide = constraints.maxWidth >= 1000;
                  return Row(
                    children: [
                      NavigationRail(
                        extended: isExtraWide,
                        leading: Builder(
                          builder: (context) {
                            final icon = Icon(
                              Icons.album,
                              color: Theme.of(context).colorScheme.primary,
                              size: 32,
                            );

                            if (isExtraWide) {
                              return SizedBox(
                                width: 256,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(width: 12),
                                      icon,
                                      SizedBox(width: 24),
                                      Text(
                                        "Peridot",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return icon;
                          },
                        ),
                        destinations: [
                          NavigationRailDestination(
                            icon: Icon(Icons.apps),
                            label: Text(
                              AppLocalizations.of(context)!.applications,
                            ),
                          ),
                          NavigationRailDestination(
                            icon: RequestsIconView(),
                            label: Text(AppLocalizations.of(context)!.requests),
                          ),
                        ],
                        trailing: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Builder(
                            builder: (context) {
                              if (isExtraWide) {
                                return SizedBox(
                                  width: 256,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: OutlinedButton.icon(
                                      onPressed: () =>
                                          Get.toNamed(AppRoutes.settings),
                                      label: Text(
                                        AppLocalizations.of(context)!.settings,
                                      ),
                                      icon: Icon(Icons.settings),
                                    ),
                                  ),
                                );
                              }
                              return IconButton(
                                onPressed: () =>
                                    Get.toNamed(AppRoutes.settings),
                                icon: Icon(Icons.settings),
                              );
                            },
                          ),
                        ),
                        trailingAtBottom: true,
                        selectedIndex: HomeController.to.selectedIndex.value,
                        onDestinationSelected:
                            HomeController.to.onDestinationSelected,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Theme.of(context).dividerColor,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: [
                            ApplicationsView(),
                            RequestsView(),
                          ][HomeController.to.selectedIndex.value],
                        ),
                      ),
                    ],
                  );
                },
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
          }),
        ),
      ),
    );
  }
}
