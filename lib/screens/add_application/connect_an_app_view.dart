import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class ConnectAnAppView extends StatelessWidget {
  const ConnectAnAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BorderAreaView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.connectWithNostrConnectUrl,
                style: Get.textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              TextField(
                controller:
                    AddApplicationController.to.nostrConnectFieldController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.nostrConnectUrlHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged:
                    AddApplicationController.to.onNostrConnectFieldChanged,
              ),
              SizedBox(height: 12),
              GetBuilder<AddApplicationController>(
                builder: (c) {
                  return OutlinedButton(
                    onPressed: c.hasNostrConnectURL
                        ? c.connectWithNostrConnect
                        : null,
                    child: Text(AppLocalizations.of(context)!.connect),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        BorderAreaView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.connectWithBunkerUrl,
                style: Get.textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              GetBuilder<AddApplicationController>(
                builder: (c) {
                  return SelectableText(c.bunkerUrl?.url ?? "");
                },
              ),
              SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => AddApplicationController.to.copyBunkerUrl(),
                child: Text(AppLocalizations.of(context)!.copyBunkerUrl),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
