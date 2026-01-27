import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nip19/nip19.dart';
import 'package:nostr_widgets/widgets/n_picture.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/widgets/no_apps_view.dart';

class ApplicationsView extends StatelessWidget {
  const ApplicationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GetBuilder<Repository>(
      builder: (_) {
        if (Repository.bunker.apps.isEmpty) return NoAppsView();

        return GetBuilder<HomeController>(
          builder: (c) {
            return Column(
              children: [
                _buildHeader(context, c, l10n),
                Divider(height: 1),
                Expanded(
                  child: c.appsWithRequests.isEmpty
                      ? NoAppsView()
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: kToolbarHeight + 12),
                          itemCount: c.appsWithRequests.length,
                          itemBuilder: (context, index) {
                            final app = c.appsWithRequests[index];

                            return ListTile(
                              leading: NPicture(
                                ndk: Repository.ndk,
                                pubkey: app.app.userPubkey,
                              ),
                              title: Text(
                                app.app.name ?? l10n.unnamedApp,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              trailing:
                                  app.pending.isEmpty && app.blocked.isEmpty
                                  ? null
                                  : Wrap(
                                      spacing: 8,
                                      children: [
                                        if (app.pending.isNotEmpty)
                                          Chip(
                                            shape: StadiumBorder(),
                                            avatar: Icon(Icons.access_time),
                                            label: Text(
                                              app.pending.length.toString(),
                                            ),
                                          ),
                                        if (app.blocked.isNotEmpty)
                                          Chip(
                                            shape: StadiumBorder(),
                                            avatar: Icon(Icons.cancel),
                                            label: Text(
                                              app.blocked.length.toString(),
                                            ),
                                          ),
                                      ],
                                    ),
                              onTap: () => Get.toNamed(
                                AppRoutes.manageApp.replaceAll(
                                  ':appPubkey',
                                  app.app.appPubkey,
                                ),
                                arguments: app,
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildHeader(
    BuildContext context,
    HomeController c,
    AppLocalizations l10n,
  ) {
    final accounts = Repository.to.usersPubkeys.toList();
    final hasMultipleAccounts = accounts.length > 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Obx(
        () => Row(
          children: [
            _buildSortButton(
              context: context,
              label: l10n.sortByName,
              option: AppSortOption.name,
              currentOption: c.sortOption.value,
              currentOrder: c.sortOrder.value,
              onTap: () => c.toggleSort(AppSortOption.name),
            ),
            SizedBox(width: 8),
            _buildSortButton(
              context: context,
              label: l10n.sortByLastUsed,
              option: AppSortOption.lastUsed,
              currentOption: c.sortOption.value,
              currentOrder: c.sortOrder.value,
              onTap: () => c.toggleSort(AppSortOption.lastUsed),
            ),
            Spacer(),
            if (hasMultipleAccounts) _buildAccountFilter(context, c, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildSortButton({
    required BuildContext context,
    required String label,
    required AppSortOption option,
    required AppSortOption currentOption,
    required AppSortOrder currentOrder,
    required VoidCallback onTap,
  }) {
    final isSelected = option == currentOption;
    final theme = Theme.of(context);

    return TextButton.icon(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurface,
      ),
      icon: isSelected
          ? Icon(
              currentOrder == AppSortOrder.ascending
                  ? Icons.arrow_upward
                  : Icons.arrow_downward,
              size: 18,
            )
          : SizedBox(width: 18),
      label: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildAccountFilter(
    BuildContext context,
    HomeController c,
    AppLocalizations l10n,
  ) {
    final accounts = Repository.to.usersPubkeys.toList();

    return MenuAnchor(
      style: MenuStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      builder: (context, controller, child) {
        return TextButton.icon(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: Icon(Icons.filter_list, size: 20),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                c.filterByAccount.value == null
                    ? l10n.allAccounts
                    : _shortenPubkey(c.filterByAccount.value!),
              ),
              Icon(Icons.arrow_drop_down, size: 20),
            ],
          ),
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () => c.setFilterByAccount(null),
          leadingIcon: c.filterByAccount.value == null
              ? Icon(Icons.check, size: 20)
              : SizedBox(width: 20),
          child: Text(l10n.allAccounts),
        ),
        Divider(),
        ...accounts.map(
          (pubkey) => MenuItemButton(
            onPressed: () => c.setFilterByAccount(pubkey),
            leadingIcon: c.filterByAccount.value == pubkey
                ? Icon(Icons.check, size: 20)
                : SizedBox(width: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NPicture(
                  ndk: Repository.ndk,
                  pubkey: pubkey,
                  circleAvatarRadius: 12,
                ),
                SizedBox(width: 8),
                Text('${Nip19.npubFromHex(pubkey).substring(0, 16)}...'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _shortenPubkey(String pubkey) {
    final npub = Nip19.npubFromHex(pubkey);
    return '${npub.substring(0, 12)}...';
  }
}
