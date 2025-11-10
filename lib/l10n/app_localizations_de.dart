// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get applications => 'Anwendungen';

  @override
  String get settings => 'Einstellungen';

  @override
  String get requests => 'Anfragen';

  @override
  String get unnamedApp => 'Unbenannte App';

  @override
  String get noApplicationsConnected => 'Keine Anwendungen verbunden';

  @override
  String get tapPlusToAddApplication =>
      'Tippen Sie auf +, um eine Anwendung hinzuzufügen';

  @override
  String get noRequests => 'Keine Anfragen';

  @override
  String get whenYouReceiveRequests =>
      'Wenn Sie neue Anfragen erhalten, werden diese hier angezeigt';

  @override
  String get pending => 'Anstehend';

  @override
  String get manageApplication => 'Anwendung verwalten';

  @override
  String get connectedAccount => 'Verbundenes Konto';

  @override
  String get permissions => 'Berechtigungen';

  @override
  String get noPermissionsSet => 'Keine Berechtigungen festgelegt';

  @override
  String removeApp(String appName) {
    return '$appName entfernen';
  }

  @override
  String get deleteApplication => 'Anwendung löschen';

  @override
  String deleteApplicationConfirm(String appName) {
    return 'Sind Sie sicher, dass Sie \'$appName\' löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden.';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get addApplication => 'Anwendung hinzufügen';

  @override
  String get chooseAccount => 'Konto auswählen';

  @override
  String get nostrConnect => 'Nostr Connect';

  @override
  String get appName => 'Anwendungsname';

  @override
  String get enterAppName => 'Anwendungsname eingeben';

  @override
  String get addThisApp => 'Diese Anwendung hinzufügen';

  @override
  String get requestedPermissions => 'Angeforderte Berechtigungen';

  @override
  String get noSpecificPermissionsRequested =>
      'Keine spezifischen Berechtigungen angefordert';

  @override
  String get unknownPermission => 'Unbekannte Berechtigung';

  @override
  String unknownPermissionMessage(
    String appName,
    String permission,
    String userName,
  ) {
    return 'Die Anwendung \'$appName\' fordert Berechtigung für \'$permission\' im Namen des Benutzers \'$userName\' an. Möchten Sie dies erlauben?';
  }

  @override
  String get allow => 'Erlauben';

  @override
  String get deny => 'Verweigern';

  @override
  String get copied => 'Kopiert';

  @override
  String get copiedToClipboard => 'In Zwischenablage kopiert';

  @override
  String get applicationDeleted => 'Anwendung gelöscht';

  @override
  String get permissionUpdated => 'Berechtigung aktualisiert';

  @override
  String get permissionRemoved => 'Berechtigung entfernt';

  @override
  String get permissionAdded => 'Berechtigung hinzugefügt';

  @override
  String permissionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Berechtigungen',
      one: '1 Berechtigung',
      zero: 'keine Berechtigungen',
    );
    return '$_temp0';
  }

  @override
  String get loggedAccounts => 'Angemeldete Konten';

  @override
  String get defaultBunkerRelays => 'Standard-Bunker-Relays';

  @override
  String get addRelay => 'Relay hinzufügen';

  @override
  String get enterRelayUrl => 'Relay-URL eingeben';

  @override
  String get addPrivateKey => 'Privaten Schlüssel hinzufügen';

  @override
  String get enterPrivateKey =>
      'Geben Sie Ihren privaten Schlüssel ein (nsec oder hex)';

  @override
  String get accountAddedSuccessfully => 'Konto erfolgreich hinzugefügt';

  @override
  String get backupAccount => 'Konto sichern';

  @override
  String get showPrivateKey => 'Privaten Schlüssel anzeigen';

  @override
  String get hidePrivateKey => 'Privaten Schlüssel ausblenden';

  @override
  String get copyPrivateKey => 'Privaten Schlüssel kopieren';

  @override
  String get privateKeyCopied => 'Privater Schlüssel in Zwischenablage kopiert';

  @override
  String get appNotFound => 'Anwendung nicht gefunden';

  @override
  String get allowed => 'Erlaubt';

  @override
  String get blocked => 'Blockiert';

  @override
  String get permission_connect => 'Verbinden';

  @override
  String get permission_get_public_key => 'Öffentlichen Schlüssel abrufen';

  @override
  String get permission_sign_event => 'Ereignis signieren';

  @override
  String get permission_ping => 'Ping';

  @override
  String get permission_get_relays => 'Relays abrufen';

  @override
  String get permission_nip04_encrypt => 'Verschlüsseln (NIP-04)';

  @override
  String get permission_nip04_decrypt => 'Entschlüsseln (NIP-04)';

  @override
  String get permission_nip44_encrypt => 'Verschlüsseln (NIP-44)';

  @override
  String get permission_nip44_decrypt => 'Entschlüsseln (NIP-44)';

  @override
  String get permissionRequested => 'Berechtigung angefordert';

  @override
  String appRequestingPermission(String appName) {
    return '$appName fordert Berechtigung an:';
  }

  @override
  String get authorizeOrBlockRequest =>
      'Möchten Sie diese Anfrage autorisieren oder blockieren?';

  @override
  String get block => 'Blockieren';

  @override
  String get reject => 'Ablehnen';

  @override
  String get authorize => 'Autorisieren';

  @override
  String get removeAccount => 'Konto entfernen';

  @override
  String get removeAccountConfirm =>
      'Sind Sie sicher, dass Sie dieses Konto entfernen möchten? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get remove => 'Entfernen';

  @override
  String get copyNpub => 'Npub kopieren';

  @override
  String get addAnAccount => 'Ein Konto hinzufügen';

  @override
  String get removeRelay => 'Relay entfernen';

  @override
  String removeRelayConfirm(String relay) {
    return 'Sind Sie sicher, dass Sie dieses Relay entfernen möchten?\n$relay';
  }

  @override
  String get relayRemoved => 'Relay entfernt';

  @override
  String get cannotRemoveLastRelay =>
      'Letztes Relay kann nicht entfernt werden';

  @override
  String get cannotRemoveLastRelayMessage =>
      'Sie müssen mindestens ein Relay haben. Bitte fügen Sie ein weiteres Relay hinzu, bevor Sie dieses entfernen.';

  @override
  String get ok => 'OK';

  @override
  String get systemSettings => 'Systemeinstellungen';

  @override
  String get startOnSystemStartup => 'Beim Systemstart starten';

  @override
  String get startOnSystemStartupDescription =>
      'Peridot automatisch beim Computerstart ausführen';

  @override
  String get desktopNotifications => 'Desktop-Benachrichtigungen';

  @override
  String get desktopNotificationsDescription =>
      'Desktop-Benachrichtigungen für Berechtigungsanfragen anzeigen';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get notificationsDescription =>
      'Benachrichtigungen für Berechtigungsanfragen anzeigen';

  @override
  String get useTor => 'Tor verwenden';

  @override
  String get useTorDescription =>
      'Verbindungen über Tor-Netzwerk für erhöhte Privatsphäre leiten';

  @override
  String get useTorComingSoon =>
      'Verbindungen über Tor-Netzwerk für erhöhte Privatsphäre leiten (Demnächst)';

  @override
  String get removeClientTag => 'Client-Tag entfernen';

  @override
  String get removeClientTagDescription =>
      'Client-Tag automatisch aus Ereignissen vor dem Signieren für diese Anwendung entfernen';

  @override
  String get continueButton => 'Weiter';

  @override
  String get bunkerUrlCopiedSuccessfully => 'Bunker-URL erfolgreich kopiert';

  @override
  String get addAnApp => 'Eine Anwendung hinzufügen';

  @override
  String get chooseTheAccount => 'Konto auswählen';

  @override
  String get connectAnApp => 'Eine Anwendung verbinden';

  @override
  String get addThisAppQuestion => 'Diese Anwendung hinzufügen?';

  @override
  String get connect => 'Verbinden';

  @override
  String get connectWithBunkerUrl => 'Mit Bunker-URL verbinden';

  @override
  String get copyBunkerUrl => 'Bunker-URL kopieren';

  @override
  String get nostrConnectUrlHint => 'nostrconnect://';

  @override
  String get publicKeyCopiedSuccessfully =>
      'Öffentlicher Schlüssel erfolgreich kopiert';

  @override
  String get pleaseEnterPassword => 'Bitte geben Sie ein Passwort ein';

  @override
  String get encryptedBackupCopied => 'Verschlüsselte Sicherung kopiert';

  @override
  String get backupFailed => 'Sicherung fehlgeschlagen';

  @override
  String get privateKeyCopiedToClipboard => 'Privater Schlüssel kopiert';

  @override
  String get copyFailed => 'Kopieren fehlgeschlagen';

  @override
  String get backupThisAccount => 'Dieses Konto sichern';

  @override
  String get noAccountSelected => 'Kein Konto ausgewählt';

  @override
  String get recommended => 'Empfohlen';

  @override
  String get notRecommended => 'Nicht empfohlen';

  @override
  String get password => 'Passwort';

  @override
  String get copyEncryptedVersion => 'Verschlüsselte Version kopieren';

  @override
  String get copyUnencryptedVersion => 'Unverschlüsselte Version kopieren';

  @override
  String get yourPassword => 'Ihr Passwort';

  @override
  String get createOne => 'Eines erstellen';

  @override
  String get create => 'Erstellen';

  @override
  String get or => 'ODER';

  @override
  String get importOne => 'Eines importieren';

  @override
  String get nsecNcryptsecOrHex => 'Nsec, ncryptsec oder hex';

  @override
  String get ncryptsecPassword => 'Ncryptsec-Passwort';

  @override
  String get importKey => 'Schlüssel importieren';

  @override
  String get backupSecurelyWithPassword =>
      'Dieses Konto sicher mit einem Passwort sichern';

  @override
  String get backupInsecurelyWithoutPassword =>
      'Dieses Konto unsicher ohne Passwort sichern';

  @override
  String get connectWithNostrConnectUrl => 'Mit Nostr Connect-URL verbinden';

  @override
  String get decryptionFailed =>
      'Entschuldigung, wir konnten Ihren privaten Schlüssel mit diesem Passwort nicht entschlüsseln.';

  @override
  String get invalidPrivateKey =>
      'Entschuldigung, dieser private Schlüssel scheint ungültig zu sein.';

  @override
  String get userMetadata => 'Benutzermetadaten';

  @override
  String get shortTextNote => 'Kurze Textnotiz';

  @override
  String get recommendRelay => 'Relay empfehlen';

  @override
  String get follows => 'Folgt';

  @override
  String get encryptedDirectMessages => 'Verschlüsselte Direktnachrichten';

  @override
  String get eventDeletionRequest => 'Ereignislöschungsanfrage';

  @override
  String get repost => 'Repost';

  @override
  String get reaction => 'Reaktion';

  @override
  String get badgeAward => 'Abzeichenverleihung';

  @override
  String get chatMessage => 'Chat-Nachricht';

  @override
  String get groupChatThreadedReply => 'Gruppenchat-Thread-Antwort';

  @override
  String get thread => 'Thread';

  @override
  String get groupThreadReply => 'Gruppen-Thread-Antwort';

  @override
  String get seal => 'Siegel';

  @override
  String get directMessage => 'Direktnachricht';

  @override
  String get fileMessage => 'Dateinachricht';

  @override
  String get genericRepost => 'Generischer Repost';

  @override
  String get reactionToWebsite => 'Reaktion auf Website';

  @override
  String get picture => 'Bild';

  @override
  String get videoEvent => 'Video-Ereignis';

  @override
  String get shortFormPortraitVideoEvent => 'Kurzes Hochformat-Video-Ereignis';

  @override
  String get internalReference => 'Interne Referenz';

  @override
  String get externalReference => 'Externe Referenz';

  @override
  String get hardcopyReference => 'Hardcopy-Referenz';

  @override
  String get promptReference => 'Prompt-Referenz';

  @override
  String get channelCreation => 'Kanalerstellung';

  @override
  String get channelMetadata => 'Kanalmetadaten';

  @override
  String get channelMessage => 'Kanalnachricht';

  @override
  String get channelHideMessage => 'Kanalnachricht ausblenden';

  @override
  String get channelMuteUser => 'Kanalbenutzer stummschalten';

  @override
  String get requestToVanish => 'Anfrage zum Verschwinden';

  @override
  String get chessPgn => 'Schach (PGN)';

  @override
  String get mlsKeyPackage => 'MLS-Schlüsselpaket';

  @override
  String get mlsWelcome => 'MLS-Willkommen';

  @override
  String get mlsGroupEvent => 'MLS-Gruppenereignis';

  @override
  String get mergeRequests => 'Merge-Anfragen';

  @override
  String get pollResponse => 'Umfrageantwort';

  @override
  String get marketplaceBid => 'Marktplatz-Gebot';

  @override
  String get marketplaceBidConfirmation => 'Marktplatz-Gebotsbestätigung';

  @override
  String get openTimestamps => 'OpenTimestamps';

  @override
  String get giftWrap => 'Geschenkverpackung';

  @override
  String get fileMetadata => 'Dateimetadaten';

  @override
  String get poll => 'Umfrage';

  @override
  String get comment => 'Kommentar';

  @override
  String get voiceMessage => 'Sprachnachricht';

  @override
  String get voiceMessageComment => 'Sprachnachrichtenkommentar';

  @override
  String get liveChatMessage => 'Live-Chat-Nachricht';

  @override
  String get codeSnippet => 'Code-Snippet';

  @override
  String get gitPatch => 'Git-Patch';

  @override
  String get gitPullRequest => 'Git-Pull-Request';

  @override
  String get gitStatusUpdate => 'Git-Status-Update';

  @override
  String get gitIssue => 'Git-Issue';

  @override
  String get gitIssueUpdate => 'Git-Issue-Update';

  @override
  String get status => 'Status';

  @override
  String get statusUpdate => 'Status-Update';

  @override
  String get statusDelete => 'Status löschen';

  @override
  String get statusReply => 'Status-Antwort';

  @override
  String get problemTracker => 'Problem-Tracker';

  @override
  String get reporting => 'Meldung';

  @override
  String get label => 'Label';

  @override
  String get relayReviews => 'Relay-Bewertungen';

  @override
  String get aiEmbeddings => 'KI-Einbettungen / Vektorlisten';

  @override
  String get torrent => 'Torrent';

  @override
  String get torrentComment => 'Torrent-Kommentar';

  @override
  String get coinjoinPool => 'Coinjoin-Pool';

  @override
  String get communityPostApproval => 'Community-Beitragsgenehmigung';

  @override
  String get jobRequest => 'Auftragsanfrage';

  @override
  String get jobResult => 'Auftragsergebnis';

  @override
  String get jobFeedback => 'Auftrags-Feedback';

  @override
  String get cashuWalletToken => 'Cashu-Wallet-Token';

  @override
  String get cashuWalletProofs => 'Cashu-Wallet-Nachweise';

  @override
  String get cashuWalletHistory => 'Cashu-Wallet-Verlauf';

  @override
  String get geocacheCreate => 'Geocache erstellen';

  @override
  String get geocacheUpdate => 'Geocache aktualisieren';

  @override
  String get groupControlEvent => 'Gruppensteuerungs-Ereignis';

  @override
  String get zapGoal => 'Zap-Ziel';

  @override
  String get nutzap => 'Nutzap';

  @override
  String get tidalLogin => 'Tidal-Anmeldung';

  @override
  String get zapRequest => 'Zap-Anfrage';

  @override
  String get zap => 'Zap';

  @override
  String get highlights => 'Highlights';

  @override
  String get muteList => 'Stummschaltungsliste';

  @override
  String get pinList => 'Pin-Liste';

  @override
  String get relayListMetadata => 'Relay-Listenmetadaten';

  @override
  String get bookmarkList => 'Lesezeichenliste';

  @override
  String get communitiesList => 'Community-Liste';

  @override
  String get publicChatsList => 'Öffentliche Chat-Liste';

  @override
  String get blockedRelaysList => 'Blockierte Relay-Liste';

  @override
  String get searchRelaysList => 'Such-Relay-Liste';

  @override
  String get userGroups => 'Benutzergruppen';

  @override
  String get favoritesList => 'Favoritenliste';

  @override
  String get privateEventsList => 'Private Ereignisliste';

  @override
  String get interestsList => 'Interessenliste';

  @override
  String get mediaFollowsList => 'Medien-Folge-Liste';

  @override
  String get peopleFollowsList => 'Personen-Folge-Liste';

  @override
  String get userEmojiList => 'Benutzer-Emoji-Liste';

  @override
  String get dmRelayList => 'DM-Relay-Liste';

  @override
  String get keyPackageRelayList => 'Schlüsselpaket-Relay-Liste';

  @override
  String get userServerList => 'Benutzerserverliste';

  @override
  String get fileStorageServerList => 'Dateispeicherserverliste';

  @override
  String get relayMonitorAnnouncement => 'Relay-Monitor-Ankündigung';

  @override
  String get roomPresence => 'Raumpräsenz';

  @override
  String get proxyAnnouncement => 'Proxy-Ankündigung';

  @override
  String get transportMethodAnnouncement => 'Transportmethoden-Ankündigung';

  @override
  String get walletInfo => 'Wallet-Informationen';

  @override
  String get cashuWalletEvent => 'Cashu-Wallet-Ereignis';

  @override
  String get lightningPubRpc => 'Lightning Pub RPC';

  @override
  String get clientAuthentication => 'Client-Authentifizierung';

  @override
  String get walletRequest => 'Wallet-Anfrage';

  @override
  String get walletResponse => 'Wallet-Antwort';

  @override
  String get nostrConnectEvent => 'Nostr Connect';

  @override
  String get blobsStoredOnMediaservers =>
      'Auf Medienservern gespeicherte Blobs';

  @override
  String get httpAuth => 'HTTP-Authentifizierung';

  @override
  String get categorizedPeopleList => 'Kategorisierte Personenliste';

  @override
  String get categorizedBookmarkList => 'Kategorisierte Lesezeichenliste';

  @override
  String get categorizedRelayList => 'Kategorisierte Relay-Liste';

  @override
  String get bookmarkSets => 'Lesezeichensets';

  @override
  String get curationSets => 'Kuratierungssets';

  @override
  String get videoSets => 'Videosets';

  @override
  String get kindMuteSets => 'Art-Stummschaltungssets';

  @override
  String get profileBadges => 'Profilabzeichen';

  @override
  String get badgeDefinition => 'Abzeichendefinition';

  @override
  String get interestSets => 'Interessensets';

  @override
  String get createOrUpdateStall => 'Stand erstellen oder aktualisieren';

  @override
  String get createOrUpdateProduct => 'Produkt erstellen oder aktualisieren';

  @override
  String get marketplaceUiUx => 'Marktplatz-UI/UX';

  @override
  String get productSoldAsAuction => 'Produkt als Auktion verkauft';

  @override
  String get longFormContent => 'Langform-Inhalt';

  @override
  String get draftLongFormContent => 'Entwurf für Langform-Inhalt';

  @override
  String get emojiSets => 'Emoji-Sets';

  @override
  String get curatedPublicationItem => 'Kuratierter Publikationsartikel';

  @override
  String get curatedPublicationDraft => 'Entwurf für kuratierte Publikation';

  @override
  String get releaseArtifactSets => 'Release-Artefaktsets';

  @override
  String get applicationSpecificData => 'Anwendungsspezifische Daten';

  @override
  String get relayDiscovery => 'Relay-Erkennung';

  @override
  String get appCurationSets => 'App-Kuratierungssets';

  @override
  String get liveEvent => 'Live-Ereignis';

  @override
  String get userStatus => 'Benutzerstatus';

  @override
  String get slideSet => 'Folienset';

  @override
  String get classifiedListing => 'Kleinanzeige';

  @override
  String get draftClassifiedListing => 'Entwurf für Kleinanzeige';

  @override
  String get repositoryAnnouncement => 'Repository-Ankündigung';

  @override
  String get repositoryStateAnnouncement => 'Repository-Status-Ankündigung';

  @override
  String get wikiArticle => 'Wiki-Artikel';

  @override
  String get redirects => 'Weiterleitungen';

  @override
  String get draftEvent => 'Entwurfs-Ereignis';

  @override
  String get linkSet => 'Linkset';

  @override
  String get feed => 'Feed';

  @override
  String get dateBasedCalendarEvent => 'Datumsbasiertes Kalenderereignis';

  @override
  String get timeBasedCalendarEvent => 'Zeitbasiertes Kalenderereignis';

  @override
  String get calendar => 'Kalender';

  @override
  String get calendarEventRsvp => 'Kalender-Ereignis-RSVP';

  @override
  String get handlerRecommendation => 'Handler-Empfehlung';

  @override
  String get handlerInformation => 'Handler-Informationen';

  @override
  String get softwareApplication => 'Softwareanwendung';

  @override
  String get communityDefinition => 'Community-Definition';

  @override
  String get geocacheListing => 'Geocache-Auflistung';

  @override
  String get mintAnnouncement => 'Mint-Ankündigung';

  @override
  String get mintQuote => 'Mint-Zitat';

  @override
  String get peerToPeerOrder => 'Peer-to-Peer-Bestellung';

  @override
  String get groupMetadata => 'Gruppenmetadaten';

  @override
  String get groupAdminMetadata => 'Gruppenadministrator-Metadaten';

  @override
  String get groupMemberMetadata => 'Gruppenmitglied-Metadaten';

  @override
  String get groupAdminsList => 'Gruppenadministratorenliste';

  @override
  String get groupMembersList => 'Gruppenmitgliederliste';

  @override
  String get groupRoles => 'Gruppenrollen';

  @override
  String get groupPermissions => 'Gruppenberechtigungen';

  @override
  String get groupChatMessage => 'Gruppenchat-Nachricht';

  @override
  String get groupChatThread => 'Gruppenchat-Thread';

  @override
  String get groupPinned => 'Gruppengepinnt';

  @override
  String get starterPacks => 'Starter-Packs';

  @override
  String get mediaStarterPacks => 'Medien-Starter-Packs';

  @override
  String get webBookmarks => 'Web-Lesezeichen';

  @override
  String get videoView => 'Videoansicht';

  @override
  String unknownEventKind(int kind) {
    return 'Ereignistyp $kind';
  }

  @override
  String get selectAccountToUse => 'Wählen Sie das zu verwendende Konto aus';

  @override
  String get use => 'Verwenden';

  @override
  String get alwaysAskPermission => 'Immer um Erlaubnis fragen';

  @override
  String get alwaysAskPermissionDescription =>
      'Für jede Anfrage der App werden Sie entscheiden, was zu tun ist';

  @override
  String get allowCommonActions => 'Häufige Aktionen zulassen';

  @override
  String get allowCommonActionsDescription =>
      'Häufige Anfragen werden automatisch verarbeitet, Sie entscheiden über die anderen';

  @override
  String get fullyTrust => 'Vollständig vertrauen';

  @override
  String get fullyTrustDescription =>
      'Alle Anfragen werden automatisch verarbeitet';

  @override
  String get enableThisApp => 'Diese App aktivieren';

  @override
  String get enableThisAppDescription =>
      'Wenn deaktiviert, werden alle Anfragen blockiert';

  @override
  String get appConfiguration => 'App-Konfiguration';

  @override
  String get finish => 'Fertig';

  @override
  String get trustLevel => 'Vertrauensstufe';

  @override
  String get deletedApp => 'Gelöschte App';

  @override
  String get deprecatedEncryptionWarning =>
      'Diese Anfrage verwendet veraltete Verschlüsselung';

  @override
  String get deprecatedEncryptionWarningMessage =>
      'Bitte kontaktieren und informieren Sie den App-Entwickler';

  @override
  String get metadataLeakWarning => 'Diese Anfrage leckt Metadaten';

  @override
  String get metadataLeakWarningMessage =>
      'Leute können wissen, dass Sie einen Bunker verwenden und wann Sie ihn verwenden. Bitte kontaktieren und informieren Sie den App-Entwickler';

  @override
  String get params => 'Parameter';

  @override
  String get allowOnce => 'Einmal erlauben';

  @override
  String get rejectOnce => 'Einmal ablehnen';

  @override
  String get allowForever => 'Für immer erlauben';

  @override
  String get rejectForever => 'Für immer ablehnen';

  @override
  String processedRequestsCount(int count) {
    return '$count Verarbeitete Anfragen';
  }

  @override
  String blockedRequestsCount(int count) {
    return '$count Blockierte Anfragen';
  }

  @override
  String get deleteAll => 'Alle löschen';

  @override
  String get newPendingRequest => 'Neue ausstehende Anfrage';

  @override
  String newPendingRequestBody(String appName) {
    return 'Eine neue Anfrage von $appName wurde empfangen und wartet auf Ihre Genehmigung.';
  }
}
