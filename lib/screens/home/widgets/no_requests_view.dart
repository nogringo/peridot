import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';

class NoRequestsView extends StatelessWidget {
  const NoRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(77),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.noRequests,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(153),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.whenYouReceiveRequests,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
