import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/screens/manage_app/widgets/blocked_requests_view.dart';
import 'package:peridot/screens/manage_app/widgets/connected_account_view.dart';
import 'package:peridot/screens/manage_app/widgets/delete_button_view.dart';
import 'package:peridot/screens/manage_app/widgets/enabled_view.dart';
import 'package:peridot/screens/manage_app/widgets/pending_requests_view.dart';
import 'package:peridot/screens/manage_app/widgets/permissions_view.dart';
import 'package:peridot/screens/manage_app/widgets/trust_level_view.dart';

class ManageAppPage extends StatelessWidget {
  const ManageAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageAppController());

    return GetBuilder<ManageAppController>(
      builder: (c) {
        final app = c.app;
        final l10n = AppLocalizations.of(context)!;
        if (app == null) {
          return Center(child: Text(l10n.appNotFound));
        }
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: controller.renameController,
              focusNode: controller.renameFocusNode,
              style: Theme.of(context).textTheme.titleLarge,
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              onSubmitted: (_) => controller.saveRename(),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              EnabledView(),
              SizedBox(height: 16),
              ConnectedAccountView(),
              SizedBox(height: 16),
              TrustLevelView(),
              SizedBox(height: 16),
              PermissionsView(),
              SizedBox(height: 16),
              PendingRequestsView(),
              SizedBox(height: 16),
              BlockedRequestsView(),
              // SizedBox(height: 16),
              // ProcessedRequestsView(),
              SizedBox(height: 16),
              DeleteButtonView(),
              SizedBox(height: kToolbarHeight),
            ],
          ),
        );
      },
    );
  }
}
