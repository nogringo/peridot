import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nip19/nip19.dart';
import 'package:nostr_widgets/widgets/widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/utils/translate_permission.dart';
import 'package:peridot/widgets/border_area_view.dart';

class ManageAppPage extends StatelessWidget {
  const ManageAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageAppController());

    return GetBuilder<ManageAppController>(
      builder: (c) {
        final app = c.app;
        if (app == null) {
          return Center(child: Text("App not found"));
        }
        return Scaffold(
          appBar: AppBar(title: Text(app.name)),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              BorderAreaView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Connected account",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: NPicture(
                        ndk: Repository.ndk,
                        pubkey: app.signerPubkey,
                      ),
                      title: NName(
                        ndk: Repository.ndk,
                        pubkey: app.signerPubkey,
                      ),
                      subtitle: Text(Nip19.npubFromHex(app.appPubkey)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              BorderAreaView(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Permissions",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    if (app.permissions.isEmpty)
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "No permissions set",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(fontStyle: FontStyle.italic),
                        ),
                      )
                    else
                      ...app.permissions.map(
                        (permission) => SwitchListTile(
                          title: Text(
                            translatePermission(context, permission.name),
                          ),
                          value: permission.isAllowed,
                          onChanged: (_) =>
                              controller.togglePermission(permission),
                        ),
                      ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton.icon(
                  onPressed: controller.deleteApp,
                  label: Text("Remove ${app.name}"),
                  icon: Icon(Icons.delete_outline),
                ),
              ),
              SizedBox(height: kToolbarHeight),
            ],
          ),
        );
      },
    );
  }
}
