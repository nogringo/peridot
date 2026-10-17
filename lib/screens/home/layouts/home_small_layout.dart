import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/destinations/applications_view.dart';
import 'package:peridot/screens/home/destinations/logs_view.dart';
import 'package:peridot/screens/home/destinations/requests_view.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/widgets/requests_icon_view.dart';

class HomeSmallLayout extends StatelessWidget {
  final HomeController controller;

  const HomeSmallLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              [
                AppLocalizations.of(context)!.applications,
                AppLocalizations.of(context)!.requests,
                AppLocalizations.of(context)!.logs,
              ][controller.selectedIndex],
            ),
            actions: [
              IconButton(
                tooltip: AppLocalizations.of(context)!.settings,
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.settings),
                icon: Icon(Icons.settings),
              ),
              SizedBox(width: 12),
            ],
          ),
          body: [
            ApplicationsView(controller: controller),
            RequestsView(controller: controller),
            LogsView(controller: controller),
          ][controller.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: controller.selectedIndex,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.apps),
                label: AppLocalizations.of(context)!.applications,
              ),
              NavigationDestination(
                icon: RequestsIconView(controller: controller),
                label: AppLocalizations.of(context)!.requests,
              ),
              NavigationDestination(
                icon: Icon(Icons.history),
                label: AppLocalizations.of(context)!.logs,
              ),
            ],
            onDestinationSelected: controller.onDestinationSelected,
          ),
          floatingActionButton: controller.selectedIndex == 0
              ? FloatingActionButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, AppRoutes.addApplication);
                  },
                  child: Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}
