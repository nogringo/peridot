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

  /// No description provided for @applications.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get applications;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @noApplicationsConnected.
  ///
  /// In en, this message translates to:
  /// **'No applications connected'**
  String get noApplicationsConnected;

  /// No description provided for @tapPlusToAddApplication.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add an application'**
  String get tapPlusToAddApplication;

  /// No description provided for @manageApplication.
  ///
  /// In en, this message translates to:
  /// **'Manage Application'**
  String get manageApplication;

  /// No description provided for @connectedAccount.
  ///
  /// In en, this message translates to:
  /// **'Connected account'**
  String get connectedAccount;

  /// No description provided for @permissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissions;

  /// No description provided for @noPermissionsSet.
  ///
  /// In en, this message translates to:
  /// **'No permissions set'**
  String get noPermissionsSet;

  /// No description provided for @removeApp.
  ///
  /// In en, this message translates to:
  /// **'Remove {appName}'**
  String removeApp(String appName);

  /// No description provided for @deleteApplication.
  ///
  /// In en, this message translates to:
  /// **'Delete Application'**
  String get deleteApplication;

  /// No description provided for @deleteApplicationConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \'{appName}\'? This action cannot be undone.'**
  String deleteApplicationConfirm(String appName);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @addApplication.
  ///
  /// In en, this message translates to:
  /// **'Add Application'**
  String get addApplication;

  /// No description provided for @chooseAccount.
  ///
  /// In en, this message translates to:
  /// **'Choose account'**
  String get chooseAccount;

  /// No description provided for @nostrConnect.
  ///
  /// In en, this message translates to:
  /// **'Nostr Connect'**
  String get nostrConnect;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'App name'**
  String get appName;

  /// No description provided for @enterAppName.
  ///
  /// In en, this message translates to:
  /// **'Enter app name'**
  String get enterAppName;

  /// No description provided for @addThisApp.
  ///
  /// In en, this message translates to:
  /// **'Add this app'**
  String get addThisApp;

  /// No description provided for @requestedPermissions.
  ///
  /// In en, this message translates to:
  /// **'Requested permissions'**
  String get requestedPermissions;

  /// No description provided for @noSpecificPermissionsRequested.
  ///
  /// In en, this message translates to:
  /// **'No specific permissions requested'**
  String get noSpecificPermissionsRequested;

  /// No description provided for @unknownPermission.
  ///
  /// In en, this message translates to:
  /// **'Unknown Permission'**
  String get unknownPermission;

  /// No description provided for @unknownPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'The app \'{appName}\' is requesting permission for \'{permission}\'. Do you want to allow this?'**
  String unknownPermissionMessage(String appName, String permission);

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @deny.
  ///
  /// In en, this message translates to:
  /// **'Deny'**
  String get deny;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @applicationDeleted.
  ///
  /// In en, this message translates to:
  /// **'Application deleted'**
  String get applicationDeleted;

  /// No description provided for @permissionUpdated.
  ///
  /// In en, this message translates to:
  /// **'Permission updated'**
  String get permissionUpdated;

  /// No description provided for @permissionRemoved.
  ///
  /// In en, this message translates to:
  /// **'Permission removed'**
  String get permissionRemoved;

  /// No description provided for @permissionAdded.
  ///
  /// In en, this message translates to:
  /// **'Permission added'**
  String get permissionAdded;

  /// No description provided for @permissionCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{no permissions} =1{1 permission} other{{count} permissions}}'**
  String permissionCount(int count);

  /// No description provided for @loggedAccounts.
  ///
  /// In en, this message translates to:
  /// **'Logged accounts'**
  String get loggedAccounts;

  /// No description provided for @defaultBunkerRelays.
  ///
  /// In en, this message translates to:
  /// **'Default bunker relays'**
  String get defaultBunkerRelays;

  /// No description provided for @addRelay.
  ///
  /// In en, this message translates to:
  /// **'Add relay'**
  String get addRelay;

  /// No description provided for @enterRelayUrl.
  ///
  /// In en, this message translates to:
  /// **'Enter relay URL'**
  String get enterRelayUrl;

  /// No description provided for @addPrivateKey.
  ///
  /// In en, this message translates to:
  /// **'Add Private Key'**
  String get addPrivateKey;

  /// No description provided for @enterPrivateKey.
  ///
  /// In en, this message translates to:
  /// **'Enter your private key (nsec or hex)'**
  String get enterPrivateKey;

  /// No description provided for @invalidPrivateKey.
  ///
  /// In en, this message translates to:
  /// **'Invalid private key'**
  String get invalidPrivateKey;

  /// No description provided for @accountAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account added successfully'**
  String get accountAddedSuccessfully;

  /// No description provided for @backupAccount.
  ///
  /// In en, this message translates to:
  /// **'Backup Account'**
  String get backupAccount;

  /// No description provided for @showPrivateKey.
  ///
  /// In en, this message translates to:
  /// **'Show Private Key'**
  String get showPrivateKey;

  /// No description provided for @hidePrivateKey.
  ///
  /// In en, this message translates to:
  /// **'Hide Private Key'**
  String get hidePrivateKey;

  /// No description provided for @copyPrivateKey.
  ///
  /// In en, this message translates to:
  /// **'Copy Private Key'**
  String get copyPrivateKey;

  /// No description provided for @privateKeyCopied.
  ///
  /// In en, this message translates to:
  /// **'Private key copied to clipboard'**
  String get privateKeyCopied;

  /// No description provided for @appNotFound.
  ///
  /// In en, this message translates to:
  /// **'App not found'**
  String get appNotFound;

  /// No description provided for @allowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get allowed;

  /// No description provided for @blocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get blocked;

  /// No description provided for @permission_connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get permission_connect;

  /// No description provided for @permission_get_public_key.
  ///
  /// In en, this message translates to:
  /// **'Get Public Key'**
  String get permission_get_public_key;

  /// No description provided for @permission_sign_event.
  ///
  /// In en, this message translates to:
  /// **'Sign Event'**
  String get permission_sign_event;

  /// No description provided for @permission_ping.
  ///
  /// In en, this message translates to:
  /// **'Ping'**
  String get permission_ping;

  /// No description provided for @permission_get_relays.
  ///
  /// In en, this message translates to:
  /// **'Get Relays'**
  String get permission_get_relays;

  /// No description provided for @permission_nip04_encrypt.
  ///
  /// In en, this message translates to:
  /// **'Encrypt (NIP-04)'**
  String get permission_nip04_encrypt;

  /// No description provided for @permission_nip04_decrypt.
  ///
  /// In en, this message translates to:
  /// **'Decrypt (NIP-04)'**
  String get permission_nip04_decrypt;

  /// No description provided for @permission_nip44_encrypt.
  ///
  /// In en, this message translates to:
  /// **'Encrypt (NIP-44)'**
  String get permission_nip44_encrypt;

  /// No description provided for @permission_nip44_decrypt.
  ///
  /// In en, this message translates to:
  /// **'Decrypt (NIP-44)'**
  String get permission_nip44_decrypt;
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
