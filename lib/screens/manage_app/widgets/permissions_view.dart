import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';
import 'package:peridot/widgets/permission_switch_tile.dart';

class PermissionsView extends StatelessWidget {
  final ManageAppController controller;

  const PermissionsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BorderAreaView(
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
          if (controller.app!.permissions.isEmpty)
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                l10n.noPermissionsSet,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
              ),
            )
          else
            ...controller.app!.permissions.map(
              (permission) => PermissionSwitchTile(
                permission: permission,
                onToggle: () => controller.togglePermission(permission),
              ),
            ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
