import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';

class SwitchAccountDialog extends StatelessWidget {
  const SwitchAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 16),
      title: Text("Select the account to use"),
      content: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...Repository.to.usersPubkeys.map((pubkey) {
              final isSelected =
                  ManageAppController.to.selectedPubkey.value == pubkey;
              return ListTile(
                leading: NPicture(ndk: Repository.ndk, pubkey: pubkey),
                title: NName(ndk: Repository.ndk, pubkey: pubkey),
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
        TextButton(onPressed: Get.back, child: Text("Cancel")),
        FilledButton(
          onPressed: ManageAppController.to.switchAccount,
          child: Text("Use"),
        ),
      ],
    );
  }
}
