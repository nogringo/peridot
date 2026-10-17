import 'package:flutter/material.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';
import 'package:peridot/widgets/permission_switch_tile.dart';
import 'package:peridot/widgets/trust_level_options_view.dart';

class AppConfigurationView extends StatelessWidget {
  final AddApplicationController controller;

  const AppConfigurationView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final app = controller.app;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.appName, style: textTheme.titleMedium),
            TextField(
              controller: controller.appNameFieldController,
              onChanged: (value) => controller.update(),
              decoration: InputDecoration(hintText: l10n.enterAppName),
            ),
            SizedBox(height: 16),
            TrustLevelView(controller: controller),
            SizedBox(height: 16),
            Text(l10n.requestedPermissions, style: textTheme.titleMedium),
            SizedBox(height: 8),
            if (app != null && app.permissions.isNotEmpty)
              Column(
                children: app.permissions
                    .map(
                      (permission) => PermissionSwitchTile(
                        permission: permission,
                        onToggle: () => controller.togglePermission(permission),
                      ),
                    )
                    .toList(),
              )
            else
              Text(
                l10n.noSpecificPermissionsRequested,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            SizedBox(height: 32),
            FilledButton(
              onPressed: () => controller.finish(context),
              child: Text(l10n.finish),
            ),
          ],
        ),
      ),
    );
  }
}

class TrustLevelView extends StatelessWidget {
  final AddApplicationController controller;

  const TrustLevelView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final selectedAuthorisationMode = controller.appAuthorisationMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.trustLevel, style: Theme.of(context).textTheme.titleMedium),
        TrustLevelOptionsView(
          appMode: selectedAuthorisationMode,
          optionMode: AuthorisationMode.allwaysAsk,
          onSelected: () =>
              controller.setAuthorisationMode(AuthorisationMode.allwaysAsk),
        ),
        SizedBox(height: 8),
        TrustLevelOptionsView(
          appMode: selectedAuthorisationMode,
          optionMode: AuthorisationMode.allowCommonRequests,
          onSelected: () => controller.setAuthorisationMode(
            AuthorisationMode.allowCommonRequests,
          ),
        ),
        SizedBox(height: 8),
        TrustLevelOptionsView(
          appMode: selectedAuthorisationMode,
          optionMode: AuthorisationMode.fullyTrust,
          onSelected: () =>
              controller.setAuthorisationMode(AuthorisationMode.fullyTrust),
        ),
      ],
    );
  }
}
