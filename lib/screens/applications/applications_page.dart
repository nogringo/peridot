import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_widgets/widgets/widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.applications),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.settings),
            icon: Icon(Icons.settings),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: GetBuilder<Repository>(
        builder: (_) {
          final apps = Repository.bunker.apps;

          if (apps.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apps_outlined,
                    size: 64,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                  SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.noApplicationsConnected,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.tapPlusToAddApplication,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.only(bottom: kToolbarHeight + 12),
            itemCount: apps.length,
            itemBuilder: (context, index) {
              final app = apps[index];

              return ListTile(
                leading: NPicture(ndk: Repository.ndk, pubkey: app.userPubkey),
                title: Text(
                  app.name ?? "Unamed App",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                onTap: () => Get.toNamed(
                  AppRoutes.manageApp.replaceAll(':appPubkey', app.appPubkey),
                  arguments: app,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Get.toNamed(AppRoutes.addApplication);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
