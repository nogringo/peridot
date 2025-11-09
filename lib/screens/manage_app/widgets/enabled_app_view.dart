import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class EnabledAppView extends StatelessWidget {
  const EnabledAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BorderAreaView(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          SwitchListTile(
            title: Text(l10n.enableThisApp),
            subtitle: Text(l10n.enableThisAppDescription),
            value: ManageAppController.to.app!.isEnabled,
            onChanged: ManageAppController.to.appEnableChange,
          ),
          SwitchListTile(
            title: Text(l10n.removeClientTag),
            subtitle: Text(l10n.removeClientTagDescription),
            value: ManageAppController.to.app!.removeClientTag,
            onChanged: ManageAppController.to.removeClientTagChange,
          ),
        ],
      ),
    );
  }
}
