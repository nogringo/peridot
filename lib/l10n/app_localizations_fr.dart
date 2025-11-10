// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get applications => 'Applications';

  @override
  String get settings => 'Paramètres';

  @override
  String get requests => 'Demandes';

  @override
  String get unnamedApp => 'Application sans nom';

  @override
  String get noApplicationsConnected => 'Aucune application connectée';

  @override
  String get tapPlusToAddApplication =>
      'Appuyez sur + pour ajouter une application';

  @override
  String get noRequests => 'Aucune demande';

  @override
  String get whenYouReceiveRequests =>
      'Lorsque vous recevrez de nouvelles demandes, elles apparaîtront ici.';

  @override
  String get pending => 'En attente';

  @override
  String get manageApplication => 'Gérer l\'Application';

  @override
  String get connectedAccount => 'Compte connecté';

  @override
  String get permissions => 'Permissions';

  @override
  String get noPermissionsSet => 'Aucune permission définie';

  @override
  String removeApp(String appName) {
    return 'Supprimer $appName';
  }

  @override
  String get deleteApplication => 'Supprimer l\'Application';

  @override
  String deleteApplicationConfirm(String appName) {
    return 'Êtes-vous sûr de vouloir supprimer \'$appName\' ? Cette action ne peut pas être annulée.';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get addApplication => 'Ajouter une Application';

  @override
  String get chooseAccount => 'Choisir un compte';

  @override
  String get nostrConnect => 'Nostr Connect';

  @override
  String get appName => 'Nom de l\'application';

  @override
  String get enterAppName => 'Entrez le nom de l\'application';

  @override
  String get addThisApp => 'Ajouter cette application';

  @override
  String get requestedPermissions => 'Permissions demandées';

  @override
  String get noSpecificPermissionsRequested =>
      'Aucune permission spécifique demandée';

  @override
  String get unknownPermission => 'Permission Inconnue';

  @override
  String unknownPermissionMessage(
    String appName,
    String permission,
    String userName,
  ) {
    return 'L\'application \'$appName\' demande la permission pour \'$permission\' au nom de l\'utilisateur \'$userName\'. Voulez-vous l\'autoriser ?';
  }

  @override
  String get allow => 'Autoriser';

  @override
  String get deny => 'Refuser';

  @override
  String get copied => 'Copié';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get applicationDeleted => 'Application supprimée';

  @override
  String get permissionUpdated => 'Permission mise à jour';

  @override
  String get permissionRemoved => 'Permission supprimée';

  @override
  String get permissionAdded => 'Permission ajoutée';

  @override
  String permissionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count permissions',
      one: '1 permission',
      zero: 'aucune permission',
    );
    return '$_temp0';
  }

  @override
  String get loggedAccounts => 'Comptes connectés';

  @override
  String get defaultBunkerRelays => 'Relais Bunker par défaut';

  @override
  String get addRelay => 'Ajouter un relais';

  @override
  String get enterRelayUrl => 'Entrez l\'URL du relais';

  @override
  String get addPrivateKey => 'Ajouter une Clé Privée';

  @override
  String get enterPrivateKey => 'Entrez votre clé privée (nsec ou hex)';

  @override
  String get accountAddedSuccessfully => 'Compte ajouté avec succès';

  @override
  String get backupAccount => 'Sauvegarder le Compte';

  @override
  String get showPrivateKey => 'Afficher la Clé Privée';

  @override
  String get hidePrivateKey => 'Masquer la Clé Privée';

  @override
  String get copyPrivateKey => 'Copier la Clé Privée';

  @override
  String get privateKeyCopied => 'Clé privée copiée dans le presse-papiers';

  @override
  String get appNotFound => 'Application non trouvée';

  @override
  String get allowed => 'Autorisé';

  @override
  String get blocked => 'Bloqué';

  @override
  String get permission_connect => 'Connecter';

  @override
  String get permission_get_public_key => 'Obtenir la Clé Publique';

  @override
  String get permission_sign_event => 'Signer l\'Événement';

  @override
  String get permission_ping => 'Ping';

  @override
  String get permission_get_relays => 'Obtenir les Relais';

  @override
  String get permission_nip04_encrypt => 'Chiffrer (NIP-04)';

  @override
  String get permission_nip04_decrypt => 'Déchiffrer (NIP-04)';

  @override
  String get permission_nip44_encrypt => 'Chiffrer (NIP-44)';

  @override
  String get permission_nip44_decrypt => 'Déchiffrer (NIP-44)';

  @override
  String get permissionRequested => 'Permission Demandée';

  @override
  String appRequestingPermission(String appName) {
    return '$appName demande une permission :';
  }

  @override
  String get authorizeOrBlockRequest =>
      'Voulez-vous autoriser ou bloquer cette demande ?';

  @override
  String get block => 'Bloquer';

  @override
  String get reject => 'Rejeter';

  @override
  String get authorize => 'Autoriser';

  @override
  String get removeAccount => 'Supprimer le Compte';

  @override
  String get removeAccountConfirm =>
      'Êtes-vous sûr de vouloir supprimer ce compte ? Cette action ne peut pas être annulée.';

  @override
  String get remove => 'Supprimer';

  @override
  String get copyNpub => 'Copier npub';

  @override
  String get addAnAccount => 'Ajouter un compte';

  @override
  String get removeRelay => 'Supprimer le Relais';

  @override
  String removeRelayConfirm(String relay) {
    return 'Êtes-vous sûr de vouloir supprimer ce relais ?\n$relay';
  }

  @override
  String get relayRemoved => 'Relais supprimé';

  @override
  String get cannotRemoveLastRelay =>
      'Impossible de supprimer le dernier relais';

  @override
  String get cannotRemoveLastRelayMessage =>
      'Vous devez avoir au moins un relais. Veuillez ajouter un autre relais avant de supprimer celui-ci.';

  @override
  String get ok => 'OK';

  @override
  String get systemSettings => 'Paramètres système';

  @override
  String get startOnSystemStartup => 'Démarrer avec le système';

  @override
  String get startOnSystemStartupDescription =>
      'Lancer Peridot automatiquement au démarrage de votre ordinateur';

  @override
  String get desktopNotifications => 'Notifications de bureau';

  @override
  String get desktopNotificationsDescription =>
      'Afficher les notifications de bureau pour les demandes de permission';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsDescription =>
      'Afficher les notifications pour les demandes de permission';

  @override
  String get useTor => 'Utiliser Tor';

  @override
  String get useTorDescription =>
      'Router les connexions via le réseau Tor pour une confidentialité accrue';

  @override
  String get useTorComingSoon =>
      'Router les connexions via le réseau Tor pour une confidentialité accrue (Bientôt disponible)';

  @override
  String get removeClientTag => 'Supprimer la balise client';

  @override
  String get removeClientTagDescription =>
      'Supprimer automatiquement la balise client des événements avant la signature pour cette application';

  @override
  String get continueButton => 'Continuer';

  @override
  String get bunkerUrlCopiedSuccessfully => 'URL Bunker copiée avec succès';

  @override
  String get addAnApp => 'Ajouter une application';

  @override
  String get chooseTheAccount => 'Choisir le compte';

  @override
  String get connectAnApp => 'Connecter une application';

  @override
  String get addThisAppQuestion => 'Ajouter cette application ?';

  @override
  String get connect => 'Connecter';

  @override
  String get connectWithBunkerUrl => 'Se connecter avec l\'URL Bunker';

  @override
  String get copyBunkerUrl => 'Copier l\'URL Bunker';

  @override
  String get nostrConnectUrlHint => 'nostrconnect://';

  @override
  String get publicKeyCopiedSuccessfully => 'Clé publique copiée avec succès';

  @override
  String get pleaseEnterPassword => 'Veuillez entrer un mot de passe';

  @override
  String get encryptedBackupCopied => 'Sauvegarde chiffrée copiée';

  @override
  String get backupFailed => 'Échec de la sauvegarde';

  @override
  String get privateKeyCopiedToClipboard => 'Clé privée copiée';

  @override
  String get copyFailed => 'Échec de la copie';

  @override
  String get backupThisAccount => 'Sauvegarder ce compte';

  @override
  String get noAccountSelected => 'Aucun compte sélectionné';

  @override
  String get recommended => 'Recommandé';

  @override
  String get notRecommended => 'Non recommandé';

  @override
  String get password => 'Mot de passe';

  @override
  String get copyEncryptedVersion => 'Copier la version chiffrée';

  @override
  String get copyUnencryptedVersion => 'Copier la version non chiffrée';

  @override
  String get yourPassword => 'Votre mot de passe';

  @override
  String get createOne => 'En créer une';

  @override
  String get create => 'Créer';

  @override
  String get or => 'OU';

  @override
  String get importOne => 'En importer une';

  @override
  String get nsecNcryptsecOrHex => 'Nsec, ncryptsec ou hex';

  @override
  String get ncryptsecPassword => 'Mot de passe ncryptsec';

  @override
  String get importKey => 'Importer la clé';

  @override
  String get backupSecurelyWithPassword =>
      'Sauvegarder ce compte de manière sécurisée avec un mot de passe';

  @override
  String get backupInsecurelyWithoutPassword =>
      'Sauvegarder ce compte de manière non sécurisée sans mot de passe';

  @override
  String get connectWithNostrConnectUrl =>
      'Se connecter avec l\'URL Nostr connect';

  @override
  String get decryptionFailed =>
      'Désolé, nous n\'avons pas pu déchiffrer votre clé privée avec ce mot de passe.';

  @override
  String get invalidPrivateKey =>
      'Désolé, il semble que cette clé privée soit invalide.';

  @override
  String get userMetadata => 'Métadonnées Utilisateur';

  @override
  String get shortTextNote => 'Note de Texte Courte';

  @override
  String get recommendRelay => 'Recommander un Relais';

  @override
  String get follows => 'Abonnements';

  @override
  String get encryptedDirectMessages => 'Messages Directs Chiffrés';

  @override
  String get eventDeletionRequest => 'Demande de Suppression d\'Événement';

  @override
  String get repost => 'Repost';

  @override
  String get reaction => 'Réaction';

  @override
  String get badgeAward => 'Attribution de Badge';

  @override
  String get chatMessage => 'Message de Chat';

  @override
  String get groupChatThreadedReply =>
      'Réponse de Discussion de Chat de Groupe';

  @override
  String get thread => 'Fil de Discussion';

  @override
  String get groupThreadReply => 'Réponse au Fil de Groupe';

  @override
  String get seal => 'Sceau';

  @override
  String get directMessage => 'Message Direct';

  @override
  String get fileMessage => 'Message de Fichier';

  @override
  String get genericRepost => 'Repost Générique';

  @override
  String get reactionToWebsite => 'Réaction à un site web';

  @override
  String get picture => 'Image';

  @override
  String get videoEvent => 'Événement Vidéo';

  @override
  String get shortFormPortraitVideoEvent => 'Événement Vidéo Portrait Courte';

  @override
  String get internalReference => 'Référence interne';

  @override
  String get externalReference => 'Référence externe';

  @override
  String get hardcopyReference => 'Référence de copie papier';

  @override
  String get promptReference => 'Référence de prompt';

  @override
  String get channelCreation => 'Création de Canal';

  @override
  String get channelMetadata => 'Métadonnées de Canal';

  @override
  String get channelMessage => 'Message de Canal';

  @override
  String get channelHideMessage => 'Masquer Message de Canal';

  @override
  String get channelMuteUser => 'Mettre en Sourdine Utilisateur du Canal';

  @override
  String get requestToVanish => 'Demande de Disparition';

  @override
  String get chessPgn => 'Échecs (PGN)';

  @override
  String get mlsKeyPackage => 'Package de Clés MLS';

  @override
  String get mlsWelcome => 'Bienvenue MLS';

  @override
  String get mlsGroupEvent => 'Événement de Groupe MLS';

  @override
  String get mergeRequests => 'Demandes de Fusion';

  @override
  String get pollResponse => 'Réponse au Sondage';

  @override
  String get marketplaceBid => 'Offre de Marché';

  @override
  String get marketplaceBidConfirmation => 'Confirmation d\'Offre de Marché';

  @override
  String get openTimestamps => 'OpenTimestamps';

  @override
  String get giftWrap => 'Emballage Cadeau';

  @override
  String get fileMetadata => 'Métadonnées de Fichier';

  @override
  String get poll => 'Sondage';

  @override
  String get comment => 'Commentaire';

  @override
  String get voiceMessage => 'Message Vocal';

  @override
  String get voiceMessageComment => 'Commentaire de Message Vocal';

  @override
  String get liveChatMessage => 'Message de Chat en Direct';

  @override
  String get codeSnippet => 'Fragment de Code';

  @override
  String get gitPatch => 'Patch Git';

  @override
  String get gitPullRequest => 'Pull Request Git';

  @override
  String get gitStatusUpdate => 'Mise à jour du Statut Git';

  @override
  String get gitIssue => 'Problème Git';

  @override
  String get gitIssueUpdate => 'Mise à jour de Problème Git';

  @override
  String get status => 'Statut';

  @override
  String get statusUpdate => 'Mise à jour du Statut';

  @override
  String get statusDelete => 'Supprimer le Statut';

  @override
  String get statusReply => 'Réponse au Statut';

  @override
  String get problemTracker => 'Suivi de Problèmes';

  @override
  String get reporting => 'Signalement';

  @override
  String get label => 'Étiquette';

  @override
  String get relayReviews => 'Avis sur les relais';

  @override
  String get aiEmbeddings => 'Embeddings IA / Listes de vecteurs';

  @override
  String get torrent => 'Torrent';

  @override
  String get torrentComment => 'Commentaire de Torrent';

  @override
  String get coinjoinPool => 'Pool Coinjoin';

  @override
  String get communityPostApproval =>
      'Approbation de Publication de Communauté';

  @override
  String get jobRequest => 'Demande de Travail';

  @override
  String get jobResult => 'Résultat de Travail';

  @override
  String get jobFeedback => 'Retour de Travail';

  @override
  String get cashuWalletToken => 'Token de Portefeuille Cashu';

  @override
  String get cashuWalletProofs => 'Preuves de Portefeuille Cashu';

  @override
  String get cashuWalletHistory => 'Historique de Portefeuille Cashu';

  @override
  String get geocacheCreate => 'Créer Géocache';

  @override
  String get geocacheUpdate => 'Mettre à jour Géocache';

  @override
  String get groupControlEvent => 'Événement de Contrôle de Groupe';

  @override
  String get zapGoal => 'Objectif de Zap';

  @override
  String get nutzap => 'Nutzap';

  @override
  String get tidalLogin => 'Connexion Tidal';

  @override
  String get zapRequest => 'Demande de Zap';

  @override
  String get zap => 'Zap';

  @override
  String get highlights => 'Surlignages';

  @override
  String get muteList => 'Liste de Sourdine';

  @override
  String get pinList => 'Liste d\'Épingles';

  @override
  String get relayListMetadata => 'Métadonnées de Liste de Relais';

  @override
  String get bookmarkList => 'Liste de Favoris';

  @override
  String get communitiesList => 'Liste de Communautés';

  @override
  String get publicChatsList => 'Liste de Chats Publics';

  @override
  String get blockedRelaysList => 'Liste de Relais Bloqués';

  @override
  String get searchRelaysList => 'Liste de Relais de Recherche';

  @override
  String get userGroups => 'Groupes d\'Utilisateur';

  @override
  String get favoritesList => 'Liste de Favoris';

  @override
  String get privateEventsList => 'Liste d\'Événements Privés';

  @override
  String get interestsList => 'Liste d\'Intérêts';

  @override
  String get mediaFollowsList => 'Liste d\'Abonnements Médias';

  @override
  String get peopleFollowsList => 'Liste d\'Abonnements Personnes';

  @override
  String get userEmojiList => 'Liste d\'Emojis Utilisateur';

  @override
  String get dmRelayList => 'Liste de Relais MD';

  @override
  String get keyPackageRelayList => 'Liste de Relais de Package de Clés';

  @override
  String get userServerList => 'Liste de Serveurs Utilisateur';

  @override
  String get fileStorageServerList =>
      'Liste de Serveurs de Stockage de Fichiers';

  @override
  String get relayMonitorAnnouncement => 'Annonce de Moniteur de Relais';

  @override
  String get roomPresence => 'Présence dans la Salle';

  @override
  String get proxyAnnouncement => 'Annonce de Proxy';

  @override
  String get transportMethodAnnouncement => 'Annonce de Méthode de Transport';

  @override
  String get walletInfo => 'Informations de Portefeuille';

  @override
  String get cashuWalletEvent => 'Événement de Portefeuille Cashu';

  @override
  String get lightningPubRpc => 'Lightning Pub RPC';

  @override
  String get clientAuthentication => 'Authentification Client';

  @override
  String get walletRequest => 'Demande de Portefeuille';

  @override
  String get walletResponse => 'Réponse de Portefeuille';

  @override
  String get nostrConnectEvent => 'Nostr Connect';

  @override
  String get blobsStoredOnMediaservers => 'Blobs stockés sur serveurs médias';

  @override
  String get httpAuth => 'Authentification HTTP';

  @override
  String get categorizedPeopleList => 'Liste de Personnes Catégorisées';

  @override
  String get categorizedBookmarkList => 'Liste de Favoris Catégorisés';

  @override
  String get categorizedRelayList => 'Liste de Relais Catégorisés';

  @override
  String get bookmarkSets => 'Ensembles de Favoris';

  @override
  String get curationSets => 'Ensembles de Curation';

  @override
  String get videoSets => 'Ensembles de Vidéos';

  @override
  String get kindMuteSets => 'Ensembles de Sourdine par Type';

  @override
  String get profileBadges => 'Badges de Profil';

  @override
  String get badgeDefinition => 'Définition de Badge';

  @override
  String get interestSets => 'Ensembles d\'Intérêts';

  @override
  String get createOrUpdateStall => 'Créer ou Mettre à jour Stand';

  @override
  String get createOrUpdateProduct => 'Créer ou Mettre à jour Produit';

  @override
  String get marketplaceUiUx => 'UI/UX de Marché';

  @override
  String get productSoldAsAuction => 'Produit Vendu aux Enchères';

  @override
  String get longFormContent => 'Contenu de Forme Longue';

  @override
  String get draftLongFormContent => 'Brouillon de Contenu de Forme Longue';

  @override
  String get emojiSets => 'Ensembles d\'Emojis';

  @override
  String get curatedPublicationItem => 'Article de Publication Curé';

  @override
  String get curatedPublicationDraft => 'Brouillon de Publication Curée';

  @override
  String get releaseArtifactSets => 'Ensembles d\'Artefacts de Version';

  @override
  String get applicationSpecificData => 'Données Spécifiques à l\'Application';

  @override
  String get relayDiscovery => 'Découverte de Relais';

  @override
  String get appCurationSets => 'Ensembles de Curation d\'Applications';

  @override
  String get liveEvent => 'Événement en Direct';

  @override
  String get userStatus => 'Statut Utilisateur';

  @override
  String get slideSet => 'Ensemble de Diapositives';

  @override
  String get classifiedListing => 'Annonce Classée';

  @override
  String get draftClassifiedListing => 'Brouillon d\'Annonce Classée';

  @override
  String get repositoryAnnouncement => 'Annonce de Dépôt';

  @override
  String get repositoryStateAnnouncement => 'Annonce d\'État de Dépôt';

  @override
  String get wikiArticle => 'Article Wiki';

  @override
  String get redirects => 'Redirections';

  @override
  String get draftEvent => 'Brouillon d\'Événement';

  @override
  String get linkSet => 'Ensemble de Liens';

  @override
  String get feed => 'Flux';

  @override
  String get dateBasedCalendarEvent =>
      'Événement de Calendrier Basé sur la Date';

  @override
  String get timeBasedCalendarEvent =>
      'Événement de Calendrier Basé sur l\'Heure';

  @override
  String get calendar => 'Calendrier';

  @override
  String get calendarEventRsvp => 'RSVP d\'Événement de Calendrier';

  @override
  String get handlerRecommendation => 'Recommandation de Gestionnaire';

  @override
  String get handlerInformation => 'Informations de Gestionnaire';

  @override
  String get softwareApplication => 'Application Logicielle';

  @override
  String get communityDefinition => 'Définition de Communauté';

  @override
  String get geocacheListing => 'Liste de Géocache';

  @override
  String get mintAnnouncement => 'Annonce de Mint';

  @override
  String get mintQuote => 'Citation de Mint';

  @override
  String get peerToPeerOrder => 'Commande de Pair à Pair';

  @override
  String get groupMetadata => 'Métadonnées de Groupe';

  @override
  String get groupAdminMetadata => 'Métadonnées d\'Administrateur de Groupe';

  @override
  String get groupMemberMetadata => 'Métadonnées de Membre de Groupe';

  @override
  String get groupAdminsList => 'Liste d\'Administrateurs de Groupe';

  @override
  String get groupMembersList => 'Liste de Membres de Groupe';

  @override
  String get groupRoles => 'Rôles de Groupe';

  @override
  String get groupPermissions => 'Permissions de Groupe';

  @override
  String get groupChatMessage => 'Message de Chat de Groupe';

  @override
  String get groupChatThread => 'Fil de Chat de Groupe';

  @override
  String get groupPinned => 'Épinglés de Groupe';

  @override
  String get starterPacks => 'Packs de Démarrage';

  @override
  String get mediaStarterPacks => 'Packs de Démarrage Médias';

  @override
  String get webBookmarks => 'Favoris Web';

  @override
  String get videoView => 'Vue vidéo';

  @override
  String unknownEventKind(int kind) {
    return 'Type d\'Événement $kind';
  }

  @override
  String get selectAccountToUse => 'Sélectionnez le compte à utiliser';

  @override
  String get use => 'Utiliser';

  @override
  String get alwaysAskPermission => 'Toujours demander la permission';

  @override
  String get alwaysAskPermissionDescription =>
      'Pour chaque requête de l\'application, vous choisirez quoi faire';

  @override
  String get allowCommonActions => 'Autoriser les actions courantes';

  @override
  String get allowCommonActionsDescription =>
      'Les requêtes courantes sont automatiquement traitées, vous choisirez quoi faire avec les autres';

  @override
  String get fullyTrust => 'Confiance totale';

  @override
  String get fullyTrustDescription =>
      'Toutes les requêtes sont automatiquement traitées';

  @override
  String get enableThisApp => 'Activer cette application';

  @override
  String get enableThisAppDescription =>
      'Lorsque désactivée, toutes les requêtes sont bloquées';

  @override
  String get appConfiguration => 'Configuration de l\'application';

  @override
  String get finish => 'Terminer';

  @override
  String get trustLevel => 'Niveau de confiance';

  @override
  String get deletedApp => 'Application supprimée';

  @override
  String get deprecatedEncryptionWarning =>
      'Cette requête utilise un chiffrement obsolète';

  @override
  String get deprecatedEncryptionWarningMessage =>
      'Veuillez contacter et informer le développeur de l\'application';

  @override
  String get metadataLeakWarning => 'Cette requête fuit des métadonnées';

  @override
  String get metadataLeakWarningMessage =>
      'Les gens peuvent savoir que vous utilisez un bunker et quand vous l\'utilisez. Veuillez contacter et informer le développeur de l\'application';

  @override
  String get params => 'Paramètres';

  @override
  String get allowOnce => 'Autoriser une fois';

  @override
  String get rejectOnce => 'Rejeter une fois';

  @override
  String get allowForever => 'Autoriser pour toujours';

  @override
  String get rejectForever => 'Rejeter pour toujours';

  @override
  String processedRequestsCount(int count) {
    return '$count Requêtes traitées';
  }

  @override
  String blockedRequestsCount(int count) {
    return '$count Requêtes bloquées';
  }

  @override
  String get deleteAll => 'Tout supprimer';

  @override
  String get newPendingRequest => 'Nouvelle requête en attente';

  @override
  String newPendingRequestBody(String appName) {
    return 'Une nouvelle requête de $appName a été reçue et attend votre approbation.';
  }
}
