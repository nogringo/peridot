import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/home_shell.dart';
import 'package:peridot/widgets/responsive_list_view.dart';
import 'package:peridot/utils/translate_permission.dart';
import 'package:peridot/widgets/status_chip.dart';

class LogsView extends StatelessWidget {
  final HomeController controller;

  const LogsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: Repository.to,
      builder: (context, _) {
        return ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            final c = controller;
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
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: homeTabMaxWidth),
                    child: Padding(
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
                  ),
                ),
                Divider(height: 1),
                Expanded(
                  child: ResponsiveListView.builder(
                    maxWidth: homeTabMaxWidth,
                    itemCount: c.allRequests.length,
                    itemBuilder: (context, index) {
                      final req = c.allRequests[index];
                      final app = Repository.bunker.getApp(req.originalRequest);
                      if (app == null) return SizedBox.shrink();

                      return ListTile(
                        leading: NPicture(
                          ndkFlutter: Repository.ndkFlutter,
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
                                l10n.localeName,
                              ).add_Hms().format(req.date),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        trailing: StatusChip(status: req.status),
                        onTap: () {
                          context.go(
                            AppRoutes.loggedRequest(req.originalRequest.id),
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
