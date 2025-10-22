import 'package:flutter/material.dart';
import 'package:peridot/screens/request/request_controller.dart';

class ActionsButtonsView extends StatelessWidget {
  const ActionsButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final allowOnceButton = OutlinedButton(
      onPressed: RequestController.to.allowOnce,
      child: Text(
        RequestController.to.isRequestBlocked ? "Allow" : "Allow once",
      ),
    );
    final rejectOnceButton = OutlinedButton(
      onPressed: RequestController.to.rejectOnce,
      child: Text(
        RequestController.to.isRequestBlocked ? "Reject" : "Reject once",
      ),
    );
    final allowForeverButton = OutlinedButton(
      onPressed: RequestController.to.allowForever,
      child: Text("Allow forever"),
    );
    final rejectForeverButton = OutlinedButton(
      onPressed: RequestController.to.rejectForever,
      child: Text("Reject forever"),
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
              rejectOnceButton,
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
                Expanded(child: rejectOnceButton),
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
