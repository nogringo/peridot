import 'package:flutter/material.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';
import 'package:peridot/widgets/trust_level_options_view.dart';

class TrustLevelView extends StatelessWidget {
  final ManageAppController controller;

  const TrustLevelView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final appMode = controller.app!.authorisationMode;
    return BorderAreaView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              l10n.trustLevel,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                TrustLevelOptionsView(
                  appMode: appMode,
                  optionMode: AuthorisationMode.allwaysAsk,
                  onSelected: () => controller.updateAuthorisationMode(
                    AuthorisationMode.allwaysAsk,
                  ),
                ),
                SizedBox(height: 8),
                TrustLevelOptionsView(
                  appMode: appMode,
                  optionMode: AuthorisationMode.allowCommonRequests,
                  onSelected: () => controller.updateAuthorisationMode(
                    AuthorisationMode.allowCommonRequests,
                  ),
                ),
                SizedBox(height: 8),
                TrustLevelOptionsView(
                  appMode: appMode,
                  optionMode: AuthorisationMode.fullyTrust,
                  onSelected: () => controller.updateAuthorisationMode(
                    AuthorisationMode.fullyTrust,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
