import 'package:flutter/material.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class EnabledView extends StatelessWidget {
  const EnabledView({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderAreaView(
      padding: EdgeInsets.zero,
      child: SwitchListTile(
        title: Text("Enable this app"),
        subtitle: Text("When disabled, every requests are blocked"),
        value: ManageAppController.to.app!.isEnabled,
        onChanged: ManageAppController.to.appEnableChange,
      ),
    );
  }
}
