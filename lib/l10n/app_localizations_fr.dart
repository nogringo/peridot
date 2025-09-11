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
  String unknownPermissionMessage(String appName, String permission) {
    return 'L\'application \'$appName\' demande la permission pour \'$permission\'. Voulez-vous l\'autoriser ?';
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
}
