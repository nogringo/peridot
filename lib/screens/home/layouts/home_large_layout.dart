import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/destinations/applications_view.dart';
import 'package:peridot/screens/home/destinations/logs_view.dart';
import 'package:peridot/screens/home/destinations/requests_view.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/widgets/requests_icon_view.dart';

class HomeLargeLayout extends StatelessWidget {
  final HomeController controller;

  const HomeLargeLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: ListenableBuilder(
            listenable: controller,
            builder: (context, _) {
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
                                          l10n.appBrandName,
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
                              icon: RequestsIconView(controller: controller),
                              label: Text(
                                AppLocalizations.of(context)!.requests,
                              ),
                            ),
                            NavigationRailDestination(
                              icon: Icon(Icons.history),
                              label: Text(AppLocalizations.of(context)!.logs),
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
                                        onPressed: () => Navigator.pushNamed(
                                          context,
                                          AppRoutes.settings,
                                        ),
                                        label: Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.settings,
                                        ),
                                        icon: Icon(Icons.settings),
                                      ),
                                    ),
                                  );
                                }
                                return IconButton(
                                  tooltip: l10n.settings,
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.settings,
                                  ),
                                  icon: Icon(Icons.settings),
                                );
                              },
                            ),
                          ),
                          trailingAtBottom: true,
                          selectedIndex: controller.selectedIndex,
                          onDestinationSelected:
                              controller.onDestinationSelected,
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
                              ApplicationsView(controller: controller),
                              RequestsView(controller: controller),
                              LogsView(controller: controller),
                            ][controller.selectedIndex],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                floatingActionButton: controller.selectedIndex == 0
                    ? FloatingActionButton(
                        onPressed: () async {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.addApplication,
                          );
                        },
                        child: Icon(Icons.add),
                      )
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
