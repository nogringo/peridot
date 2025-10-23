import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:get/get.dart';
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
    final child = Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? Get.theme.colorScheme.primary
              : Get.theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(16),
        color: isSelected
            ? Get.theme.colorScheme.primary.withValues(alpha: 0.1)
            : null,
      ),
      child: {
        AuthorisationMode.allwaysAsk: ListTile(
          title: Text(l10n.alwaysAskPermission),
          subtitle: Text(l10n.alwaysAskPermissionDescription),
        ),
        AuthorisationMode.allowCommonRequests: ListTile(
          title: Text(l10n.allowCommonActions),
          subtitle: Text(l10n.allowCommonActionsDescription),
        ),
        AuthorisationMode.fullyTrust: ListTile(
          title: Text(l10n.fullyTrust),
          subtitle: Text(l10n.fullyTrustDescription),
        ),
      }[optionMode],
    );

    if (isSelected) return child;

    return GestureDetector(onTap: onSelected, child: child);
  }
}
