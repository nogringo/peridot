import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_widgets/widgets/widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Applications"),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.settings),
            icon: Icon(Icons.settings),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Obx(() {
        final apps = Repository.to.authorizedApps;

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
                  "No applications connected",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Tap + to add an application",
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
              leading: NPicture(ndk: Repository.ndk, pubkey: app.signerPubkey),
              title: Text(
                app.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '${app.permissions.length} permission${app.permissions.length > 1 ? 's' : ''}',
              ),
              onTap: () => Get.toNamed(
                AppRoutes.manageApp.replaceAll(':appPubkey', app.appPubkey),
                arguments: app,
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(AppRoutes.addApplication);
          // Reload apps after returning
          Repository.to.loadAuthorizedApps();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
