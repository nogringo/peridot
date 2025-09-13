// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get applications => 'Aplicaciones';

  @override
  String get settings => 'Configuración';

  @override
  String get noApplicationsConnected => 'No hay aplicaciones conectadas';

  @override
  String get tapPlusToAddApplication => 'Toca + para añadir una aplicación';

  @override
  String get manageApplication => 'Gestionar Aplicación';

  @override
  String get connectedAccount => 'Cuenta conectada';

  @override
  String get permissions => 'Permisos';

  @override
  String get noPermissionsSet => 'No hay permisos establecidos';

  @override
  String removeApp(String appName) {
    return 'Eliminar $appName';
  }

  @override
  String get deleteApplication => 'Eliminar Aplicación';

  @override
  String deleteApplicationConfirm(String appName) {
    return '¿Estás seguro de que quieres eliminar \'$appName\'? Esta acción no se puede deshacer.';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get addApplication => 'Añadir Aplicación';

  @override
  String get chooseAccount => 'Elegir cuenta';

  @override
  String get nostrConnect => 'Nostr Connect';

  @override
  String get appName => 'Nombre de la aplicación';

  @override
  String get enterAppName => 'Ingresa el nombre de la aplicación';

  @override
  String get addThisApp => 'Añadir esta aplicación';

  @override
  String get requestedPermissions => 'Permisos solicitados';

  @override
  String get noSpecificPermissionsRequested =>
      'No se solicitaron permisos específicos';

  @override
  String get unknownPermission => 'Permiso Desconocido';

  @override
  String unknownPermissionMessage(String appName, String permission) {
    return 'La aplicación \'$appName\' está solicitando permiso para \'$permission\'. ¿Quieres permitirlo?';
  }

  @override
  String get allow => 'Permitir';

  @override
  String get deny => 'Denegar';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get applicationDeleted => 'Aplicación eliminada';

  @override
  String get permissionUpdated => 'Permiso actualizado';

  @override
  String get permissionRemoved => 'Permiso eliminado';

  @override
  String get permissionAdded => 'Permiso añadido';

  @override
  String permissionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count permisos',
      one: '1 permiso',
      zero: 'sin permisos',
    );
    return '$_temp0';
  }

  @override
  String get loggedAccounts => 'Cuentas conectadas';

  @override
  String get defaultBunkerRelays => 'Relés Bunker predeterminados';

  @override
  String get addRelay => 'Añadir relé';

  @override
  String get enterRelayUrl => 'Ingresa la URL del relé';

  @override
  String get addPrivateKey => 'Añadir Clave Privada';

  @override
  String get enterPrivateKey => 'Ingresa tu clave privada (nsec o hex)';

  @override
  String get invalidPrivateKey => 'Clave privada inválida';

  @override
  String get accountAddedSuccessfully => 'Cuenta añadida exitosamente';

  @override
  String get backupAccount => 'Respaldar Cuenta';

  @override
  String get showPrivateKey => 'Mostrar Clave Privada';

  @override
  String get hidePrivateKey => 'Ocultar Clave Privada';

  @override
  String get copyPrivateKey => 'Copiar Clave Privada';

  @override
  String get privateKeyCopied => 'Clave privada copiada al portapapeles';

  @override
  String get appNotFound => 'Aplicación no encontrada';

  @override
  String get allowed => 'Permitido';

  @override
  String get blocked => 'Bloqueado';

  @override
  String get permission_connect => 'Conectar';

  @override
  String get permission_get_public_key => 'Obtener Clave Pública';

  @override
  String get permission_sign_event => 'Firmar Evento';

  @override
  String get permission_ping => 'Ping';

  @override
  String get permission_get_relays => 'Obtener Relés';

  @override
  String get permission_nip04_encrypt => 'Cifrar (NIP-04)';

  @override
  String get permission_nip04_decrypt => 'Descifrar (NIP-04)';

  @override
  String get permission_nip44_encrypt => 'Cifrar (NIP-44)';

  @override
  String get permission_nip44_decrypt => 'Descifrar (NIP-44)';

  @override
  String get permissionRequested => 'Permiso Solicitado';

  @override
  String appRequestingPermission(String appName) {
    return '$appName está solicitando permiso:';
  }

  @override
  String get authorizeOrBlockRequest =>
      '¿Desea autorizar o bloquear esta solicitud?';

  @override
  String get block => 'Bloquear';

  @override
  String get authorize => 'Autorizar';

  @override
  String get removeAccount => 'Eliminar Cuenta';

  @override
  String get removeAccountConfirm =>
      '¿Estás seguro de que quieres eliminar esta cuenta? Esta acción no se puede deshacer.';

  @override
  String get remove => 'Eliminar';

  @override
  String get copyNpub => 'Copiar npub';

  @override
  String get addAnAccount => 'Añadir una cuenta';
}
