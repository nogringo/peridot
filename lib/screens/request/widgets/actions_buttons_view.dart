import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/request/request_controller.dart';

class ActionsButtonsView extends StatelessWidget {
  const ActionsButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final allowOnceButton = FilledButton(
      onPressed: RequestController.to.allowOnce,
      child: Text(
        RequestController.to.isRequestBlocked ? l10n.allow : l10n.allowOnce,
      ),
    );
    final rejectOnceButton = FilledButton(
      onPressed: RequestController.to.rejectOnce,
      child: Text(
        RequestController.to.isRequestBlocked ? l10n.reject : l10n.rejectOnce,
      ),
    );
    final allowForeverButton = FilledButton(
      onPressed: RequestController.to.allowForever,
      child: Text(l10n.allowForever),
    );
    final rejectForeverButton = FilledButton(
      onPressed: RequestController.to.rejectForever,
      child: Text(l10n.rejectForever),
    );
    final deleteButton = FilledButton(
      onPressed: RequestController.to.deleteRequest,
      child: Text(l10n.delete),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (RequestController.to.isRequestBlocked) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [allowOnceButton, deleteButton],
          );
        }

        final isWide = constraints.maxWidth > 600;

        if (isWide && RequestController.to.isRequestPending) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              allowOnceButton,
              rejectOnceButton,
              allowForeverButton,
              rejectForeverButton,
            ],
          );
        }

        if (isWide && RequestController.to.isRequestProcessed) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [allowForeverButton, rejectForeverButton, deleteButton],
          );
        }

        if (RequestController.to.isRequestPending) {
          return Column(
            spacing: 8,
            children: [
              Row(
                spacing: 8,
                children: [
                  Expanded(child: allowOnceButton),
                  Expanded(child: rejectOnceButton),
                ],
              ),
              Row(
                spacing: 8,
                children: [
                  Expanded(child: allowForeverButton),
                  Expanded(child: rejectForeverButton),
                ],
              ),
            ],
          );
        }

        if (RequestController.to.isRequestProcessed) {
          return Column(
            spacing: 8,
            children: [
              Row(
                spacing: 8,
                children: [
                  Expanded(child: allowForeverButton),
                  Expanded(child: rejectForeverButton),
                ],
              ),
              Row(children: [Expanded(child: deleteButton)]),
            ],
          );
        }

        return Container();
      },
    );
  }
}
