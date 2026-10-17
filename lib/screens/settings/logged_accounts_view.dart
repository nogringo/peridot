import 'package:flutter/material.dart';
import 'package:ndk/shared/nips/nip19/nip19.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/settings/controllers/settings_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class LoggedAccountsView extends StatelessWidget {
  const LoggedAccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BorderAreaView(
      padding: EdgeInsets.all(16),
      child: ListenableBuilder(
        listenable: Repository.to,
        builder: (context, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.loggedAccounts,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              ...Repository.to.usersPubkeys.map((pubkey) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: NPicture(
                    ndkFlutter: Repository.ndkFlutter,
                    pubkey: pubkey,
                  ),
                  title: NName(
                    ndkFlutter: Repository.ndkFlutter,
                    pubkey: pubkey,
                  ),
                  subtitle: Text(
                    Nip19.encodePubKey(pubkey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 1,
                      ),
                    ),
                    onSelected: (value) => SettingsController.to
                        .handleAccountMenuAction(context, value, pubkey),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'copy',
                        child: Row(
                          children: [
                            Icon(Icons.copy, size: 20),
                            SizedBox(width: 8),
                            Text(l10n.copyNpub),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'backup',
                        child: Row(
                          children: [
                            Icon(Icons.vertical_align_bottom, size: 20),
                            SizedBox(width: 8),
                            Text(l10n.backupAccount),
                          ],
                        ),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        value: 'remove',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 20,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            SizedBox(width: 8),
                            Text(
                              l10n.removeAccount,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.addPrivkey);
                },
                child: Text(l10n.addAnAccount),
              ),
            ],
          );
        },
      ),
    );
  }
}
