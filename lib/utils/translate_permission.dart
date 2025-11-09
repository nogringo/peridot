import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/utils/nostr_kinds.dart'; // Import NostrKinds

String translatePermission(BuildContext context, String permission) {
  final l10n = AppLocalizations.of(context)!;

  String basePermission = permission;
  String? kindSuffix;
  int? kindNumber;

  // Check for and extract ':kind' suffix
  final colonIndex = permission.indexOf(':');
  if (colonIndex != -1) {
    basePermission = permission.substring(0, colonIndex);
    kindSuffix = permission.substring(colonIndex + 1); // e.g., "kind" or "1"
    try {
      kindNumber = int.parse(kindSuffix);
    } catch (e) {
      kindNumber = null; // Not a valid kind number
    }
  }

  final permissionKey = basePermission.startsWith('permission_')
      ? basePermission
      : 'permission_$basePermission';

  String translatedBase;
  switch (permissionKey) {
    case 'permission_connect':
      translatedBase = l10n.permission_connect;
      break;
    case 'permission_get_public_key':
      translatedBase = l10n.permission_get_public_key;
      break;
    case 'permission_sign_event':
      translatedBase = l10n.permission_sign_event;
      break;
    case 'permission_ping':
      translatedBase = l10n.permission_ping;
      break;
    case 'permission_get_relays':
      translatedBase = l10n.permission_get_relays;
      break;
    case 'permission_nip04_encrypt':
      translatedBase = l10n.permission_nip04_encrypt;
      break;
    case 'permission_nip04_decrypt':
      translatedBase = l10n.permission_nip04_decrypt;
      break;
    case 'permission_nip44_encrypt':
      translatedBase = l10n.permission_nip44_encrypt;
      break;
    case 'permission_nip44_decrypt':
      translatedBase = l10n.permission_nip44_decrypt;
      break;
    default:
      // If no specific translation found for basePermission,
      // format the original permission (including suffix if present)
      // to Title Case and return.
      return permission
          .replaceAll('_', ' ')
          .split(' ')
          .map((word) {
            if (word.isEmpty) return word;
            return word[0].toUpperCase() + word.substring(1).toLowerCase();
          })
          .join(' ');
  }

  // If a translation was found for the base permission, append the kind suffix
  if (kindNumber != null) {
    return '$translatedBase: ${NostrKinds.getDescription(context, kindNumber)}';
  } else if (kindSuffix != null) {
    return '$translatedBase ($kindSuffix)';
  } else {
    return translatedBase;
  }
}
