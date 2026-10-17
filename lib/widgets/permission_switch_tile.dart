import 'package:flutter/material.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/utils/translate_permission.dart';

class PermissionSwitchTile extends StatelessWidget {
  final Permission permission;
  final VoidCallback onToggle;

  const PermissionSwitchTile({
    super.key,
    required this.permission,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final description = describePermission(context, permission.command);
    return SwitchListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(translatePermission(context, permission.command)),
      subtitle: description == null ? null : Text(description),
      value: permission.isAllowed,
      onChanged: (_) => onToggle(),
    );
  }
}
