import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_widgets/widgets/widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/applications/application_controller.dart';
import 'package:peridot/screens/applications/widgets/no_apps_view.dart';
import 'package:sembast/sembast.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ApplicationController());
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
          if (Repository.bunker.apps.isEmpty) return NoAppsView();

          return StreamBuilder(
            stream: ApplicationController.to.requestsStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();

              final appsWithRequests = ApplicationController.getSortedApps(
                snapshot.data!.values
                    .map(
                      (e) => BunkerRequest.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
              );

              if (appsWithRequests.isEmpty) return NoAppsView();

              return ListView.builder(
                padding: EdgeInsets.only(bottom: kToolbarHeight + 12),
                itemCount: appsWithRequests.length,
                itemBuilder: (context, index) {
                  final app = appsWithRequests[index];

                  return ListTile(
                    leading: NPicture(
                      ndk: Repository.ndk,
                      pubkey: app.app.userPubkey,
                    ),
                    title: Text(
                      app.app.name ?? "Unamed App",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: app.pending.isEmpty && app.blocked.isEmpty
                        ? null
                        : Row(
                            spacing: 8,
                            children: [
                              if (app.pending.isNotEmpty)
                                Chip(
                                  avatar: Icon(Icons.access_time),
                                  label: Text(app.pending.length.toString()),
                                ),
                              if (app.blocked.isNotEmpty)
                                Chip(
                                  avatar: Icon(Icons.dangerous),
                                  label: Text(app.blocked.length.toString()),
                                ),
                            ],
                          ),
                    onTap: () => Get.toNamed(
                      AppRoutes.manageApp.replaceAll(
                        ':appPubkey',
                        app.app.appPubkey,
                      ),
                      arguments: app,
                    ),
                  );
                },
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
