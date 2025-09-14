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

  @override
  String get permission_connect => 'Connect';

  @override
  String get permission_get_public_key => 'Get Public Key';

  @override
  String get permission_sign_event => 'Sign Event';

  @override
  String get permission_ping => 'Ping';

  @override
  String get permission_get_relays => 'Get Relays';

  @override
  String get permission_nip04_encrypt => 'Encrypt (NIP-04)';

  @override
  String get permission_nip04_decrypt => 'Decrypt (NIP-04)';

  @override
  String get permission_nip44_encrypt => 'Encrypt (NIP-44)';

  @override
  String get permission_nip44_decrypt => 'Decrypt (NIP-44)';

  @override
  String get permissionRequested => 'Permission Requested';

  @override
  String appRequestingPermission(String appName) {
    return '$appName is requesting permission:';
  }

  @override
  String get authorizeOrBlockRequest =>
      'Would you like to authorize or block this request?';

  @override
  String get block => 'Block';

  @override
  String get authorize => 'Authorize';

  @override
  String get removeAccount => 'Remove Account';

  @override
  String get removeAccountConfirm =>
      'Are you sure you want to remove this account? This action cannot be undone.';

  @override
  String get remove => 'Remove';

  @override
  String get copyNpub => 'Copy npub';

  @override
  String get addAnAccount => 'Add an account';

  @override
  String get removeRelay => 'Remove Relay';

  @override
  String removeRelayConfirm(String relay) {
    return 'Are you sure you want to remove this relay?\n$relay';
  }

  @override
  String get relayRemoved => 'Relay removed';

  @override
  String get cannotRemoveLastRelay => 'Cannot Remove Last Relay';

  @override
  String get cannotRemoveLastRelayMessage =>
      'You must have at least one relay. Please add another relay before removing this one.';

  @override
  String get ok => 'OK';

  @override
  String get systemSettings => 'System Settings';

  @override
  String get startOnSystemStartup => 'Start on system startup';

  @override
  String get startOnSystemStartupDescription =>
      'Launch Peridot automatically when your computer starts';

  @override
  String get desktopNotifications => 'Desktop notifications';

  @override
  String get desktopNotificationsDescription =>
      'Show desktop notifications for permission requests';

  @override
  String get useTor => 'Use Tor';

  @override
  String get useTorDescription =>
      'Route connections through Tor network for enhanced privacy';

  @override
  String get useTorComingSoon =>
      'Route connections through Tor network for enhanced privacy (Coming soon)';

  @override
  String get continueButton => 'Continue';

  @override
  String get bunkerUrlCopiedSuccessfully => 'Bunker URL copied successfully';

  @override
  String get addAnApp => 'Add an app';

  @override
  String get chooseTheAccount => 'Choose the account';

  @override
  String get connectAnApp => 'Connect an app';

  @override
  String get addThisAppQuestion => 'Add this app?';

  @override
  String get connect => 'Connect';

  @override
  String get connectWithBunkerUrl => 'Connect with Bunker URL';

  @override
  String get copyBunkerUrl => 'Copy Bunker URL';

  @override
  String get nostrConnectUrlHint => 'nostrconnect://';

  @override
  String get publicKeyCopiedSuccessfully => 'Public key copied successfully';

  @override
  String get pleaseEnterPassword => 'Please enter a password';

  @override
  String get encryptedBackupCopied => 'Encrypted backup copied';

  @override
  String get backupFailed => 'Backup failed';

  @override
  String get privateKeyCopiedToClipboard => 'Private key copied';

  @override
  String get copyFailed => 'Copy failed';

  @override
  String get backupThisAccount => 'Backup this account';

  @override
  String get noAccountSelected => 'No account selected';

  @override
  String get recommended => 'Recommended';

  @override
  String get notRecommended => 'Not recommended';

  @override
  String get password => 'Password';

  @override
  String get copyEncryptedVersion => 'Copy encrypted version';

  @override
  String get copyUnencryptedVersion => 'Copy unencrypted version';

  @override
  String get yourPassword => 'Your password';
}
