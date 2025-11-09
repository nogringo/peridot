import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';
import 'package:sembast/sembast.dart';
import 'package:peridot/utils/translate_permission.dart';

class BlockedRequestsView extends StatelessWidget {
  const BlockedRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final requestsStore = stringMapStoreFactory.store('requests');

    final finder = Finder(
      sortOrders: [SortOrder('date', false)],
      filter: Filter.custom((record) {
        final req = BunkerRequest.fromJson(
          record.value as Map<String, dynamic>,
        );

        if (req.status != BunkerRequestStatus.blocked) return false;

        final appPubkey = req.originalRequest.appPubkey;

        final currentApp = ManageAppController.to.app;
        if (currentApp == null) return false;

        return appPubkey == currentApp.appPubkey;
      }),
    );

    final blockedRequestsStream = requestsStore
        .query(finder: finder)
        .onSnapshots(Repository.to.db);

    return StreamBuilder(
      stream: blockedRequestsStream,
      builder: (context, snapshot) {
        List<BunkerRequest> requests = [];

        if (snapshot.hasData) {
          requests.addAll(
            snapshot.data!.values.map((e) => BunkerRequest.fromJson(e)),
          );
        }

        if (requests.isEmpty) return Container();

        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BorderAreaView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.blockedRequestsCount(requests.length),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      if (requests.isNotEmpty)
                        TextButton.icon(
                          onPressed: () async {
                            await ManageAppController.to.deleteAllRequests(
                              requests,
                            );
                          },
                          icon: Icon(Icons.delete_sweep),
                          label: Text(l10n.deleteAll),
                        ),
                    ],
                  ),
                ),
                ...requests.map((req) {
                  return ListTile(
                    title: Text(
                      translatePermission(
                        context,
                        req.originalRequest.commandString,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd(Get.locale).add_Hms().format(req.date),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        await ManageAppController.to.deleteRequest(
                          req.originalRequest.id,
                        );
                      },
                      icon: Icon(Icons.delete_outlined),
                    ),
                    onTap: () => ManageAppController.to.openReqScreen(
                      req.originalRequest,
                    ),
                  );
                }),
                if (requests.isNotEmpty) SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
