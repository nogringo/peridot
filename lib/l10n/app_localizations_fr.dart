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
  String get noApplicationsConnected => 'Aucune application connectée';

  @override
  String get tapPlusToAddApplication =>
      'Appuyez sur + pour ajouter une application';

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
  String get invalidPrivateKey => 'Clé privée invalide';

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
  String get useTor => 'Utiliser Tor';

  @override
  String get useTorDescription =>
      'Router les connexions via le réseau Tor pour une confidentialité accrue';

  @override
  String get useTorComingSoon =>
      'Router les connexions via le réseau Tor pour une confidentialité accrue (Bientôt disponible)';

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
}
