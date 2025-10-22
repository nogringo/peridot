import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/manage_app/manage_app_controller.dart';

class DeleteButtonView extends StatelessWidget {
  const DeleteButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: TextButton.icon(
        onPressed: ManageAppController.to.deleteApp,
        label: Text(l10n.delete),
        icon: Icon(Icons.delete_outline),
      ),
    );
  }
}
