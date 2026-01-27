import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/models/bunker_request.dart';

class StatusChip extends StatelessWidget {
  final BunkerRequestStatus status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final (label, color, icon) = switch (status) {
      BunkerRequestStatus.pending => (
        l10n.pending,
        Theme.of(context).colorScheme.tertiary,
        Icons.access_time,
      ),
      BunkerRequestStatus.blocked => (
        l10n.blocked,
        Theme.of(context).colorScheme.error,
        Icons.block,
      ),
      BunkerRequestStatus.processed => (
        l10n.processed,
        Theme.of(context).colorScheme.primary,
        Icons.check_circle,
      ),
    };

    return Chip(
      avatar: Icon(icon, size: 16, color: color),
      label: Text(label, style: TextStyle(color: color)),
      shape: StadiumBorder(side: BorderSide(color: color)),
      backgroundColor: color.withValues(alpha: 0.1),
    );
  }
}
