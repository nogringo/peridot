import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';

class SwitchAccountDialog extends StatelessWidget {
  final ManageAppController controller;

  const SwitchAccountDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 16),
      title: Text(l10n.selectAccountToUse),
      content: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...Repository.to.usersPubkeys.map((pubkey) {
                final isSelected = controller.selectedPubkey == pubkey;
                return Semantics(
                  inMutuallyExclusiveGroup: true,
                  child: ListTile(
                    selected: isSelected,
                    leading: NPicture(
                      ndkFlutter: Repository.ndkFlutter,
                      pubkey: pubkey,
                    ),
                    title: NName(
                      ndkFlutter: Repository.ndkFlutter,
                      pubkey: pubkey,
                    ),
                    trailing: isSelected
                        ? Icon(
                            Icons.radio_button_checked,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : null,
                    onTap: () => controller.selectAccount(pubkey),
                  ),
                );
              }),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () => controller.switchAccount(context),
          child: Text(l10n.use),
        ),
      ],
    );
  }
}
