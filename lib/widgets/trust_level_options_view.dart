import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:nostr_bunker/nostr_bunker.dart';

class TrustLevelOptionsView extends StatelessWidget {
  final AuthorisationMode appMode;
  final AuthorisationMode optionMode;
  final void Function()? onSelected;

  bool get isSelected => appMode == optionMode;

  const TrustLevelOptionsView({
    super.key,
    required this.appMode,
    required this.optionMode,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final borderRadius = BorderRadius.circular(16);
    final (title, subtitle) = switch (optionMode) {
      AuthorisationMode.allwaysAsk => (
        l10n.alwaysAskPermission,
        l10n.alwaysAskPermissionDescription,
      ),
      AuthorisationMode.allowCommonRequests => (
        l10n.allowCommonActions,
        l10n.allowCommonActionsDescription,
      ),
      AuthorisationMode.fullyTrust => (
        l10n.fullyTrust,
        l10n.fullyTrustDescription,
      ),
    };

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        borderRadius: borderRadius,
        color: isSelected ? colorScheme.primary.withValues(alpha: 0.1) : null,
      ),
      child: Semantics(
        inMutuallyExclusiveGroup: true,
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          selected: isSelected,
          onTap: isSelected ? null : onSelected,
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
