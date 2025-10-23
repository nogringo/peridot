import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/request/request_controller.dart';

class ActionsButtonsView extends StatelessWidget {
  const ActionsButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final allowOnceButton = OutlinedButton(
      onPressed: RequestController.to.allowOnce,
      child: Text(
        RequestController.to.isRequestBlocked ? l10n.allow : l10n.allowOnce,
      ),
    );
    final rejectOnceButton = OutlinedButton(
      onPressed: RequestController.to.rejectOnce,
      child: Text(
        RequestController.to.isRequestBlocked ? l10n.reject : l10n.rejectOnce,
      ),
    );
    final allowForeverButton = OutlinedButton(
      onPressed: RequestController.to.allowForever,
      child: Text(l10n.allowForever),
    );
    final rejectForeverButton = OutlinedButton(
      onPressed: RequestController.to.rejectForever,
      child: Text(l10n.rejectForever),
    );
    final deleteButton = OutlinedButton(
      onPressed: RequestController.to.deleteRequest,
      child: Text(l10n.delete),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;

        if (isWide) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              allowOnceButton,
              if (!RequestController.to.isRequestBlocked) rejectOnceButton,
              if (RequestController.to.isRequestBlocked) deleteButton,
              if (!RequestController.to.isRequestBlocked) allowForeverButton,
              if (!RequestController.to.isRequestBlocked) rejectForeverButton,
            ],
          );
        }

        return Column(
          spacing: 8,
          children: [
            Row(
              spacing: 8,
              children: [
                Expanded(child: allowOnceButton),
                if (!RequestController.to.isRequestBlocked)
                  Expanded(child: rejectOnceButton),
                if (RequestController.to.isRequestBlocked)
                  Expanded(child: deleteButton),
              ],
            ),
            if (!RequestController.to.isRequestBlocked)
              Row(
                spacing: 8,
                children: [
                  Expanded(child: allowForeverButton),
                  Expanded(child: rejectForeverButton),
                ],
              ),
          ],
        );
      },
    );
  }
}
