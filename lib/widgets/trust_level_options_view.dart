import 'package:flutter/material.dart';
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
          title: Text("Allways ask permission"),
          subtitle: Text(
            "For each request from the app, you will chose what to do",
          ),
        ),
        AuthorisationMode.allowCommonRequests: ListTile(
          title: Text("Allow common actions"),
          subtitle: Text(
            "Common requests are automatically processed, you will chose what to do with the others",
          ),
        ),
        AuthorisationMode.fullyTrust: ListTile(
          title: Text("Fully trust"),
          subtitle: Text("Every requests are automatically processed"),
        ),
      }[optionMode],
    );

    if (isSelected) return child;

    return GestureDetector(onTap: onSelected, child: child);
  }
}
