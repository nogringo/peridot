import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';
import 'package:peridot/utils/translate_permission.dart';
import 'package:peridot/widgets/trust_level_options_view.dart';

class AppConfigurationView extends StatelessWidget {
  const AppConfigurationView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final app = AddApplicationController.to.app;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.appName, style: Get.textTheme.titleMedium),
        TextField(
          controller: AddApplicationController.to.appNameFieldController,
          onChanged: (value) => AddApplicationController.to.update(),
          decoration: InputDecoration(hintText: l10n.enterAppName),
        ),
        SizedBox(height: 16),
        TrustLevelView(),
        SizedBox(height: 16),
        Text(l10n.requestedPermissions, style: Get.textTheme.titleMedium),
        SizedBox(height: 8),
        if (app != null && app.permissions.isNotEmpty)
          GetBuilder<AddApplicationController>(
            builder: (c) {
              return Column(
                children: app.permissions
                    .map(
                      (permission) => SwitchListTile(
                        title: Text(
                          translatePermission(context, permission.command),
                        ),
                        value: permission.isAllowed,
                        onChanged: (_) => AddApplicationController.to
                            .togglePermission(permission),
                      ),
                    )
                    .toList(),
              );
            },
          )
        else
          Text(
            l10n.noSpecificPermissionsRequested,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        SizedBox(height: 32),
        GetBuilder<AddApplicationController>(
          builder: (c) {
            return FilledButton(onPressed: c.finish, child: Text(l10n.finish));
          },
        ),
      ],
    );
  }
}

class TrustLevelView extends StatelessWidget {
  const TrustLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.trustLevel, style: Get.textTheme.titleMedium),
        Obx(() {
          final selectedAuthorisationMode =
              AddApplicationController.to.appAuthorisationMode.value;
          return Column(
            children: [
              TrustLevelOptionsView(
                appMode: selectedAuthorisationMode,
                optionMode: AuthorisationMode.allwaysAsk,
                onSelected: () {
                  AddApplicationController.to.appAuthorisationMode.value =
                      AuthorisationMode.allwaysAsk;
                },
              ),
              SizedBox(height: 8),
              TrustLevelOptionsView(
                appMode: selectedAuthorisationMode,
                optionMode: AuthorisationMode.allowCommonRequests,
                onSelected: () {
                  AddApplicationController.to.appAuthorisationMode.value =
                      AuthorisationMode.allowCommonRequests;
                },
              ),
              SizedBox(height: 8),
              TrustLevelOptionsView(
                appMode: selectedAuthorisationMode,
                optionMode: AuthorisationMode.fullyTrust,
                onSelected: () {
                  AddApplicationController.to.appAuthorisationMode.value =
                      AuthorisationMode.fullyTrust;
                },
              ),
            ],
          );
        }),
      ],
    );
  }
}
