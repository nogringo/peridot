import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';

String translatePermission(BuildContext context, String permission) {
  final l10n = AppLocalizations.of(context)!;

  // Convert snake_case to match our translation keys
  final permissionKey = 'permission_$permission';

  switch (permissionKey) {
    case 'permission_connect':
      return l10n.permission_connect;
    case 'permission_get_public_key':
      return l10n.permission_get_public_key;
    case 'permission_sign_event':
      return l10n.permission_sign_event;
    case 'permission_ping':
      return l10n.permission_ping;
    case 'permission_get_relays':
      return l10n.permission_get_relays;
    case 'permission_nip04_encrypt':
      return l10n.permission_nip04_encrypt;
    case 'permission_nip04_decrypt':
      return l10n.permission_nip04_decrypt;
    case 'permission_nip44_encrypt':
      return l10n.permission_nip44_encrypt;
    case 'permission_nip44_decrypt':
      return l10n.permission_nip44_decrypt;
    default:
      // Return the original permission if no translation found
      // This handles custom permissions or new ones not yet translated
      return permission
          .replaceAll('_', ' ')
          .split(' ')
          .map((word) {
            if (word.isEmpty) return word;
            return word[0].toUpperCase() + word.substring(1).toLowerCase();
          })
          .join(' ');
  }
}
