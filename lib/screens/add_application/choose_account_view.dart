import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
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
        ...Repository.to.usersPubkeys.map((pubkey) {
          return Obx(() {
            TextStyle? titleStyle;
            Widget? trailing;
            void Function()? onTap;

            final isSelected =
                AddApplicationController.to.selectedPubkey.value == pubkey;
            if (isSelected) {
              titleStyle = TextStyle(
                color: Theme.of(context).colorScheme.primary,
              );
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
              leading: NPicture(ndkFlutter: Repository.ndkFlutter, pubkey: pubkey),
              title: NName(
                ndkFlutter: Repository.ndkFlutter,
                pubkey: pubkey,
                style: titleStyle,
              ),
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
