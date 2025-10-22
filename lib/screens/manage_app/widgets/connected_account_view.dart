import 'package:flutter/material.dart';
import 'package:nip19/nip19.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class ConnectedAccountView extends StatelessWidget {
  const ConnectedAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BorderAreaView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.connectedAccount,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: NPicture(
              ndk: Repository.ndk,
              pubkey: ManageAppController.to.app!.userPubkey,
            ),
            title: NName(
              ndk: Repository.ndk,
              pubkey: ManageAppController.to.app!.userPubkey,
            ),
            subtitle: Text(
              Nip19.npubFromHex(ManageAppController.to.app!.appPubkey),
            ),
            trailing: IconButton(
              onPressed: ManageAppController.to.openSwitchAccountDialog,
              icon: Icon(Icons.swap_horiz),
            ),
          ),
        ],
      ),
    );
  }
}
