import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nip19/nip19.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:nostr_widgets/widgets/widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/utils/translate_permission.dart';
import 'package:peridot/widgets/border_area_view.dart';
import 'package:peridot/widgets/trust_level_options_view.dart';

class ManageAppPage extends StatelessWidget {
  const ManageAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageAppController());

    return GetBuilder<ManageAppController>(
      builder: (c) {
        final app = c.app;
        final l10n = AppLocalizations.of(context)!;
        if (app == null) {
          return Center(child: Text(l10n.appNotFound));
        }
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: controller.renameController,
              focusNode: controller.renameFocusNode,
              style: Theme.of(context).textTheme.titleLarge,
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              onSubmitted: (_) => controller.saveRename(),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              BorderAreaView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.connectedAccount,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: NPicture(
                        ndk: Repository.ndk,
                        pubkey: app.userPubkey,
                      ),
                      title: NName(ndk: Repository.ndk, pubkey: app.userPubkey),
                      subtitle: Text(Nip19.npubFromHex(app.appPubkey)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              BorderAreaView(
                padding: EdgeInsets.zero,
                child: SwitchListTile(
                  title: Text("Enable this app"),
                  subtitle: Text("When disabled, every requests are blocked"),
                  value: ManageAppController.to.app!.isEnabled,
                  onChanged: ManageAppController.to.appEnableChange,
                ),
              ),
              SizedBox(height: 16),
              TrustLevelView(),
              SizedBox(height: 16),
              BorderAreaView(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        l10n.permissions,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    if (app.permissions.isEmpty)
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          l10n.noPermissionsSet,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(fontStyle: FontStyle.italic),
                        ),
                      )
                    else
                      ...app.permissions.map(
                        (permission) => SwitchListTile(
                          title: Text(
                            translatePermission(context, permission.command),
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
                  label: Text(l10n.delete),
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

class TrustLevelView extends StatelessWidget {
  const TrustLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderAreaView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Trust level",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          GetBuilder<ManageAppController>(
            builder: (c) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    TrustLevelOptionsView(
                      appMode: c.app!.authorisationMode,
                      optionMode: AuthorisationMode.allwaysAsk,
                      onSelected: () => c.updateAuthorisationMode(
                        AuthorisationMode.allwaysAsk,
                      ),
                    ),
                    SizedBox(height: 8),
                    TrustLevelOptionsView(
                      appMode: ManageAppController.to.app!.authorisationMode,
                      optionMode: AuthorisationMode.allowCommonRequests,
                      onSelected: () => c.updateAuthorisationMode(
                        AuthorisationMode.allowCommonRequests,
                      ),
                    ),
                    SizedBox(height: 8),
                    TrustLevelOptionsView(
                      appMode: ManageAppController.to.app!.authorisationMode,
                      optionMode: AuthorisationMode.fullyTrust,
                      onSelected: () => c.updateAuthorisationMode(
                        AuthorisationMode.fullyTrust,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
