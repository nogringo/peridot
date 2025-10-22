import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/screens/request/widgets/actions_buttons_view.dart';
import 'package:peridot/screens/request/request_controller.dart';
import 'package:peridot/screens/request/widgets/json_viewer.dart';
import 'package:peridot/screens/request/widgets/warning_banner_view.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RequestController(),
      builder: (c) {
        if (c.request == null) return Scaffold();

        return Scaffold(
          appBar: AppBar(title: Text(c.app?.name ?? "Deleted app")),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              if (!c.request!.originalRequest.useNip44)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: WarningBannerView(
                    title: "This request use a deprecated encryption",
                    subtitle: "Please, contact and inform the app developper",
                  ),
                ),
              if (c.request!.originalRequest.bunkerPubkey == c.app!.userPubkey)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: WarningBannerView(
                    title: "This request leak metadata",
                    subtitle:
                        "People can know that you use a bunker and when you use it. Please, contact and inform the app developper",
                  ),
                ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  DateFormat.yMMMMd(
                    Get.locale,
                  ).add_Hms().format(c.request!.date),
                  style: TextStyle(color: Theme.of(context).disabledColor),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Command: ${c.request!.originalRequest.commandString}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              Text("Params", style: Theme.of(context).textTheme.titleLarge),
              if (c.request!.originalRequest.command != Nip46Commands.signEvent)
                ...c.request!.originalRequest.params.map(
                  (param) => SelectableText(param),
                ),
              if (c.request!.originalRequest.command == Nip46Commands.signEvent)
                JsonViewer(json: c.request!.originalRequest.params.first),
              SizedBox(height: 32),
              ActionsButtonsView(),
              SizedBox(height: kToolbarHeight),
            ],
          ),
        );
      },
    );
  }
}
