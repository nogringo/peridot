// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get applications => 'Applications';

  @override
  String get settings => 'Settings';

  @override
  String get noApplicationsConnected => 'No applications connected';

  @override
  String get tapPlusToAddApplication => 'Tap + to add an application';

  @override
  String get manageApplication => 'Manage Application';

  @override
  String get connectedAccount => 'Connected account';

  @override
  String get permissions => 'Permissions';

  @override
  String get noPermissionsSet => 'No permissions set';

  @override
  String removeApp(String appName) {
    return 'Remove $appName';
  }

  @override
  String get deleteApplication => 'Delete Application';

  @override
  String deleteApplicationConfirm(String appName) {
    return 'Are you sure you want to delete \'$appName\'? This action cannot be undone.';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get addApplication => 'Add Application';

  @override
  String get chooseAccount => 'Choose account';

  @override
  String get nostrConnect => 'Nostr Connect';

  @override
  String get appName => 'App name';

  @override
  String get enterAppName => 'Enter app name';

  @override
  String get addThisApp => 'Add this app';

  @override
  String get requestedPermissions => 'Requested permissions';

  @override
  String get noSpecificPermissionsRequested =>
      'No specific permissions requested';

  @override
  String get unknownPermission => 'Unknown Permission';

  @override
  String unknownPermissionMessage(String appName, String permission) {
    return 'The app \'$appName\' is requesting permission for \'$permission\'. Do you want to allow this?';
  }

  @override
  String get allow => 'Allow';

  @override
  String get deny => 'Deny';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get applicationDeleted => 'Application deleted';

  @override
  String get permissionUpdated => 'Permission updated';

  @override
  String get permissionRemoved => 'Permission removed';

  @override
  String get permissionAdded => 'Permission added';

  @override
  String permissionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count permissions',
      one: '1 permission',
      zero: 'no permissions',
    );
    return '$_temp0';
  }

  @override
  String get loggedAccounts => 'Logged accounts';

  @override
  String get defaultBunkerRelays => 'Default bunker relays';

  @override
  String get addRelay => 'Add relay';

  @override
  String get enterRelayUrl => 'Enter relay URL';

  @override
  String get addPrivateKey => 'Add Private Key';

  @override
  String get enterPrivateKey => 'Enter your private key (nsec or hex)';

  @override
  String get invalidPrivateKey => 'Invalid private key';

  @override
  String get accountAddedSuccessfully => 'Account added successfully';

  @override
  String get backupAccount => 'Backup Account';

  @override
  String get showPrivateKey => 'Show Private Key';

  @override
  String get hidePrivateKey => 'Hide Private Key';

  @override
  String get copyPrivateKey => 'Copy Private Key';

  @override
  String get privateKeyCopied => 'Private key copied to clipboard';

  @override
  String get appNotFound => 'App not found';

  @override
  String get allowed => 'Allowed';

  @override
  String get blocked => 'Blocked';
}
