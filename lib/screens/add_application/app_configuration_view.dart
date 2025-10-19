import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';
import 'package:peridot/utils/translate_permission.dart';

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
          ...app.permissions.map(
            (permission) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(translatePermission(context, permission.command)),
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
            return FilledButton(onPressed: c.finish, child: Text("Finish"));
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Trust level", style: Get.textTheme.titleMedium),
        Obx(() {
          final selectedAuthorisationMode =
              AddApplicationController.to.appAuthorisationMode.value;
          return Column(
            children: [
              Builder(
                builder: (context) {
                  final isSelected =
                      selectedAuthorisationMode == AuthorisationMode.allwaysAsk;

                  final child = Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? Get.theme.colorScheme.primary
                            : Get.theme.colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: isSelected
                          ? Get.theme.colorScheme.primary.withValues(alpha: 0.1)
                          : null,
                    ),
                    child: ListTile(
                      title: Text("Allways ask permission"),
                      subtitle: Text(
                        "For each request from the app, you will chose what to do",
                      ),
                    ),
                  );

                  if (isSelected) return child;

                  return GestureDetector(
                    onTap: () {
                      AddApplicationController.to.appAuthorisationMode.value =
                          AuthorisationMode.allwaysAsk;
                    },
                    child: child,
                  );
                },
              ),
              SizedBox(height: 8),
              Builder(
                builder: (context) {
                  final isSelected =
                      selectedAuthorisationMode ==
                      AuthorisationMode.allowCommonRequests;
                  final child = Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? Get.theme.colorScheme.primary
                            : Get.theme.colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: isSelected
                          ? Get.theme.colorScheme.primary.withValues(alpha: 0.1)
                          : null,
                    ),
                    child: ListTile(
                      title: Text("Allow common actions"),
                      subtitle: Text(
                        "Common requests are automatically processed, you will chose what to do with the others",
                      ),
                    ),
                  );

                  if (isSelected) return child;

                  return GestureDetector(
                    onTap: () {
                      AddApplicationController.to.appAuthorisationMode.value =
                          AuthorisationMode.allowCommonRequests;
                    },
                    child: child,
                  );
                },
              ),
              SizedBox(height: 8),
              Builder(
                builder: (context) {
                  final isSelected =
                      selectedAuthorisationMode == AuthorisationMode.fullyTrust;
                  final child = Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? Get.theme.colorScheme.primary
                            : Get.theme.colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: isSelected
                          ? Get.theme.colorScheme.primary.withValues(alpha: 0.1)
                          : null,
                    ),
                    child: ListTile(
                      title: Text("Fully trust"),
                      subtitle: Text(
                        "Every requests are automatically processed",
                      ),
                    ),
                  );

                  if (isSelected) return child;

                  return GestureDetector(
                    onTap: () {
                      AddApplicationController.to.appAuthorisationMode.value =
                          AuthorisationMode.fullyTrust;
                    },
                    child: child,
                  );
                },
              ),
            ],
          );
        }),
      ],
    );
  }
}
