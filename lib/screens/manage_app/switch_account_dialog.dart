import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';

class SwitchAccountDialog extends StatelessWidget {
  const SwitchAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 16),
      title: Text(l10n.selectAccountToUse),
      content: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...Repository.to.usersPubkeys.map((pubkey) {
              final isSelected =
                  ManageAppController.to.selectedPubkey.value == pubkey;
              return ListTile(
                leading: NPicture(ndkFlutter: Repository.ndkFlutter, pubkey: pubkey),
                title: NName(ndkFlutter: Repository.ndkFlutter, pubkey: pubkey),
                trailing: isSelected
                    ? Icon(
                        Icons.radio_button_checked,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
                onTap: () => ManageAppController.to.selectAccount(pubkey),
              );
            }),
          ],
        );
      }),
      actions: [
        TextButton(onPressed: Get.back, child: Text(l10n.cancel)),
        FilledButton(
          onPressed: ManageAppController.to.switchAccount,
          child: Text(l10n.use),
        ),
      ],
    );
  }
}
