import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/request/request_controller.dart';

class ActionsButtonsView extends StatelessWidget {
  final RequestController controller;

  const ActionsButtonsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final allowOnceButton = FilledButton(
      onPressed: () => controller.allowOnce(context),
      child: Text(controller.isRequestBlocked ? l10n.allow : l10n.allowOnce),
    );
    final rejectOnceButton = FilledButton(
      onPressed: () => controller.rejectOnce(context),
      child: Text(controller.isRequestBlocked ? l10n.reject : l10n.rejectOnce),
    );
    final allowForeverButton = FilledButton(
      onPressed: () => controller.allowForever(context),
      child: Text(l10n.allowForever),
    );
    final rejectForeverButton = FilledButton(
      onPressed: () => controller.rejectForever(context),
      child: Text(l10n.rejectForever),
    );
    final deleteButton = FilledButton(
      onPressed: () => controller.deleteRequest(context),
      child: Text(l10n.delete),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (controller.isRequestBlocked) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [allowOnceButton, deleteButton],
          );
        }

        final isWide = constraints.maxWidth > 600;

        if (isWide && controller.isRequestPending) {
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

        if (isWide && controller.isRequestProcessed) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [allowForeverButton, rejectForeverButton, deleteButton],
          );
        }

        if (controller.isRequestPending) {
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

        if (controller.isRequestProcessed) {
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
