import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_widgets/widgets/n_picture.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/widgets/no_apps_view.dart';

class ApplicationsView extends StatelessWidget {
  const ApplicationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Repository>(
      builder: (_) {
        if (Repository.bunker.apps.isEmpty) return NoAppsView();

        return GetBuilder<HomeController>(
          builder: (c) {
            if (c.appsWithRequests.isEmpty) return NoAppsView();

            return ListView.builder(
              padding: EdgeInsets.only(bottom: kToolbarHeight + 12),
              itemCount: c.appsWithRequests.length,
              itemBuilder: (context, index) {
                final app = c.appsWithRequests[index];

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
    );
  }
}
