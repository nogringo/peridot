import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nostr_widgets/widgets/widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/screens/request/widgets/actions_buttons_view.dart';
import 'package:peridot/screens/request/request_controller.dart';
import 'package:peridot/screens/request/widgets/json_viewer.dart';
import 'package:peridot/screens/request/widgets/warning_banner_view.dart';
import 'package:peridot/utils/nostr_kinds.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GetBuilder(
      init: RequestController(),
      builder: (c) {
        if (c.request == null) return Scaffold();

        return Scaffold(
          appBar: AppBar(
            title: Text(c.app?.name ?? l10n.deletedApp),
            actions: [
              NPicture(ndk: Repository.ndk, pubkey: c.app!.userPubkey),
              SizedBox(width: 12),
            ],
          ),
          body: Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 12),
                children: [
                  if (!c.request!.originalRequest.useNip44)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: WarningBannerView(
                        title: l10n.deprecatedEncryptionWarning,
                        subtitle: l10n.deprecatedEncryptionWarningMessage,
                      ),
                    ),
                  if (c.request!.originalRequest.bunkerPubkey ==
                      c.app!.userPubkey)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: WarningBannerView(
                        title: l10n.metadataLeakWarning,
                        subtitle: l10n.metadataLeakWarningMessage,
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
                  if (c.request!.originalRequest.command ==
                      Nip46Commands.signEvent)
                    Builder(
                      builder: (context) {
                        try {
                          final eventJson = jsonDecode(
                            c.request!.originalRequest.params.first,
                          );
                          final kind = eventJson['kind'] as int?;
                          if (kind != null) {
                            final kindDescription = NostrKinds.getDescription(
                              context,
                              kind,
                            );
                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                "Kind: $kindDescription",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                            );
                          }
                        } catch (e) {
                          // If parsing fails, don't show anything
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  SizedBox(height: 8),
                  Text(
                    l10n.params,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (c.request!.originalRequest.command !=
                      Nip46Commands.signEvent)
                    ...c.request!.originalRequest.params.map(
                      (param) => SelectableText(param),
                    ),
                  if (c.request!.originalRequest.command ==
                      Nip46Commands.signEvent)
                    JsonViewer(json: c.request!.originalRequest.params.first),
                  SizedBox(height: kToolbarHeight * 2),
                ],
              ),
              Positioned(
                right: 12,
                left: 12,
                bottom: 12,
                child: ActionsButtonsView(),
              ),
            ],
          ),
        );
      },
    );
  }
}
