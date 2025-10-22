import 'package:flutter/material.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/models/bunker_request.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';
import 'package:sembast/sembast.dart';

class ProcessedRequestsView extends StatelessWidget {
  const ProcessedRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final requestsStore = stringMapStoreFactory.store('requests');

    final finder = Finder(
      filter: Filter.custom((record) {
        final req = BunkerRequest.fromJson(
          record.value as Map<String, dynamic>,
        );

        if (req.status != BunkerRequestStatus.processed) return false;

        final bunkerPubkey = req.originalRequest.bunkerPubkey;
        final appPubkey = req.originalRequest.appPubkey;

        final currentApp = ManageAppController.to.app;
        if (currentApp == null) return false;

        return bunkerPubkey == currentApp.bunkerPubkey &&
            appPubkey == currentApp.appPubkey;
      }),
    );

    final processedRequestsStream = requestsStore
        .query(finder: finder)
        .onSnapshots(Repository.to.db);

    return BorderAreaView(
      padding: EdgeInsets.zero,
      child: StreamBuilder(
        stream: processedRequestsStream,
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
                  "${requests.length} Processed requests",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ...requests.map((req) => ListTile(title: Text("data"))),
              if (requests.isNotEmpty) SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
