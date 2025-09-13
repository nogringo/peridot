import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ja'),
    Locale('ru'),
    Locale('zh'),
  ];

  /// Title for the applications list screen
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get applications;

  /// Title for the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Message shown when no applications are connected
  ///
  /// In en, this message translates to:
  /// **'No applications connected'**
  String get noApplicationsConnected;

  /// Instruction to add a new application
  ///
  /// In en, this message translates to:
  /// **'Tap + to add an application'**
  String get tapPlusToAddApplication;

  /// Title for the manage application screen
  ///
  /// In en, this message translates to:
  /// **'Manage Application'**
  String get manageApplication;

  /// Label for the connected account section
  ///
  /// In en, this message translates to:
  /// **'Connected account'**
  String get connectedAccount;

  /// Label for the permissions section
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissions;

  /// Message shown when no permissions are set
  ///
  /// In en, this message translates to:
  /// **'No permissions set'**
  String get noPermissionsSet;

  /// Button text to remove an application
  ///
  /// In en, this message translates to:
  /// **'Remove {appName}'**
  String removeApp(String appName);

  /// Dialog title for deleting an application
  ///
  /// In en, this message translates to:
  /// **'Delete Application'**
  String get deleteApplication;

  /// Confirmation message for deleting an application
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \'{appName}\'? This action cannot be undone.'**
  String deleteApplicationConfirm(String appName);

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Delete button text
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Title for the add application screen
  ///
  /// In en, this message translates to:
  /// **'Add Application'**
  String get addApplication;

  /// Label for choosing an account
  ///
  /// In en, this message translates to:
  /// **'Choose account'**
  String get chooseAccount;

  /// Label for Nostr Connect section
  ///
  /// In en, this message translates to:
  /// **'Nostr Connect'**
  String get nostrConnect;

  /// Label for application name field
  ///
  /// In en, this message translates to:
  /// **'App name'**
  String get appName;

  /// Placeholder text for app name input field
  ///
  /// In en, this message translates to:
  /// **'Enter app name'**
  String get enterAppName;

  /// Button text to add the current application
  ///
  /// In en, this message translates to:
  /// **'Add this app'**
  String get addThisApp;

  /// Label for requested permissions section
  ///
  /// In en, this message translates to:
  /// **'Requested permissions'**
  String get requestedPermissions;

  /// Message shown when no specific permissions are requested
  ///
  /// In en, this message translates to:
  /// **'No specific permissions requested'**
  String get noSpecificPermissionsRequested;

  /// Title for unknown permission dialog
  ///
  /// In en, this message translates to:
  /// **'Unknown Permission'**
  String get unknownPermission;

  /// Message for unknown permission request
  ///
  /// In en, this message translates to:
  /// **'The app \'{appName}\' is requesting permission for \'{permission}\'. Do you want to allow this?'**
  String unknownPermissionMessage(String appName, String permission);

  /// Allow button text
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// Deny button text
  ///
  /// In en, this message translates to:
  /// **'Deny'**
  String get deny;

  /// Toast message when content is copied to clipboard
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// Toast message when application is deleted
  ///
  /// In en, this message translates to:
  /// **'Application deleted'**
  String get applicationDeleted;

  /// Toast message when permission is updated
  ///
  /// In en, this message translates to:
  /// **'Permission updated'**
  String get permissionUpdated;

  /// Toast message when permission is removed
  ///
  /// In en, this message translates to:
  /// **'Permission removed'**
  String get permissionRemoved;

  /// Toast message when permission is added
  ///
  /// In en, this message translates to:
  /// **'Permission added'**
  String get permissionAdded;

  /// Pluralized permission count
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{no permissions} =1{1 permission} other{{count} permissions}}'**
  String permissionCount(int count);

  /// Title for logged accounts section
  ///
  /// In en, this message translates to:
  /// **'Logged accounts'**
  String get loggedAccounts;

  /// Label for default bunker relays section
  ///
  /// In en, this message translates to:
  /// **'Default bunker relays'**
  String get defaultBunkerRelays;

  /// Button text to add a relay
  ///
  /// In en, this message translates to:
  /// **'Add relay'**
  String get addRelay;

  /// Placeholder text for relay URL input
  ///
  /// In en, this message translates to:
  /// **'Enter relay URL'**
  String get enterRelayUrl;

  /// Title for add private key dialog
  ///
  /// In en, this message translates to:
  /// **'Add Private Key'**
  String get addPrivateKey;

  /// Placeholder text for private key input
  ///
  /// In en, this message translates to:
  /// **'Enter your private key (nsec or hex)'**
  String get enterPrivateKey;

  /// Error message for invalid private key
  ///
  /// In en, this message translates to:
  /// **'Invalid private key'**
  String get invalidPrivateKey;

  /// Success message when account is added
  ///
  /// In en, this message translates to:
  /// **'Account added successfully'**
  String get accountAddedSuccessfully;

  /// Menu option to backup account
  ///
  /// In en, this message translates to:
  /// **'Backup Account'**
  String get backupAccount;

  /// Button text to show private key
  ///
  /// In en, this message translates to:
  /// **'Show Private Key'**
  String get showPrivateKey;

  /// Button text to hide private key
  ///
  /// In en, this message translates to:
  /// **'Hide Private Key'**
  String get hidePrivateKey;

  /// Button text to copy private key
  ///
  /// In en, this message translates to:
  /// **'Copy Private Key'**
  String get copyPrivateKey;

  /// Toast message when private key is copied
  ///
  /// In en, this message translates to:
  /// **'Private key copied to clipboard'**
  String get privateKeyCopied;

  /// Error message when app is not found
  ///
  /// In en, this message translates to:
  /// **'App not found'**
  String get appNotFound;

  /// Status label for allowed permission
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get allowed;

  /// Status label for blocked permission
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get blocked;

  /// Permission name for connect action
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get permission_connect;

  /// Permission name for getting public key
  ///
  /// In en, this message translates to:
  /// **'Get Public Key'**
  String get permission_get_public_key;

  /// Permission name for signing events
  ///
  /// In en, this message translates to:
  /// **'Sign Event'**
  String get permission_sign_event;

  /// Permission name for ping action
  ///
  /// In en, this message translates to:
  /// **'Ping'**
  String get permission_ping;

  /// Permission name for getting relays
  ///
  /// In en, this message translates to:
  /// **'Get Relays'**
  String get permission_get_relays;

  /// Permission name for NIP-04 encryption
  ///
  /// In en, this message translates to:
  /// **'Encrypt (NIP-04)'**
  String get permission_nip04_encrypt;

  /// Permission name for NIP-04 decryption
  ///
  /// In en, this message translates to:
  /// **'Decrypt (NIP-04)'**
  String get permission_nip04_decrypt;

  /// Permission name for NIP-44 encryption
  ///
  /// In en, this message translates to:
  /// **'Encrypt (NIP-44)'**
  String get permission_nip44_encrypt;

  /// Permission name for NIP-44 decryption
  ///
  /// In en, this message translates to:
  /// **'Decrypt (NIP-44)'**
  String get permission_nip44_decrypt;

  /// Dialog title for permission request
  ///
  /// In en, this message translates to:
  /// **'Permission Requested'**
  String get permissionRequested;

  /// Message showing which app is requesting permission
  ///
  /// In en, this message translates to:
  /// **'{appName} is requesting permission:'**
  String appRequestingPermission(String appName);

  /// Question asking whether to authorize or block request
  ///
  /// In en, this message translates to:
  /// **'Would you like to authorize or block this request?'**
  String get authorizeOrBlockRequest;

  /// Block button text
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// Authorize button text
  ///
  /// In en, this message translates to:
  /// **'Authorize'**
  String get authorize;

  /// Dialog title and menu option for removing an account
  ///
  /// In en, this message translates to:
  /// **'Remove Account'**
  String get removeAccount;

  /// Confirmation message for removing an account
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this account? This action cannot be undone.'**
  String get removeAccountConfirm;

  /// Remove button text
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Menu option to copy the npub (public key)
  ///
  /// In en, this message translates to:
  /// **'Copy npub'**
  String get copyNpub;

  /// Button text to add a new account
  ///
  /// In en, this message translates to:
  /// **'Add an account'**
  String get addAnAccount;

  /// Dialog title for removing a relay
  ///
  /// In en, this message translates to:
  /// **'Remove Relay'**
  String get removeRelay;

  /// Confirmation message for removing a relay
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this relay?\n{relay}'**
  String removeRelayConfirm(String relay);

  /// Toast message when relay is removed
  ///
  /// In en, this message translates to:
  /// **'Relay removed'**
  String get relayRemoved;

  /// Dialog title when trying to remove the last relay
  ///
  /// In en, this message translates to:
  /// **'Cannot Remove Last Relay'**
  String get cannotRemoveLastRelay;

  /// Message explaining why the last relay cannot be removed
  ///
  /// In en, this message translates to:
  /// **'You must have at least one relay. Please add another relay before removing this one.'**
  String get cannotRemoveLastRelayMessage;

  /// OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'en',
    'es',
    'fr',
    'ja',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ja':
      return AppLocalizationsJa();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
