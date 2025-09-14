import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';

class ChooseAccountView extends StatelessWidget {
  const ChooseAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...Repository.ndk.accounts.accounts.keys.map((pubkey) {
          return Obx(() {
            Widget? trailing;
            void Function()? onTap;

            final isSelected =
                AddApplicationController.to.selectedPubkey.value == pubkey;
            if (isSelected) {
              trailing = Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              );
            } else {
              onTap = () {
                AddApplicationController.to.selectedPubkey.value = pubkey;
              };
            }

            return ListTile(
              leading: NPicture(ndk: Repository.ndk, pubkey: pubkey),
              title: NName(ndk: Repository.ndk, pubkey: pubkey),
              trailing: trailing,
              onTap: onTap,
            );
          });
        }),
        SizedBox(height: 16),
        TextButton(
          onPressed: AddApplicationController.to.chooseAccountStepDone,
          child: Text(AppLocalizations.of(context)!.continueButton),
        ),
      ],
    );
  }
}
