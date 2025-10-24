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
  String unknownPermissionMessage(
    String appName,
    String permission,
    String userName,
  ) {
    return 'The app \'$appName\' is requesting permission for \'$permission\' on behalf of user \'$userName\'. Do you want to allow this?';
  }

  @override
  String get allow => 'Allow';

  @override
  String get deny => 'Deny';

  @override
  String get copied => 'Copied';

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
  String get invalidPrivateKey =>
      'Sorry, it looks like that private key is invalid.';

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
  String get reject => 'Reject';

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
  String get notifications => 'Notifications';

  @override
  String get notificationsDescription =>
      'Show notifications for permission requests';

  @override
  String get useTor => 'Use Tor';

  @override
  String get useTorDescription =>
      'Route connections through Tor network for enhanced privacy';

  @override
  String get useTorComingSoon =>
      'Route connections through Tor network for enhanced privacy (Coming soon)';

  @override
  String get removeClientTag => 'Remove client tag';

  @override
  String get removeClientTagDescription =>
      'Automatically remove the client tag from events before signing for this app';

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

  @override
  String get createOne => 'Create one';

  @override
  String get create => 'Create';

  @override
  String get or => 'OR';

  @override
  String get importOne => 'Import one';

  @override
  String get nsecNcryptsecOrHex => 'Nsec, ncryptsec or hex';

  @override
  String get ncryptsecPassword => 'Ncryptsec password';

  @override
  String get importKey => 'Import Key';

  @override
  String get backupSecurelyWithPassword =>
      'Backup this account securely with a password';

  @override
  String get backupInsecurelyWithoutPassword =>
      'Backup this account insecurely without a password';

  @override
  String get connectWithNostrConnectUrl => 'Connect with Nostr connect URL';

  @override
  String get decryptionFailed =>
      'Sorry, we weren\'t able to decrypt your private key with that password.';

  @override
  String get userMetadata => 'User Metadata';

  @override
  String get shortTextNote => 'Short Text Note';

  @override
  String get recommendRelay => 'Recommend Relay';

  @override
  String get follows => 'Follows';

  @override
  String get encryptedDirectMessages => 'Encrypted Direct Messages';

  @override
  String get eventDeletionRequest => 'Event Deletion Request';

  @override
  String get repost => 'Repost';

  @override
  String get reaction => 'Reaction';

  @override
  String get badgeAward => 'Badge Award';

  @override
  String get chatMessage => 'Chat Message';

  @override
  String get groupChatThreadedReply => 'Group Chat Threaded Reply';

  @override
  String get thread => 'Thread';

  @override
  String get groupThreadReply => 'Group Thread Reply';

  @override
  String get seal => 'Seal';

  @override
  String get directMessage => 'Direct Message';

  @override
  String get fileMessage => 'File Message';

  @override
  String get genericRepost => 'Generic Repost';

  @override
  String get reactionToWebsite => 'Reaction to a website';

  @override
  String get picture => 'Picture';

  @override
  String get videoEvent => 'Video Event';

  @override
  String get shortFormPortraitVideoEvent => 'Short-form Portrait Video Event';

  @override
  String get internalReference => 'Internal reference';

  @override
  String get externalReference => 'External reference';

  @override
  String get hardcopyReference => 'Hardcopy reference';

  @override
  String get promptReference => 'Prompt reference';

  @override
  String get channelCreation => 'Channel Creation';

  @override
  String get channelMetadata => 'Channel Metadata';

  @override
  String get channelMessage => 'Channel Message';

  @override
  String get channelHideMessage => 'Channel Hide Message';

  @override
  String get channelMuteUser => 'Channel Mute User';

  @override
  String get requestToVanish => 'Request to Vanish';

  @override
  String get chessPgn => 'Chess (PGN)';

  @override
  String get mlsKeyPackage => 'MLS KeyPackage';

  @override
  String get mlsWelcome => 'MLS Welcome';

  @override
  String get mlsGroupEvent => 'MLS Group Event';

  @override
  String get mergeRequests => 'Merge Requests';

  @override
  String get pollResponse => 'Poll Response';

  @override
  String get marketplaceBid => 'Marketplace Bid';

  @override
  String get marketplaceBidConfirmation => 'Marketplace Bid Confirmation';

  @override
  String get openTimestamps => 'OpenTimestamps';

  @override
  String get giftWrap => 'Gift Wrap';

  @override
  String get fileMetadata => 'File Metadata';

  @override
  String get poll => 'Poll';

  @override
  String get comment => 'Comment';

  @override
  String get voiceMessage => 'Voice Message';

  @override
  String get voiceMessageComment => 'Voice Message Comment';

  @override
  String get liveChatMessage => 'Live Chat Message';

  @override
  String get codeSnippet => 'Code Snippet';

  @override
  String get gitPatch => 'Git Patch';

  @override
  String get gitPullRequest => 'Git Pull Request';

  @override
  String get gitStatusUpdate => 'Git Status Update';

  @override
  String get gitIssue => 'Git Issue';

  @override
  String get gitIssueUpdate => 'Git Issue Update';

  @override
  String get status => 'Status';

  @override
  String get statusUpdate => 'Status Update';

  @override
  String get statusDelete => 'Status Delete';

  @override
  String get statusReply => 'Status Reply';

  @override
  String get problemTracker => 'Problem Tracker';

  @override
  String get reporting => 'Reporting';

  @override
  String get label => 'Label';

  @override
  String get relayReviews => 'Relay reviews';

  @override
  String get aiEmbeddings => 'AI Embeddings / Vector lists';

  @override
  String get torrent => 'Torrent';

  @override
  String get torrentComment => 'Torrent Comment';

  @override
  String get coinjoinPool => 'Coinjoin Pool';

  @override
  String get communityPostApproval => 'Community Post Approval';

  @override
  String get jobRequest => 'Job Request';

  @override
  String get jobResult => 'Job Result';

  @override
  String get jobFeedback => 'Job Feedback';

  @override
  String get cashuWalletToken => 'Cashu Wallet Token';

  @override
  String get cashuWalletProofs => 'Cashu Wallet Proofs';

  @override
  String get cashuWalletHistory => 'Cashu Wallet History';

  @override
  String get geocacheCreate => 'Geocache Create';

  @override
  String get geocacheUpdate => 'Geocache Update';

  @override
  String get groupControlEvent => 'Group Control Event';

  @override
  String get zapGoal => 'Zap Goal';

  @override
  String get nutzap => 'Nutzap';

  @override
  String get tidalLogin => 'Tidal login';

  @override
  String get zapRequest => 'Zap Request';

  @override
  String get zap => 'Zap';

  @override
  String get highlights => 'Highlights';

  @override
  String get muteList => 'Mute List';

  @override
  String get pinList => 'Pin List';

  @override
  String get relayListMetadata => 'Relay List Metadata';

  @override
  String get bookmarkList => 'Bookmark List';

  @override
  String get communitiesList => 'Communities List';

  @override
  String get publicChatsList => 'Public Chats List';

  @override
  String get blockedRelaysList => 'Blocked Relays List';

  @override
  String get searchRelaysList => 'Search Relays List';

  @override
  String get userGroups => 'User Groups';

  @override
  String get favoritesList => 'Favorites List';

  @override
  String get privateEventsList => 'Private Events List';

  @override
  String get interestsList => 'Interests List';

  @override
  String get mediaFollowsList => 'Media Follows List';

  @override
  String get peopleFollowsList => 'People Follows List';

  @override
  String get userEmojiList => 'User Emoji List';

  @override
  String get dmRelayList => 'DM Relay List';

  @override
  String get keyPackageRelayList => 'KeyPackage Relay List';

  @override
  String get userServerList => 'User Server List';

  @override
  String get fileStorageServerList => 'File Storage Server List';

  @override
  String get relayMonitorAnnouncement => 'Relay Monitor Announcement';

  @override
  String get roomPresence => 'Room Presence';

  @override
  String get proxyAnnouncement => 'Proxy Announcement';

  @override
  String get transportMethodAnnouncement => 'Transport Method Announcement';

  @override
  String get walletInfo => 'Wallet Info';

  @override
  String get cashuWalletEvent => 'Cashu Wallet Event';

  @override
  String get lightningPubRpc => 'Lightning Pub RPC';

  @override
  String get clientAuthentication => 'Client Authentication';

  @override
  String get walletRequest => 'Wallet Request';

  @override
  String get walletResponse => 'Wallet Response';

  @override
  String get nostrConnectEvent => 'Nostr Connect';

  @override
  String get blobsStoredOnMediaservers => 'Blobs stored on mediaservers';

  @override
  String get httpAuth => 'HTTP Auth';

  @override
  String get categorizedPeopleList => 'Categorized People List';

  @override
  String get categorizedBookmarkList => 'Categorized Bookmark List';

  @override
  String get categorizedRelayList => 'Categorized Relay List';

  @override
  String get bookmarkSets => 'Bookmark Sets';

  @override
  String get curationSets => 'Curation Sets';

  @override
  String get videoSets => 'Video Sets';

  @override
  String get kindMuteSets => 'Kind Mute Sets';

  @override
  String get profileBadges => 'Profile Badges';

  @override
  String get badgeDefinition => 'Badge Definition';

  @override
  String get interestSets => 'Interest Sets';

  @override
  String get createOrUpdateStall => 'Create or Update Stall';

  @override
  String get createOrUpdateProduct => 'Create or Update Product';

  @override
  String get marketplaceUiUx => 'Marketplace UI/UX';

  @override
  String get productSoldAsAuction => 'Product Sold as Auction';

  @override
  String get longFormContent => 'Long-form Content';

  @override
  String get draftLongFormContent => 'Draft Long-form Content';

  @override
  String get emojiSets => 'Emoji Sets';

  @override
  String get curatedPublicationItem => 'Curated Publication Item';

  @override
  String get curatedPublicationDraft => 'Curated Publication Draft';

  @override
  String get releaseArtifactSets => 'Release Artifact Sets';

  @override
  String get applicationSpecificData => 'Application-specific Data';

  @override
  String get relayDiscovery => 'Relay Discovery';

  @override
  String get appCurationSets => 'App Curation Sets';

  @override
  String get liveEvent => 'Live Event';

  @override
  String get userStatus => 'User Status';

  @override
  String get slideSet => 'Slide Set';

  @override
  String get classifiedListing => 'Classified Listing';

  @override
  String get draftClassifiedListing => 'Draft Classified Listing';

  @override
  String get repositoryAnnouncement => 'Repository Announcement';

  @override
  String get repositoryStateAnnouncement => 'Repository State Announcement';

  @override
  String get wikiArticle => 'Wiki Article';

  @override
  String get redirects => 'Redirects';

  @override
  String get draftEvent => 'Draft Event';

  @override
  String get linkSet => 'Link Set';

  @override
  String get feed => 'Feed';

  @override
  String get dateBasedCalendarEvent => 'Date-Based Calendar Event';

  @override
  String get timeBasedCalendarEvent => 'Time-Based Calendar Event';

  @override
  String get calendar => 'Calendar';

  @override
  String get calendarEventRsvp => 'Calendar Event RSVP';

  @override
  String get handlerRecommendation => 'Handler Recommendation';

  @override
  String get handlerInformation => 'Handler Information';

  @override
  String get softwareApplication => 'Software Application';

  @override
  String get communityDefinition => 'Community Definition';

  @override
  String get geocacheListing => 'Geocache Listing';

  @override
  String get mintAnnouncement => 'Mint Announcement';

  @override
  String get mintQuote => 'Mint Quote';

  @override
  String get peerToPeerOrder => 'Peer-to-peer Order';

  @override
  String get groupMetadata => 'Group Metadata';

  @override
  String get groupAdminMetadata => 'Group Admin Metadata';

  @override
  String get groupMemberMetadata => 'Group Member Metadata';

  @override
  String get groupAdminsList => 'Group Admins List';

  @override
  String get groupMembersList => 'Group Members List';

  @override
  String get groupRoles => 'Group Roles';

  @override
  String get groupPermissions => 'Group Permissions';

  @override
  String get groupChatMessage => 'Group Chat Message';

  @override
  String get groupChatThread => 'Group Chat Thread';

  @override
  String get groupPinned => 'Group Pinned';

  @override
  String get starterPacks => 'Starter Packs';

  @override
  String get mediaStarterPacks => 'Media Starter Packs';

  @override
  String get webBookmarks => 'Web Bookmarks';

  @override
  String unknownEventKind(int kind) {
    return 'Event Kind $kind';
  }

  @override
  String get selectAccountToUse => 'Select the account to use';

  @override
  String get use => 'Use';

  @override
  String get alwaysAskPermission => 'Always ask permission';

  @override
  String get alwaysAskPermissionDescription =>
      'For each request from the app, you will choose what to do';

  @override
  String get allowCommonActions => 'Allow common actions';

  @override
  String get allowCommonActionsDescription =>
      'Common requests are automatically processed, you will choose what to do with the others';

  @override
  String get fullyTrust => 'Fully trust';

  @override
  String get fullyTrustDescription =>
      'Every requests are automatically processed';

  @override
  String get enableThisApp => 'Enable this app';

  @override
  String get enableThisAppDescription =>
      'When disabled, every requests are blocked';

  @override
  String get appConfiguration => 'App configuration';

  @override
  String get finish => 'Finish';

  @override
  String get trustLevel => 'Trust level';

  @override
  String get deletedApp => 'Deleted app';

  @override
  String get deprecatedEncryptionWarning =>
      'This request uses deprecated encryption';

  @override
  String get deprecatedEncryptionWarningMessage =>
      'Please contact and inform the app developer';

  @override
  String get metadataLeakWarning => 'This request leaks metadata';

  @override
  String get metadataLeakWarningMessage =>
      'People can know that you use a bunker and when you use it. Please contact and inform the app developer';

  @override
  String get params => 'Params';

  @override
  String get allowOnce => 'Allow once';

  @override
  String get rejectOnce => 'Reject once';

  @override
  String get allowForever => 'Allow forever';

  @override
  String get rejectForever => 'Reject forever';

  @override
  String processedRequestsCount(int count) {
    return '$count Processed requests';
  }

  @override
  String blockedRequestsCount(int count) {
    return '$count Blocked requests';
  }

  @override
  String get deleteAll => 'Delete All';

  @override
  String get newPendingRequest => 'New pending request';

  @override
  String newPendingRequestBody(String appName) {
    return 'A new request from $appName has been received and is waiting for your approval.';
  }
}
