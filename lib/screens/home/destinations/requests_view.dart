import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/widgets/no_requests_view.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (c) {
        if (c.requests.isEmpty) return NoRequestsView();

        return ListView(
          children: [
            ...c.requests.map((req) {
              final app = Repository.bunker.getApp(req.originalRequest)!;
              return ListTile(
                leading: NPicture(ndk: Repository.ndk, pubkey: app.userPubkey),
                title: Text(
                  app.name ?? AppLocalizations.of(context)!.unnamedApp,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(req.originalRequest.commandString),
                    Text(
                      DateFormat.yMMMMd(Get.locale).add_Hms().format(req.date),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                trailing: Chip(
                  label: Text(
                    // TODO translate
                    req.status == BunkerRequestStatus.pending
                        ? "Pending"
                        : "Blocked",
                  ),
                  shape: StadiumBorder(),
                ),
                onTap: () {
                  Get.toNamed(
                    AppRoutes.request.replaceAll(
                      ':requestId',
                      req.originalRequest.id,
                    ),
                  );
                },
              );
            }),
          ],
        );
      },
    );
  }
}
