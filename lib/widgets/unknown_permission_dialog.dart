import 'package:flutter/material.dart';
import 'package:peridot/models/authorized_app.dart';

class UnknownPermissionDialog extends StatelessWidget {
  final AuthorizedApp app;
  final String permission;

  const UnknownPermissionDialog({
    super.key,
    required this.app,
    required this.permission,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Permission Requested"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${app.name} is requesting permission:"),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(permission, style: TextStyle(fontFamily: 'monospace')),
          ),
          SizedBox(height: 16),
          Text("Would you like to authorize or block this request?"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text("Block"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text("Authorize"),
        ),
      ],
    );
  }
}
