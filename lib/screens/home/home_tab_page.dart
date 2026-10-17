import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/destinations/applications_view.dart';
import 'package:peridot/screens/home/destinations/logs_view.dart';
import 'package:peridot/screens/home/destinations/requests_view.dart';
import 'package:peridot/screens/home/home_shell.dart';

class HomeTabPage extends StatelessWidget {
  final HomeTab tab;

  const HomeTabPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = HomeScope.of(context).controller;
    return Scaffold(
      appBar: isWideLayout(context)
          ? null
          : AppBar(
              title: Text(switch (tab) {
                HomeTab.applications => l10n.applications,
                HomeTab.requests => l10n.requests,
                HomeTab.logs => l10n.logs,
              }),
              actions: [
                IconButton(
                  tooltip: l10n.settings,
                  onPressed: () => context.go(AppRoutes.settings),
                  icon: Icon(Icons.settings),
                ),
                SizedBox(width: 12),
              ],
            ),
      body: switch (tab) {
        HomeTab.applications => ApplicationsView(controller: controller),
        HomeTab.requests => RequestsView(controller: controller),
        HomeTab.logs => LogsView(controller: controller),
      },
      // On wide screens this button lives in the navigation rail.
      floatingActionButton:
          tab == HomeTab.applications && !isWideLayout(context)
          ? FloatingActionButton(
              tooltip: l10n.addAnApp,
              onPressed: () => context.go(AppRoutes.addApplication),
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
