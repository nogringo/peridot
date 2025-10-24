import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
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
    Locale('de'),
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
  /// **'The app \'{appName}\' is requesting permission for \'{permission}\' on behalf of user \'{userName}\'. Do you want to allow this?'**
  String unknownPermissionMessage(
    String appName,
    String permission,
    String userName,
  );

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

  /// Short toast message when content is copied
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copied;

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

  /// Error message when private key is invalid
  ///
  /// In en, this message translates to:
  /// **'Sorry, it looks like that private key is invalid.'**
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

  /// Reject button text
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

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

  /// Title for system settings section
  ///
  /// In en, this message translates to:
  /// **'System Settings'**
  String get systemSettings;

  /// Setting to enable auto-start on system boot
  ///
  /// In en, this message translates to:
  /// **'Start on system startup'**
  String get startOnSystemStartup;

  /// Description for auto-start setting
  ///
  /// In en, this message translates to:
  /// **'Launch Peridot automatically when your computer starts'**
  String get startOnSystemStartupDescription;

  /// Setting to enable desktop notifications
  ///
  /// In en, this message translates to:
  /// **'Desktop notifications'**
  String get desktopNotifications;

  /// Description for desktop notifications setting
  ///
  /// In en, this message translates to:
  /// **'Show desktop notifications for permission requests'**
  String get desktopNotificationsDescription;

  /// Setting to enable notifications (mobile)
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Description for notifications setting (mobile)
  ///
  /// In en, this message translates to:
  /// **'Show notifications for permission requests'**
  String get notificationsDescription;

  /// Setting to enable Tor routing
  ///
  /// In en, this message translates to:
  /// **'Use Tor'**
  String get useTor;

  /// Description for Tor setting
  ///
  /// In en, this message translates to:
  /// **'Route connections through Tor network for enhanced privacy'**
  String get useTorDescription;

  /// Description for Tor setting when it's not yet available
  ///
  /// In en, this message translates to:
  /// **'Route connections through Tor network for enhanced privacy (Coming soon)'**
  String get useTorComingSoon;

  /// Setting to remove client tag from signing requests for this app
  ///
  /// In en, this message translates to:
  /// **'Remove client tag'**
  String get removeClientTag;

  /// Description for remove client tag setting for this app
  ///
  /// In en, this message translates to:
  /// **'Automatically remove the client tag from events before signing for this app'**
  String get removeClientTagDescription;

  /// Continue button text
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Message when Bunker URL is copied
  ///
  /// In en, this message translates to:
  /// **'Bunker URL copied successfully'**
  String get bunkerUrlCopiedSuccessfully;

  /// Title for add an app page
  ///
  /// In en, this message translates to:
  /// **'Add an app'**
  String get addAnApp;

  /// Label for choosing account
  ///
  /// In en, this message translates to:
  /// **'Choose the account'**
  String get chooseTheAccount;

  /// Title for connect an app section
  ///
  /// In en, this message translates to:
  /// **'Connect an app'**
  String get connectAnApp;

  /// Question asking to add the app
  ///
  /// In en, this message translates to:
  /// **'Add this app?'**
  String get addThisAppQuestion;

  /// Connect button text
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// Title for Bunker URL connection method
  ///
  /// In en, this message translates to:
  /// **'Connect with Bunker URL'**
  String get connectWithBunkerUrl;

  /// Button to copy Bunker URL
  ///
  /// In en, this message translates to:
  /// **'Copy Bunker URL'**
  String get copyBunkerUrl;

  /// Hint text for nostr connect URL input
  ///
  /// In en, this message translates to:
  /// **'nostrconnect://'**
  String get nostrConnectUrlHint;

  /// Message when public key is copied
  ///
  /// In en, this message translates to:
  /// **'Public key copied successfully'**
  String get publicKeyCopiedSuccessfully;

  /// Request to enter password
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get pleaseEnterPassword;

  /// Message when encrypted backup is copied
  ///
  /// In en, this message translates to:
  /// **'Encrypted backup copied'**
  String get encryptedBackupCopied;

  /// Error message when backup fails
  ///
  /// In en, this message translates to:
  /// **'Backup failed'**
  String get backupFailed;

  /// Message when private key is copied
  ///
  /// In en, this message translates to:
  /// **'Private key copied'**
  String get privateKeyCopiedToClipboard;

  /// Error message when copy fails
  ///
  /// In en, this message translates to:
  /// **'Copy failed'**
  String get copyFailed;

  /// Title for backup account page
  ///
  /// In en, this message translates to:
  /// **'Backup this account'**
  String get backupThisAccount;

  /// Message when no account is selected
  ///
  /// In en, this message translates to:
  /// **'No account selected'**
  String get noAccountSelected;

  /// Label for recommended option
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// Label for not recommended option
  ///
  /// In en, this message translates to:
  /// **'Not recommended'**
  String get notRecommended;

  /// Password label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Button to copy encrypted version
  ///
  /// In en, this message translates to:
  /// **'Copy encrypted version'**
  String get copyEncryptedVersion;

  /// Button to copy unencrypted version
  ///
  /// In en, this message translates to:
  /// **'Copy unencrypted version'**
  String get copyUnencryptedVersion;

  /// Placeholder for password input
  ///
  /// In en, this message translates to:
  /// **'Your password'**
  String get yourPassword;

  /// Section title for creating a new account
  ///
  /// In en, this message translates to:
  /// **'Create one'**
  String get createOne;

  /// Button text to create a new account
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// Divider text between two options
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// Section title for importing an account
  ///
  /// In en, this message translates to:
  /// **'Import one'**
  String get importOne;

  /// Label for private key import field
  ///
  /// In en, this message translates to:
  /// **'Nsec, ncryptsec or hex'**
  String get nsecNcryptsecOrHex;

  /// Label for ncryptsec password field
  ///
  /// In en, this message translates to:
  /// **'Ncryptsec password'**
  String get ncryptsecPassword;

  /// Button text to import a private key
  ///
  /// In en, this message translates to:
  /// **'Import Key'**
  String get importKey;

  /// Description for secure backup option
  ///
  /// In en, this message translates to:
  /// **'Backup this account securely with a password'**
  String get backupSecurelyWithPassword;

  /// Description for insecure backup option
  ///
  /// In en, this message translates to:
  /// **'Backup this account insecurely without a password'**
  String get backupInsecurelyWithoutPassword;

  /// Title for Nostr connect URL connection method
  ///
  /// In en, this message translates to:
  /// **'Connect with Nostr connect URL'**
  String get connectWithNostrConnectUrl;

  /// Error message when ncryptsec decryption fails
  ///
  /// In en, this message translates to:
  /// **'Sorry, we weren\'t able to decrypt your private key with that password.'**
  String get decryptionFailed;

  /// Nostr event kind 0
  ///
  /// In en, this message translates to:
  /// **'User Metadata'**
  String get userMetadata;

  /// Nostr event kind 1
  ///
  /// In en, this message translates to:
  /// **'Short Text Note'**
  String get shortTextNote;

  /// Nostr event kind 2
  ///
  /// In en, this message translates to:
  /// **'Recommend Relay'**
  String get recommendRelay;

  /// Nostr event kind 3
  ///
  /// In en, this message translates to:
  /// **'Follows'**
  String get follows;

  /// Nostr event kind 4
  ///
  /// In en, this message translates to:
  /// **'Encrypted Direct Messages'**
  String get encryptedDirectMessages;

  /// Nostr event kind 5
  ///
  /// In en, this message translates to:
  /// **'Event Deletion Request'**
  String get eventDeletionRequest;

  /// Nostr event kind 6
  ///
  /// In en, this message translates to:
  /// **'Repost'**
  String get repost;

  /// Nostr event kind 7
  ///
  /// In en, this message translates to:
  /// **'Reaction'**
  String get reaction;

  /// Nostr event kind 8
  ///
  /// In en, this message translates to:
  /// **'Badge Award'**
  String get badgeAward;

  /// Nostr event kind 9
  ///
  /// In en, this message translates to:
  /// **'Chat Message'**
  String get chatMessage;

  /// Nostr event kind 10
  ///
  /// In en, this message translates to:
  /// **'Group Chat Threaded Reply'**
  String get groupChatThreadedReply;

  /// Nostr event kind 11
  ///
  /// In en, this message translates to:
  /// **'Thread'**
  String get thread;

  /// Nostr event kind 12
  ///
  /// In en, this message translates to:
  /// **'Group Thread Reply'**
  String get groupThreadReply;

  /// Nostr event kind 13
  ///
  /// In en, this message translates to:
  /// **'Seal'**
  String get seal;

  /// Nostr event kind 14
  ///
  /// In en, this message translates to:
  /// **'Direct Message'**
  String get directMessage;

  /// Nostr event kind 15
  ///
  /// In en, this message translates to:
  /// **'File Message'**
  String get fileMessage;

  /// Nostr event kind 16
  ///
  /// In en, this message translates to:
  /// **'Generic Repost'**
  String get genericRepost;

  /// Nostr event kind 17
  ///
  /// In en, this message translates to:
  /// **'Reaction to a website'**
  String get reactionToWebsite;

  /// Nostr event kind 20
  ///
  /// In en, this message translates to:
  /// **'Picture'**
  String get picture;

  /// Nostr event kind 21
  ///
  /// In en, this message translates to:
  /// **'Video Event'**
  String get videoEvent;

  /// Nostr event kind 22
  ///
  /// In en, this message translates to:
  /// **'Short-form Portrait Video Event'**
  String get shortFormPortraitVideoEvent;

  /// Nostr event kind 30
  ///
  /// In en, this message translates to:
  /// **'Internal reference'**
  String get internalReference;

  /// Nostr event kind 31
  ///
  /// In en, this message translates to:
  /// **'External reference'**
  String get externalReference;

  /// Nostr event kind 32
  ///
  /// In en, this message translates to:
  /// **'Hardcopy reference'**
  String get hardcopyReference;

  /// Nostr event kind 33
  ///
  /// In en, this message translates to:
  /// **'Prompt reference'**
  String get promptReference;

  /// Nostr event kind 40
  ///
  /// In en, this message translates to:
  /// **'Channel Creation'**
  String get channelCreation;

  /// Nostr event kind 41
  ///
  /// In en, this message translates to:
  /// **'Channel Metadata'**
  String get channelMetadata;

  /// Nostr event kind 42
  ///
  /// In en, this message translates to:
  /// **'Channel Message'**
  String get channelMessage;

  /// Nostr event kind 43
  ///
  /// In en, this message translates to:
  /// **'Channel Hide Message'**
  String get channelHideMessage;

  /// Nostr event kind 44
  ///
  /// In en, this message translates to:
  /// **'Channel Mute User'**
  String get channelMuteUser;

  /// Nostr event kind 62
  ///
  /// In en, this message translates to:
  /// **'Request to Vanish'**
  String get requestToVanish;

  /// Nostr event kind 64
  ///
  /// In en, this message translates to:
  /// **'Chess (PGN)'**
  String get chessPgn;

  /// Nostr event kind 443
  ///
  /// In en, this message translates to:
  /// **'MLS KeyPackage'**
  String get mlsKeyPackage;

  /// Nostr event kind 444
  ///
  /// In en, this message translates to:
  /// **'MLS Welcome'**
  String get mlsWelcome;

  /// Nostr event kind 445
  ///
  /// In en, this message translates to:
  /// **'MLS Group Event'**
  String get mlsGroupEvent;

  /// Nostr event kind 818
  ///
  /// In en, this message translates to:
  /// **'Merge Requests'**
  String get mergeRequests;

  /// Nostr event kind 1018
  ///
  /// In en, this message translates to:
  /// **'Poll Response'**
  String get pollResponse;

  /// Nostr event kind 1021
  ///
  /// In en, this message translates to:
  /// **'Marketplace Bid'**
  String get marketplaceBid;

  /// Nostr event kind 1022
  ///
  /// In en, this message translates to:
  /// **'Marketplace Bid Confirmation'**
  String get marketplaceBidConfirmation;

  /// Nostr event kind 1040
  ///
  /// In en, this message translates to:
  /// **'OpenTimestamps'**
  String get openTimestamps;

  /// Nostr event kind 1059
  ///
  /// In en, this message translates to:
  /// **'Gift Wrap'**
  String get giftWrap;

  /// Nostr event kind 1063
  ///
  /// In en, this message translates to:
  /// **'File Metadata'**
  String get fileMetadata;

  /// Nostr event kind 1068
  ///
  /// In en, this message translates to:
  /// **'Poll'**
  String get poll;

  /// Nostr event kind 1111
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// Nostr event kind 1222
  ///
  /// In en, this message translates to:
  /// **'Voice Message'**
  String get voiceMessage;

  /// Nostr event kind 1244
  ///
  /// In en, this message translates to:
  /// **'Voice Message Comment'**
  String get voiceMessageComment;

  /// Nostr event kind 1311
  ///
  /// In en, this message translates to:
  /// **'Live Chat Message'**
  String get liveChatMessage;

  /// Nostr event kind 1337
  ///
  /// In en, this message translates to:
  /// **'Code Snippet'**
  String get codeSnippet;

  /// Nostr event kind 1617
  ///
  /// In en, this message translates to:
  /// **'Git Patch'**
  String get gitPatch;

  /// Nostr event kind 1618
  ///
  /// In en, this message translates to:
  /// **'Git Pull Request'**
  String get gitPullRequest;

  /// Nostr event kind 1619
  ///
  /// In en, this message translates to:
  /// **'Git Status Update'**
  String get gitStatusUpdate;

  /// Nostr event kind 1621
  ///
  /// In en, this message translates to:
  /// **'Git Issue'**
  String get gitIssue;

  /// Nostr event kind 1622
  ///
  /// In en, this message translates to:
  /// **'Git Issue Update'**
  String get gitIssueUpdate;

  /// Nostr event kind 1630
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Nostr event kind 1631
  ///
  /// In en, this message translates to:
  /// **'Status Update'**
  String get statusUpdate;

  /// Nostr event kind 1632
  ///
  /// In en, this message translates to:
  /// **'Status Delete'**
  String get statusDelete;

  /// Nostr event kind 1633
  ///
  /// In en, this message translates to:
  /// **'Status Reply'**
  String get statusReply;

  /// Nostr event kind 1971
  ///
  /// In en, this message translates to:
  /// **'Problem Tracker'**
  String get problemTracker;

  /// Nostr event kind 1984
  ///
  /// In en, this message translates to:
  /// **'Reporting'**
  String get reporting;

  /// Nostr event kind 1985
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get label;

  /// Nostr event kind 1986
  ///
  /// In en, this message translates to:
  /// **'Relay reviews'**
  String get relayReviews;

  /// Nostr event kind 1987
  ///
  /// In en, this message translates to:
  /// **'AI Embeddings / Vector lists'**
  String get aiEmbeddings;

  /// Nostr event kind 2003
  ///
  /// In en, this message translates to:
  /// **'Torrent'**
  String get torrent;

  /// Nostr event kind 2004
  ///
  /// In en, this message translates to:
  /// **'Torrent Comment'**
  String get torrentComment;

  /// Nostr event kind 2022
  ///
  /// In en, this message translates to:
  /// **'Coinjoin Pool'**
  String get coinjoinPool;

  /// Nostr event kind 4550
  ///
  /// In en, this message translates to:
  /// **'Community Post Approval'**
  String get communityPostApproval;

  /// Nostr event kinds 5000-5999
  ///
  /// In en, this message translates to:
  /// **'Job Request'**
  String get jobRequest;

  /// Nostr event kinds 6000-6999
  ///
  /// In en, this message translates to:
  /// **'Job Result'**
  String get jobResult;

  /// Nostr event kind 7000
  ///
  /// In en, this message translates to:
  /// **'Job Feedback'**
  String get jobFeedback;

  /// Nostr event kind 7374
  ///
  /// In en, this message translates to:
  /// **'Cashu Wallet Token'**
  String get cashuWalletToken;

  /// Nostr event kind 7375
  ///
  /// In en, this message translates to:
  /// **'Cashu Wallet Proofs'**
  String get cashuWalletProofs;

  /// Nostr event kind 7376
  ///
  /// In en, this message translates to:
  /// **'Cashu Wallet History'**
  String get cashuWalletHistory;

  /// Nostr event kind 7516
  ///
  /// In en, this message translates to:
  /// **'Geocache Create'**
  String get geocacheCreate;

  /// Nostr event kind 7517
  ///
  /// In en, this message translates to:
  /// **'Geocache Update'**
  String get geocacheUpdate;

  /// Nostr event kinds 9000-9030
  ///
  /// In en, this message translates to:
  /// **'Group Control Event'**
  String get groupControlEvent;

  /// Nostr event kind 9041
  ///
  /// In en, this message translates to:
  /// **'Zap Goal'**
  String get zapGoal;

  /// Nostr event kind 9321
  ///
  /// In en, this message translates to:
  /// **'Nutzap'**
  String get nutzap;

  /// Nostr event kind 9467
  ///
  /// In en, this message translates to:
  /// **'Tidal login'**
  String get tidalLogin;

  /// Nostr event kind 9734
  ///
  /// In en, this message translates to:
  /// **'Zap Request'**
  String get zapRequest;

  /// Nostr event kind 9735
  ///
  /// In en, this message translates to:
  /// **'Zap'**
  String get zap;

  /// Nostr event kind 9802
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get highlights;

  /// Nostr event kind 10000
  ///
  /// In en, this message translates to:
  /// **'Mute List'**
  String get muteList;

  /// Nostr event kind 10001
  ///
  /// In en, this message translates to:
  /// **'Pin List'**
  String get pinList;

  /// Nostr event kind 10002
  ///
  /// In en, this message translates to:
  /// **'Relay List Metadata'**
  String get relayListMetadata;

  /// Nostr event kind 10003
  ///
  /// In en, this message translates to:
  /// **'Bookmark List'**
  String get bookmarkList;

  /// Nostr event kind 10004
  ///
  /// In en, this message translates to:
  /// **'Communities List'**
  String get communitiesList;

  /// Nostr event kind 10005
  ///
  /// In en, this message translates to:
  /// **'Public Chats List'**
  String get publicChatsList;

  /// Nostr event kind 10006
  ///
  /// In en, this message translates to:
  /// **'Blocked Relays List'**
  String get blockedRelaysList;

  /// Nostr event kind 10007
  ///
  /// In en, this message translates to:
  /// **'Search Relays List'**
  String get searchRelaysList;

  /// Nostr event kind 10009
  ///
  /// In en, this message translates to:
  /// **'User Groups'**
  String get userGroups;

  /// Nostr event kind 10012
  ///
  /// In en, this message translates to:
  /// **'Favorites List'**
  String get favoritesList;

  /// Nostr event kind 10013
  ///
  /// In en, this message translates to:
  /// **'Private Events List'**
  String get privateEventsList;

  /// Nostr event kind 10015
  ///
  /// In en, this message translates to:
  /// **'Interests List'**
  String get interestsList;

  /// Nostr event kind 10019
  ///
  /// In en, this message translates to:
  /// **'Media Follows List'**
  String get mediaFollowsList;

  /// Nostr event kind 10020
  ///
  /// In en, this message translates to:
  /// **'People Follows List'**
  String get peopleFollowsList;

  /// Nostr event kind 10030
  ///
  /// In en, this message translates to:
  /// **'User Emoji List'**
  String get userEmojiList;

  /// Nostr event kind 10050
  ///
  /// In en, this message translates to:
  /// **'DM Relay List'**
  String get dmRelayList;

  /// Nostr event kind 10051
  ///
  /// In en, this message translates to:
  /// **'KeyPackage Relay List'**
  String get keyPackageRelayList;

  /// Nostr event kind 10063
  ///
  /// In en, this message translates to:
  /// **'User Server List'**
  String get userServerList;

  /// Nostr event kind 10096
  ///
  /// In en, this message translates to:
  /// **'File Storage Server List'**
  String get fileStorageServerList;

  /// Nostr event kind 10166
  ///
  /// In en, this message translates to:
  /// **'Relay Monitor Announcement'**
  String get relayMonitorAnnouncement;

  /// Nostr event kind 10312
  ///
  /// In en, this message translates to:
  /// **'Room Presence'**
  String get roomPresence;

  /// Nostr event kind 10377
  ///
  /// In en, this message translates to:
  /// **'Proxy Announcement'**
  String get proxyAnnouncement;

  /// Nostr event kind 11111
  ///
  /// In en, this message translates to:
  /// **'Transport Method Announcement'**
  String get transportMethodAnnouncement;

  /// Nostr event kind 13194
  ///
  /// In en, this message translates to:
  /// **'Wallet Info'**
  String get walletInfo;

  /// Nostr event kind 17375
  ///
  /// In en, this message translates to:
  /// **'Cashu Wallet Event'**
  String get cashuWalletEvent;

  /// Nostr event kind 21000
  ///
  /// In en, this message translates to:
  /// **'Lightning Pub RPC'**
  String get lightningPubRpc;

  /// Nostr event kind 22242
  ///
  /// In en, this message translates to:
  /// **'Client Authentication'**
  String get clientAuthentication;

  /// Nostr event kind 23194
  ///
  /// In en, this message translates to:
  /// **'Wallet Request'**
  String get walletRequest;

  /// Nostr event kind 23195
  ///
  /// In en, this message translates to:
  /// **'Wallet Response'**
  String get walletResponse;

  /// Nostr event kind 24133
  ///
  /// In en, this message translates to:
  /// **'Nostr Connect'**
  String get nostrConnectEvent;

  /// Nostr event kind 24242
  ///
  /// In en, this message translates to:
  /// **'Blobs stored on mediaservers'**
  String get blobsStoredOnMediaservers;

  /// Nostr event kind 27235
  ///
  /// In en, this message translates to:
  /// **'HTTP Auth'**
  String get httpAuth;

  /// Nostr event kind 30000
  ///
  /// In en, this message translates to:
  /// **'Categorized People List'**
  String get categorizedPeopleList;

  /// Nostr event kind 30001
  ///
  /// In en, this message translates to:
  /// **'Categorized Bookmark List'**
  String get categorizedBookmarkList;

  /// Nostr event kind 30002
  ///
  /// In en, this message translates to:
  /// **'Categorized Relay List'**
  String get categorizedRelayList;

  /// Nostr event kind 30003
  ///
  /// In en, this message translates to:
  /// **'Bookmark Sets'**
  String get bookmarkSets;

  /// Nostr event kind 30004
  ///
  /// In en, this message translates to:
  /// **'Curation Sets'**
  String get curationSets;

  /// Nostr event kind 30005
  ///
  /// In en, this message translates to:
  /// **'Video Sets'**
  String get videoSets;

  /// Nostr event kind 30007
  ///
  /// In en, this message translates to:
  /// **'Kind Mute Sets'**
  String get kindMuteSets;

  /// Nostr event kind 30008
  ///
  /// In en, this message translates to:
  /// **'Profile Badges'**
  String get profileBadges;

  /// Nostr event kind 30009
  ///
  /// In en, this message translates to:
  /// **'Badge Definition'**
  String get badgeDefinition;

  /// Nostr event kind 30015
  ///
  /// In en, this message translates to:
  /// **'Interest Sets'**
  String get interestSets;

  /// Nostr event kind 30017
  ///
  /// In en, this message translates to:
  /// **'Create or Update Stall'**
  String get createOrUpdateStall;

  /// Nostr event kind 30018
  ///
  /// In en, this message translates to:
  /// **'Create or Update Product'**
  String get createOrUpdateProduct;

  /// Nostr event kind 30019
  ///
  /// In en, this message translates to:
  /// **'Marketplace UI/UX'**
  String get marketplaceUiUx;

  /// Nostr event kind 30020
  ///
  /// In en, this message translates to:
  /// **'Product Sold as Auction'**
  String get productSoldAsAuction;

  /// Nostr event kind 30023
  ///
  /// In en, this message translates to:
  /// **'Long-form Content'**
  String get longFormContent;

  /// Nostr event kind 30024
  ///
  /// In en, this message translates to:
  /// **'Draft Long-form Content'**
  String get draftLongFormContent;

  /// Nostr event kind 30030
  ///
  /// In en, this message translates to:
  /// **'Emoji Sets'**
  String get emojiSets;

  /// Nostr event kind 30040
  ///
  /// In en, this message translates to:
  /// **'Curated Publication Item'**
  String get curatedPublicationItem;

  /// Nostr event kind 30041
  ///
  /// In en, this message translates to:
  /// **'Curated Publication Draft'**
  String get curatedPublicationDraft;

  /// Nostr event kind 30063
  ///
  /// In en, this message translates to:
  /// **'Release Artifact Sets'**
  String get releaseArtifactSets;

  /// Nostr event kind 30078
  ///
  /// In en, this message translates to:
  /// **'Application-specific Data'**
  String get applicationSpecificData;

  /// Nostr event kind 30166
  ///
  /// In en, this message translates to:
  /// **'Relay Discovery'**
  String get relayDiscovery;

  /// Nostr event kind 30267
  ///
  /// In en, this message translates to:
  /// **'App Curation Sets'**
  String get appCurationSets;

  /// Nostr event kind 30311
  ///
  /// In en, this message translates to:
  /// **'Live Event'**
  String get liveEvent;

  /// Nostr event kind 30315
  ///
  /// In en, this message translates to:
  /// **'User Status'**
  String get userStatus;

  /// Nostr event kind 30388
  ///
  /// In en, this message translates to:
  /// **'Slide Set'**
  String get slideSet;

  /// Nostr event kind 30402
  ///
  /// In en, this message translates to:
  /// **'Classified Listing'**
  String get classifiedListing;

  /// Nostr event kind 30403
  ///
  /// In en, this message translates to:
  /// **'Draft Classified Listing'**
  String get draftClassifiedListing;

  /// Nostr event kind 30617
  ///
  /// In en, this message translates to:
  /// **'Repository Announcement'**
  String get repositoryAnnouncement;

  /// Nostr event kind 30618
  ///
  /// In en, this message translates to:
  /// **'Repository State Announcement'**
  String get repositoryStateAnnouncement;

  /// Nostr event kind 30818
  ///
  /// In en, this message translates to:
  /// **'Wiki Article'**
  String get wikiArticle;

  /// Nostr event kind 30819
  ///
  /// In en, this message translates to:
  /// **'Redirects'**
  String get redirects;

  /// Nostr event kind 31234
  ///
  /// In en, this message translates to:
  /// **'Draft Event'**
  String get draftEvent;

  /// Nostr event kind 31388
  ///
  /// In en, this message translates to:
  /// **'Link Set'**
  String get linkSet;

  /// Nostr event kind 31890
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get feed;

  /// Nostr event kind 31922
  ///
  /// In en, this message translates to:
  /// **'Date-Based Calendar Event'**
  String get dateBasedCalendarEvent;

  /// Nostr event kind 31923
  ///
  /// In en, this message translates to:
  /// **'Time-Based Calendar Event'**
  String get timeBasedCalendarEvent;

  /// Nostr event kind 31924
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// Nostr event kind 31925
  ///
  /// In en, this message translates to:
  /// **'Calendar Event RSVP'**
  String get calendarEventRsvp;

  /// Nostr event kind 31989
  ///
  /// In en, this message translates to:
  /// **'Handler Recommendation'**
  String get handlerRecommendation;

  /// Nostr event kind 31990
  ///
  /// In en, this message translates to:
  /// **'Handler Information'**
  String get handlerInformation;

  /// Nostr event kind 32267
  ///
  /// In en, this message translates to:
  /// **'Software Application'**
  String get softwareApplication;

  /// Nostr event kind 34550
  ///
  /// In en, this message translates to:
  /// **'Community Definition'**
  String get communityDefinition;

  /// Nostr event kind 37516
  ///
  /// In en, this message translates to:
  /// **'Geocache Listing'**
  String get geocacheListing;

  /// Nostr event kind 38172
  ///
  /// In en, this message translates to:
  /// **'Mint Announcement'**
  String get mintAnnouncement;

  /// Nostr event kind 38173
  ///
  /// In en, this message translates to:
  /// **'Mint Quote'**
  String get mintQuote;

  /// Nostr event kind 38383
  ///
  /// In en, this message translates to:
  /// **'Peer-to-peer Order'**
  String get peerToPeerOrder;

  /// Nostr event kind 39000
  ///
  /// In en, this message translates to:
  /// **'Group Metadata'**
  String get groupMetadata;

  /// Nostr event kind 39001
  ///
  /// In en, this message translates to:
  /// **'Group Admin Metadata'**
  String get groupAdminMetadata;

  /// Nostr event kind 39002
  ///
  /// In en, this message translates to:
  /// **'Group Member Metadata'**
  String get groupMemberMetadata;

  /// Nostr event kind 39003
  ///
  /// In en, this message translates to:
  /// **'Group Admins List'**
  String get groupAdminsList;

  /// Nostr event kind 39004
  ///
  /// In en, this message translates to:
  /// **'Group Members List'**
  String get groupMembersList;

  /// Nostr event kind 39005
  ///
  /// In en, this message translates to:
  /// **'Group Roles'**
  String get groupRoles;

  /// Nostr event kind 39006
  ///
  /// In en, this message translates to:
  /// **'Group Permissions'**
  String get groupPermissions;

  /// Nostr event kind 39007
  ///
  /// In en, this message translates to:
  /// **'Group Chat Message'**
  String get groupChatMessage;

  /// Nostr event kind 39008
  ///
  /// In en, this message translates to:
  /// **'Group Chat Thread'**
  String get groupChatThread;

  /// Nostr event kind 39009
  ///
  /// In en, this message translates to:
  /// **'Group Pinned'**
  String get groupPinned;

  /// Nostr event kind 39089
  ///
  /// In en, this message translates to:
  /// **'Starter Packs'**
  String get starterPacks;

  /// Nostr event kind 39092
  ///
  /// In en, this message translates to:
  /// **'Media Starter Packs'**
  String get mediaStarterPacks;

  /// Nostr event kind 39701
  ///
  /// In en, this message translates to:
  /// **'Web Bookmarks'**
  String get webBookmarks;

  /// Fallback for unknown event kinds
  ///
  /// In en, this message translates to:
  /// **'Event Kind {kind}'**
  String unknownEventKind(int kind);

  /// Title for account selection dialog
  ///
  /// In en, this message translates to:
  /// **'Select the account to use'**
  String get selectAccountToUse;

  /// Use button text in account selection
  ///
  /// In en, this message translates to:
  /// **'Use'**
  String get use;

  /// Trust level option title
  ///
  /// In en, this message translates to:
  /// **'Always ask permission'**
  String get alwaysAskPermission;

  /// Trust level option description
  ///
  /// In en, this message translates to:
  /// **'For each request from the app, you will choose what to do'**
  String get alwaysAskPermissionDescription;

  /// Trust level option title
  ///
  /// In en, this message translates to:
  /// **'Allow common actions'**
  String get allowCommonActions;

  /// Trust level option description
  ///
  /// In en, this message translates to:
  /// **'Common requests are automatically processed, you will choose what to do with the others'**
  String get allowCommonActionsDescription;

  /// Trust level option title
  ///
  /// In en, this message translates to:
  /// **'Fully trust'**
  String get fullyTrust;

  /// Trust level option description
  ///
  /// In en, this message translates to:
  /// **'Every requests are automatically processed'**
  String get fullyTrustDescription;

  /// Enable app toggle title
  ///
  /// In en, this message translates to:
  /// **'Enable this app'**
  String get enableThisApp;

  /// Enable app toggle description
  ///
  /// In en, this message translates to:
  /// **'When disabled, every requests are blocked'**
  String get enableThisAppDescription;

  /// Stepper step title for app configuration
  ///
  /// In en, this message translates to:
  /// **'App configuration'**
  String get appConfiguration;

  /// Finish button text
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// Trust level section title
  ///
  /// In en, this message translates to:
  /// **'Trust level'**
  String get trustLevel;

  /// Placeholder text when app is not found
  ///
  /// In en, this message translates to:
  /// **'Deleted app'**
  String get deletedApp;

  /// Warning message for deprecated encryption
  ///
  /// In en, this message translates to:
  /// **'This request uses deprecated encryption'**
  String get deprecatedEncryptionWarning;

  /// Warning message detail for deprecated encryption
  ///
  /// In en, this message translates to:
  /// **'Please contact and inform the app developer'**
  String get deprecatedEncryptionWarningMessage;

  /// Warning message for metadata leak
  ///
  /// In en, this message translates to:
  /// **'This request leaks metadata'**
  String get metadataLeakWarning;

  /// Warning message detail for metadata leak
  ///
  /// In en, this message translates to:
  /// **'People can know that you use a bunker and when you use it. Please contact and inform the app developer'**
  String get metadataLeakWarningMessage;

  /// Parameters section title
  ///
  /// In en, this message translates to:
  /// **'Params'**
  String get params;

  /// Button text to allow permission once
  ///
  /// In en, this message translates to:
  /// **'Allow once'**
  String get allowOnce;

  /// Button text to reject permission once
  ///
  /// In en, this message translates to:
  /// **'Reject once'**
  String get rejectOnce;

  /// Button text to allow permission forever
  ///
  /// In en, this message translates to:
  /// **'Allow forever'**
  String get allowForever;

  /// Button text to reject permission forever
  ///
  /// In en, this message translates to:
  /// **'Reject forever'**
  String get rejectForever;

  /// Processed requests count label
  ///
  /// In en, this message translates to:
  /// **'{count} Processed requests'**
  String processedRequestsCount(int count);

  /// Blocked requests count label
  ///
  /// In en, this message translates to:
  /// **'{count} Blocked requests'**
  String blockedRequestsCount(int count);

  /// Delete all button text
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get deleteAll;

  /// Notification title for new request
  ///
  /// In en, this message translates to:
  /// **'New pending request'**
  String get newPendingRequest;

  /// Notification body for new request
  ///
  /// In en, this message translates to:
  /// **'A new request from {appName} has been received and is waiting for your approval.'**
  String newPendingRequestBody(String appName);
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
    'de',
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
    case 'de':
      return AppLocalizationsDe();
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
