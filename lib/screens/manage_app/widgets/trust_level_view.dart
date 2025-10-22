import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';
import 'package:peridot/widgets/trust_level_options_view.dart';

class TrustLevelView extends StatelessWidget {
  const TrustLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderAreaView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Trust level",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          GetBuilder<ManageAppController>(
            builder: (c) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    TrustLevelOptionsView(
                      appMode: c.app!.authorisationMode,
                      optionMode: AuthorisationMode.allwaysAsk,
                      onSelected: () => c.updateAuthorisationMode(
                        AuthorisationMode.allwaysAsk,
                      ),
                    ),
                    SizedBox(height: 8),
                    TrustLevelOptionsView(
                      appMode: ManageAppController.to.app!.authorisationMode,
                      optionMode: AuthorisationMode.allowCommonRequests,
                      onSelected: () => c.updateAuthorisationMode(
                        AuthorisationMode.allowCommonRequests,
                      ),
                    ),
                    SizedBox(height: 8),
                    TrustLevelOptionsView(
                      appMode: ManageAppController.to.app!.authorisationMode,
                      optionMode: AuthorisationMode.fullyTrust,
                      onSelected: () => c.updateAuthorisationMode(
                        AuthorisationMode.fullyTrust,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
