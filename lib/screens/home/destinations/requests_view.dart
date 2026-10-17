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
import 'package:peridot/screens/home/widgets/no_requests_view.dart';
import 'package:peridot/utils/translate_permission.dart';

class RequestsView extends StatelessWidget {
  final HomeController controller;

  const RequestsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Repository.to,
      builder: (context, _) {
        return ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            final c = controller;
            if (c.requests.isEmpty) return NoRequestsView();

            return ResponsiveListView(
              maxWidth: homeTabMaxWidth,
              children: [
                ...c.pendingRequests.map((req) {
                  final app = Repository.bunker.getApp(req.originalRequest)!;
                  return ListTile(
                    leading: NPicture(
                      ndkFlutter: Repository.ndkFlutter,
                      pubkey: app.userPubkey,
                    ),
                    title: Text(
                      app.name ?? AppLocalizations.of(context)!.unnamedApp,
                    ),
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
                            AppLocalizations.of(context)!.localeName,
                          ).add_Hms().format(req.date),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    trailing: Chip(
                      label: Text(AppLocalizations.of(context)!.pending),
                      shape: StadiumBorder(),
                    ),
                    onTap: () {
                      context.go(
                        AppRoutes.pendingRequest(req.originalRequest.id),
                      );
                    },
                  );
                }),
              ],
            );
          },
        );
      },
    );
  }
}
