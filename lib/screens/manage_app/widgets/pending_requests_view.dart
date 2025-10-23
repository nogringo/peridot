import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';
import 'package:sembast/sembast.dart';

class PendingRequestsView extends StatelessWidget {
  const PendingRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final requestsStore = stringMapStoreFactory.store('requests');

    final finder = Finder(
      filter: Filter.custom((record) {
        final req = BunkerRequest.fromJson(
          record.value as Map<String, dynamic>,
        );

        if (req.status != BunkerRequestStatus.pending) return false;

        // TODO for security, also check the bunker pubkey
        final appPubkey = req.originalRequest.appPubkey;

        final currentApp = ManageAppController.to.app;
        if (currentApp == null) return false;

        return appPubkey == currentApp.appPubkey;
      }),
    );

    final pendingRequestsStream = requestsStore
        .query(finder: finder)
        .onSnapshots(Repository.to.db);

    return BorderAreaView(
      padding: EdgeInsets.zero,
      child: StreamBuilder(
        stream: pendingRequestsStream,
        builder: (context, snapshot) {
          List<BunkerRequest> requests = [];

          if (snapshot.hasData) {
            requests.addAll(
              snapshot.data!.values.map((e) => BunkerRequest.fromJson(e)),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "${requests.length} Pending requests",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ...requests.map((req) {
                return ListTile(
                  title: Text(req.originalRequest.commandString),
                  subtitle: Text(
                    DateFormat.yMMMMd(Get.locale).add_Hms().format(req.date),
                  ),
                  // trailing: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.more_vert), // TODO add popup
                  // ),
                  onTap: () =>
                      ManageAppController.to.openReqScreen(req.originalRequest),
                );
              }),
              if (requests.isNotEmpty) SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
