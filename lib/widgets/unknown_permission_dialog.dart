import 'package:flutter/material.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/utils/translate_permission.dart';

class UnknownPermissionDialog extends StatelessWidget {
  final App app;
  final String permission;

  const UnknownPermissionDialog({
    super.key,
    required this.app,
    required this.permission,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final translatedPermission = translatePermission(context, permission);

    return AlertDialog(
      title: Text(l10n.permissionRequested),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.appRequestingPermission(app.name ?? "Unamed App")),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              translatedPermission,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 16),
          Text(l10n.authorizeOrBlockRequest),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.reject),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.authorize),
        ),
      ],
    );
  }
}
