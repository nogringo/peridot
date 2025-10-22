import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/utils/translate_permission.dart';
import 'package:peridot/widgets/border_area_view.dart';

class PermissionsView extends StatelessWidget {
  const PermissionsView({super.key});

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
          if (ManageAppController.to.app!.permissions.isEmpty)
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
            ...ManageAppController.to.app!.permissions.map(
              (permission) => SwitchListTile(
                title: Text(translatePermission(context, permission.command)),
                value: permission.isAllowed,
                onChanged: (_) =>
                    ManageAppController.to.togglePermission(permission),
              ),
            ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
