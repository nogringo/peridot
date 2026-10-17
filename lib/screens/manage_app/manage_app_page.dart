import 'package:flutter/material.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/screens/manage_app/widgets/blocked_requests_view.dart';
import 'package:peridot/screens/manage_app/widgets/connected_account_view.dart';
import 'package:peridot/screens/manage_app/widgets/enabled_app_view.dart';
import 'package:peridot/screens/manage_app/widgets/pending_requests_view.dart';
import 'package:peridot/screens/manage_app/widgets/permissions_view.dart';
import 'package:peridot/screens/manage_app/widgets/processed_requests_view.dart';
import 'package:peridot/screens/manage_app/widgets/trust_level_view.dart';
import 'package:peridot/widgets/responsive_list_view.dart';

class ManageAppPage extends StatefulWidget {
  final String appPubkey;

  const ManageAppPage({super.key, required this.appPubkey});

  @override
  State<ManageAppPage> createState() => _ManageAppPageState();
}

class _ManageAppPageState extends State<ManageAppPage> {
  late final ManageAppController controller;
  late final Listenable listenable;

  @override
  void initState() {
    super.initState();
    controller = ManageAppController(widget.appPubkey);
    listenable = Listenable.merge([controller, Repository.to]);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: listenable,
      builder: (context, _) {
        final app = controller.app;
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
            actions: [
              TextButton.icon(
                onPressed: () => controller.deleteApp(context),
                label: Text(l10n.delete),
                icon: Icon(Icons.delete_outline),
              ),
              SizedBox(width: 12),
            ],
          ),
          body: ResponsiveListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              EnabledAppView(controller: controller),
              SizedBox(height: 16),
              ConnectedAccountView(controller: controller),
              SizedBox(height: 16),
              TrustLevelView(controller: controller),
              SizedBox(height: 16),
              PermissionsView(controller: controller),
              PendingRequestsView(controller: controller),
              BlockedRequestsView(controller: controller),
              ProcessedRequestsView(controller: controller),
              SizedBox(height: kToolbarHeight),
            ],
          ),
        );
      },
    );
  }
}
