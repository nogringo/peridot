import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/utils/translate_permission.dart';
import 'package:peridot/widgets/status_chip.dart';

class LogsView extends StatelessWidget {
  const LogsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GetBuilder<Repository>(
      builder: (_) {
        return GetBuilder<HomeController>(
          builder: (c) {
            if (c.allRequests.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history,
                      size: 64,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    SizedBox(height: 16),
                    Text(
                      l10n.noLogs,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () =>
                            _showDeleteConfirmation(context, c, l10n),
                        icon: Icon(Icons.delete_outline),
                        label: Text(l10n.deleteAll),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Expanded(
                  child: ListView.builder(
                    itemCount: c.allRequests.length,
                    itemBuilder: (context, index) {
                      final req = c.allRequests[index];
                      final app = Repository.bunker.getApp(req.originalRequest);
                      if (app == null) return SizedBox.shrink();

                      return ListTile(
                        leading: NPicture(
                          ndk: Repository.ndk,
                          pubkey: app.userPubkey,
                        ),
                        title: Text(app.name ?? l10n.unnamedApp),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              translatePermission(
                                context,
                                req.originalRequest.commandString,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMMd(
                                Get.locale,
                              ).add_Hms().format(req.date),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        trailing: StatusChip(status: req.status),
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.request.replaceAll(
                              ':requestId',
                              req.originalRequest.id,
                            ),
                          );
                        },
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

  void _showDeleteConfirmation(
    BuildContext context,
    HomeController c,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteAllLogs),
        content: Text(l10n.deleteAllLogsConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              c.deleteAllLogs();
            },
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
  }
}
