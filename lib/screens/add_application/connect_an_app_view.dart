import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class ConnectAnAppView extends StatelessWidget {
  final AddApplicationController controller;

  const ConnectAnAppView({super.key, required this.controller});

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
                AppLocalizations.of(context)!.connectWithBunkerUrl,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              SelectableText(controller.bunkerUrl ?? ""),
              SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => controller.copyBunkerUrl(),
                child: Text(AppLocalizations.of(context)!.copyBunkerUrl),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        NostrConnectView(controller: controller),
      ],
    );
  }
}

class NostrConnectView extends StatelessWidget {
  final AddApplicationController controller;

  const NostrConnectView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BorderAreaView(
      padding: EdgeInsets.all(16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.connectWithNostrConnectUrl,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              TextField(
                controller: controller.nostrConnectFieldController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.nostrConnectUrlHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: controller.onNostrConnectFieldChanged,
              ),
              SizedBox(height: 12),
              OutlinedButton(
                onPressed: controller.hasNostrConnectURL
                    ? controller.connectWithNostrConnect
                    : null,
                child: Text(AppLocalizations.of(context)!.connect),
              ),
            ],
          ),
          if (controller.isNostrConnectConnecting)
            Positioned.fill(
              child: ColoredBox(
                color: Theme.of(
                  context,
                ).colorScheme.surface.withValues(alpha: 0.5),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
