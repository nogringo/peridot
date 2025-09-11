import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';
import 'package:peridot/utils/translate_permission.dart';

class AddThisAppView extends StatelessWidget {
  const AddThisAppView({super.key});

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
        Text(l10n.requestedPermissions, style: Get.textTheme.titleMedium),
        SizedBox(height: 8),
        if (app != null && app.permissions.isNotEmpty)
          ...app.permissions.map(
            (permission) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(
                    permission.isAllowed ? Icons.check_circle : Icons.block,
                    size: 16,
                    color: permission.isAllowed ? Colors.green : Colors.red,
                  ),
                  SizedBox(width: 8),
                  Text(translatePermission(context, permission.name)),
                ],
              ),
            ),
          )
        else
          Text(
            l10n.noSpecificPermissionsRequested,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        SizedBox(height: 32),
        GetBuilder<AddApplicationController>(
          builder: (c) {
            return FilledButton(
              onPressed: c.canAddApp ? c.addApp : null,
              child: Text(l10n.addThisApp),
            );
          },
        ),
      ],
    );
  }
}
