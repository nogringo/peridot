import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';

class AddThisAppView extends StatelessWidget {
  const AddThisAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AddApplicationController.to.app;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("App name", style: Get.textTheme.titleMedium),
        TextField(
          controller: AddApplicationController.to.appNameFieldController,
          onChanged: (value) => AddApplicationController.to.update(),
        ),
        SizedBox(height: 16),
        Text("Requested permissions", style: Get.textTheme.titleMedium),
        SizedBox(height: 8),
        if (app != null && app.permissions.isNotEmpty)
          ...app.permissions.map(
            (permission) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(permission),
            ),
          )
        else
          Text(
            "No specific permissions requested",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        SizedBox(height: 32),
        GetBuilder<AddApplicationController>(
          builder: (c) {
            return FilledButton(
              onPressed: c.canAddApp ? c.addApp : null,
              child: Text("Add this app"),
            );
          },
        ),
      ],
    );
  }
}
