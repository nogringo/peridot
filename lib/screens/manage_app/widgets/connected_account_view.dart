import 'package:flutter/material.dart';
import 'package:ndk/shared/nips/nip19/nip19.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class ConnectedAccountView extends StatelessWidget {
  final ManageAppController controller;

  const ConnectedAccountView({super.key, required this.controller});

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
              ndkFlutter: Repository.ndkFlutter,
              pubkey: controller.app!.userPubkey,
            ),
            title: NName(
              ndkFlutter: Repository.ndkFlutter,
              pubkey: controller.app!.userPubkey,
            ),
            subtitle: Text(Nip19.encodePubKey(controller.app!.appPubkey)),
            trailing: IconButton(
              tooltip: l10n.switchAccount,
              onPressed: () => controller.openSwitchAccountDialog(context),
              icon: Icon(Icons.swap_horiz),
            ),
          ),
        ],
      ),
    );
  }
}
