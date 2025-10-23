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
  String unknownPermissionMessage(
    String appName,
    String permission,
    String userName,
  ) {
    return 'La aplicación \'$appName\' está solicitando permiso para \'$permission\' en nombre del usuario \'$userName\'. ¿Quieres permitirlo?';
  }

  @override
  String get allow => 'Permitir';

  @override
  String get deny => 'Denegar';

  @override
  String get copied => 'Copiado';

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
  String get invalidPrivateKey =>
      'Lo sentimos, parece que esa clave privada no es válida.';

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
  String get reject => 'Rechazar';

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

  @override
  String get removeRelay => 'Eliminar Relé';

  @override
  String removeRelayConfirm(String relay) {
    return '¿Estás seguro de que quieres eliminar este relé?\n$relay';
  }

  @override
  String get relayRemoved => 'Relé eliminado';

  @override
  String get cannotRemoveLastRelay => 'No se puede eliminar el último relé';

  @override
  String get cannotRemoveLastRelayMessage =>
      'Debes tener al menos un relé. Por favor, añade otro relé antes de eliminar este.';

  @override
  String get ok => 'OK';

  @override
  String get systemSettings => 'Configuración del sistema';

  @override
  String get startOnSystemStartup => 'Iniciar con el sistema';

  @override
  String get startOnSystemStartupDescription =>
      'Ejecutar Peridot automáticamente cuando se inicie tu computadora';

  @override
  String get desktopNotifications => 'Notificaciones de escritorio';

  @override
  String get desktopNotificationsDescription =>
      'Mostrar notificaciones de escritorio para solicitudes de permisos';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notificationsDescription =>
      'Mostrar notificaciones para solicitudes de permisos';

  @override
  String get useTor => 'Usar Tor';

  @override
  String get useTorDescription =>
      'Enrutar conexiones a través de la red Tor para mayor privacidad';

  @override
  String get useTorComingSoon =>
      'Enrutar conexiones a través de la red Tor para mayor privacidad (Próximamente)';

  @override
  String get continueButton => 'Continuar';

  @override
  String get bunkerUrlCopiedSuccessfully => 'URL Bunker copiada exitosamente';

  @override
  String get addAnApp => 'Añadir una aplicación';

  @override
  String get chooseTheAccount => 'Elegir la cuenta';

  @override
  String get connectAnApp => 'Conectar una aplicación';

  @override
  String get addThisAppQuestion => '¿Añadir esta aplicación?';

  @override
  String get connect => 'Conectar';

  @override
  String get connectWithBunkerUrl => 'Conectar con URL Bunker';

  @override
  String get copyBunkerUrl => 'Copiar URL Bunker';

  @override
  String get nostrConnectUrlHint => 'nostrconnect://';

  @override
  String get publicKeyCopiedSuccessfully =>
      'Clave pública copiada exitosamente';

  @override
  String get pleaseEnterPassword => 'Por favor ingresa una contraseña';

  @override
  String get encryptedBackupCopied => 'Copia de seguridad cifrada copiada';

  @override
  String get backupFailed => 'Copia de seguridad fallida';

  @override
  String get privateKeyCopiedToClipboard => 'Clave privada copiada';

  @override
  String get copyFailed => 'Error al copiar';

  @override
  String get backupThisAccount => 'Respaldar esta cuenta';

  @override
  String get noAccountSelected => 'No hay cuenta seleccionada';

  @override
  String get recommended => 'Recomendado';

  @override
  String get notRecommended => 'No recomendado';

  @override
  String get password => 'Contraseña';

  @override
  String get copyEncryptedVersion => 'Copiar versión cifrada';

  @override
  String get copyUnencryptedVersion => 'Copiar versión sin cifrar';

  @override
  String get yourPassword => 'Tu contraseña';

  @override
  String get createOne => 'Crear una';

  @override
  String get create => 'Crear';

  @override
  String get or => 'O';

  @override
  String get importOne => 'Importar una';

  @override
  String get nsecNcryptsecOrHex => 'Nsec, ncryptsec o hex';

  @override
  String get ncryptsecPassword => 'Contraseña ncryptsec';

  @override
  String get importKey => 'Importar Clave';

  @override
  String get backupSecurelyWithPassword =>
      'Respaldar esta cuenta de forma segura con una contraseña';

  @override
  String get backupInsecurelyWithoutPassword =>
      'Respaldar esta cuenta de forma insegura sin contraseña';

  @override
  String get connectWithNostrConnectUrl => 'Conectar con URL de Nostr connect';

  @override
  String get decryptionFailed =>
      'Lo sentimos, no pudimos descifrar tu clave privada con esa contraseña.';

  @override
  String get userMetadata => 'Metadatos de Usuario';

  @override
  String get shortTextNote => 'Nota de Texto Corta';

  @override
  String get recommendRelay => 'Recomendar Relé';

  @override
  String get follows => 'Seguidos';

  @override
  String get encryptedDirectMessages => 'Mensajes Directos Cifrados';

  @override
  String get eventDeletionRequest => 'Solicitud de Eliminación de Evento';

  @override
  String get repost => 'Repost';

  @override
  String get reaction => 'Reacción';

  @override
  String get badgeAward => 'Otorgamiento de Insignia';

  @override
  String get chatMessage => 'Mensaje de Chat';

  @override
  String get groupChatThreadedReply => 'Respuesta en Hilo de Chat Grupal';

  @override
  String get thread => 'Hilo';

  @override
  String get groupThreadReply => 'Respuesta en Hilo Grupal';

  @override
  String get seal => 'Sello';

  @override
  String get directMessage => 'Mensaje Directo';

  @override
  String get fileMessage => 'Mensaje de Archivo';

  @override
  String get genericRepost => 'Repost Genérico';

  @override
  String get reactionToWebsite => 'Reacción a un sitio web';

  @override
  String get picture => 'Imagen';

  @override
  String get videoEvent => 'Evento de Video';

  @override
  String get shortFormPortraitVideoEvent => 'Evento de Video Vertical Corto';

  @override
  String get internalReference => 'Referencia interna';

  @override
  String get externalReference => 'Referencia externa';

  @override
  String get hardcopyReference => 'Referencia de copia impresa';

  @override
  String get promptReference => 'Referencia de prompt';

  @override
  String get channelCreation => 'Creación de Canal';

  @override
  String get channelMetadata => 'Metadatos de Canal';

  @override
  String get channelMessage => 'Mensaje de Canal';

  @override
  String get channelHideMessage => 'Ocultar Mensaje de Canal';

  @override
  String get channelMuteUser => 'Silenciar Usuario del Canal';

  @override
  String get requestToVanish => 'Solicitud para Desaparecer';

  @override
  String get chessPgn => 'Ajedrez (PGN)';

  @override
  String get mlsKeyPackage => 'Paquete de Claves MLS';

  @override
  String get mlsWelcome => 'Bienvenida MLS';

  @override
  String get mlsGroupEvent => 'Evento de Grupo MLS';

  @override
  String get mergeRequests => 'Solicitudes de Fusión';

  @override
  String get pollResponse => 'Respuesta de Encuesta';

  @override
  String get marketplaceBid => 'Oferta de Mercado';

  @override
  String get marketplaceBidConfirmation => 'Confirmación de Oferta de Mercado';

  @override
  String get openTimestamps => 'OpenTimestamps';

  @override
  String get giftWrap => 'Envoltorio de Regalo';

  @override
  String get fileMetadata => 'Metadatos de Archivo';

  @override
  String get poll => 'Encuesta';

  @override
  String get comment => 'Comentario';

  @override
  String get voiceMessage => 'Mensaje de Voz';

  @override
  String get voiceMessageComment => 'Comentario de Mensaje de Voz';

  @override
  String get liveChatMessage => 'Mensaje de Chat en Vivo';

  @override
  String get codeSnippet => 'Fragmento de Código';

  @override
  String get gitPatch => 'Parche Git';

  @override
  String get gitPullRequest => 'Solicitud de Extracción Git';

  @override
  String get gitStatusUpdate => 'Actualización de Estado Git';

  @override
  String get gitIssue => 'Problema Git';

  @override
  String get gitIssueUpdate => 'Actualización de Problema Git';

  @override
  String get status => 'Estado';

  @override
  String get statusUpdate => 'Actualización de Estado';

  @override
  String get statusDelete => 'Eliminar Estado';

  @override
  String get statusReply => 'Respuesta de Estado';

  @override
  String get problemTracker => 'Rastreador de Problemas';

  @override
  String get reporting => 'Reportar';

  @override
  String get label => 'Etiqueta';

  @override
  String get relayReviews => 'Reseñas de relés';

  @override
  String get aiEmbeddings => 'Incrustaciones de IA / Listas de vectores';

  @override
  String get torrent => 'Torrent';

  @override
  String get torrentComment => 'Comentario de Torrent';

  @override
  String get coinjoinPool => 'Pool Coinjoin';

  @override
  String get communityPostApproval => 'Aprobación de Publicación de Comunidad';

  @override
  String get jobRequest => 'Solicitud de Trabajo';

  @override
  String get jobResult => 'Resultado de Trabajo';

  @override
  String get jobFeedback => 'Retroalimentación de Trabajo';

  @override
  String get cashuWalletToken => 'Token de Cartera Cashu';

  @override
  String get cashuWalletProofs => 'Pruebas de Cartera Cashu';

  @override
  String get cashuWalletHistory => 'Historial de Cartera Cashu';

  @override
  String get geocacheCreate => 'Crear Geocaché';

  @override
  String get geocacheUpdate => 'Actualizar Geocaché';

  @override
  String get groupControlEvent => 'Evento de Control de Grupo';

  @override
  String get zapGoal => 'Meta de Zap';

  @override
  String get nutzap => 'Nutzap';

  @override
  String get tidalLogin => 'Inicio de sesión Tidal';

  @override
  String get zapRequest => 'Solicitud de Zap';

  @override
  String get zap => 'Zap';

  @override
  String get highlights => 'Destacados';

  @override
  String get muteList => 'Lista de Silenciados';

  @override
  String get pinList => 'Lista de Fijados';

  @override
  String get relayListMetadata => 'Metadatos de Lista de Relés';

  @override
  String get bookmarkList => 'Lista de Marcadores';

  @override
  String get communitiesList => 'Lista de Comunidades';

  @override
  String get publicChatsList => 'Lista de Chats Públicos';

  @override
  String get blockedRelaysList => 'Lista de Relés Bloqueados';

  @override
  String get searchRelaysList => 'Lista de Relés de Búsqueda';

  @override
  String get userGroups => 'Grupos de Usuario';

  @override
  String get favoritesList => 'Lista de Favoritos';

  @override
  String get privateEventsList => 'Lista de Eventos Privados';

  @override
  String get interestsList => 'Lista de Intereses';

  @override
  String get mediaFollowsList => 'Lista de Seguidos de Medios';

  @override
  String get peopleFollowsList => 'Lista de Seguidos de Personas';

  @override
  String get userEmojiList => 'Lista de Emojis de Usuario';

  @override
  String get dmRelayList => 'Lista de Relés de MD';

  @override
  String get keyPackageRelayList => 'Lista de Relés de Paquete de Claves';

  @override
  String get userServerList => 'Lista de Servidores de Usuario';

  @override
  String get fileStorageServerList =>
      'Lista de Servidores de Almacenamiento de Archivos';

  @override
  String get relayMonitorAnnouncement => 'Anuncio de Monitor de Relé';

  @override
  String get roomPresence => 'Presencia en Sala';

  @override
  String get proxyAnnouncement => 'Anuncio de Proxy';

  @override
  String get transportMethodAnnouncement => 'Anuncio de Método de Transporte';

  @override
  String get walletInfo => 'Información de Cartera';

  @override
  String get cashuWalletEvent => 'Evento de Cartera Cashu';

  @override
  String get lightningPubRpc => 'Lightning Pub RPC';

  @override
  String get clientAuthentication => 'Autenticación de Cliente';

  @override
  String get walletRequest => 'Solicitud de Cartera';

  @override
  String get walletResponse => 'Respuesta de Cartera';

  @override
  String get nostrConnectEvent => 'Nostr Connect';

  @override
  String get blobsStoredOnMediaservers =>
      'Blobs almacenados en servidores de medios';

  @override
  String get httpAuth => 'Autenticación HTTP';

  @override
  String get categorizedPeopleList => 'Lista de Personas Categorizadas';

  @override
  String get categorizedBookmarkList => 'Lista de Marcadores Categorizados';

  @override
  String get categorizedRelayList => 'Lista de Relés Categorizados';

  @override
  String get bookmarkSets => 'Conjuntos de Marcadores';

  @override
  String get curationSets => 'Conjuntos de Curación';

  @override
  String get videoSets => 'Conjuntos de Videos';

  @override
  String get kindMuteSets => 'Conjuntos de Silencio por Tipo';

  @override
  String get profileBadges => 'Insignias de Perfil';

  @override
  String get badgeDefinition => 'Definición de Insignia';

  @override
  String get interestSets => 'Conjuntos de Intereses';

  @override
  String get createOrUpdateStall => 'Crear o Actualizar Puesto';

  @override
  String get createOrUpdateProduct => 'Crear o Actualizar Producto';

  @override
  String get marketplaceUiUx => 'UI/UX de Mercado';

  @override
  String get productSoldAsAuction => 'Producto Vendido como Subasta';

  @override
  String get longFormContent => 'Contenido de Forma Larga';

  @override
  String get draftLongFormContent => 'Borrador de Contenido de Forma Larga';

  @override
  String get emojiSets => 'Conjuntos de Emojis';

  @override
  String get curatedPublicationItem => 'Artículo de Publicación Curada';

  @override
  String get curatedPublicationDraft => 'Borrador de Publicación Curada';

  @override
  String get releaseArtifactSets => 'Conjuntos de Artefactos de Lanzamiento';

  @override
  String get applicationSpecificData => 'Datos Específicos de Aplicación';

  @override
  String get relayDiscovery => 'Descubrimiento de Relés';

  @override
  String get appCurationSets => 'Conjuntos de Curación de Aplicaciones';

  @override
  String get liveEvent => 'Evento en Vivo';

  @override
  String get userStatus => 'Estado de Usuario';

  @override
  String get slideSet => 'Conjunto de Diapositivas';

  @override
  String get classifiedListing => 'Anuncio Clasificado';

  @override
  String get draftClassifiedListing => 'Borrador de Anuncio Clasificado';

  @override
  String get repositoryAnnouncement => 'Anuncio de Repositorio';

  @override
  String get repositoryStateAnnouncement => 'Anuncio de Estado de Repositorio';

  @override
  String get wikiArticle => 'Artículo Wiki';

  @override
  String get redirects => 'Redirecciones';

  @override
  String get draftEvent => 'Borrador de Evento';

  @override
  String get linkSet => 'Conjunto de Enlaces';

  @override
  String get feed => 'Feed';

  @override
  String get dateBasedCalendarEvent => 'Evento de Calendario Basado en Fecha';

  @override
  String get timeBasedCalendarEvent => 'Evento de Calendario Basado en Hora';

  @override
  String get calendar => 'Calendario';

  @override
  String get calendarEventRsvp => 'RSVP de Evento de Calendario';

  @override
  String get handlerRecommendation => 'Recomendación de Manejador';

  @override
  String get handlerInformation => 'Información de Manejador';

  @override
  String get softwareApplication => 'Aplicación de Software';

  @override
  String get communityDefinition => 'Definición de Comunidad';

  @override
  String get geocacheListing => 'Listado de Geocaché';

  @override
  String get mintAnnouncement => 'Anuncio de Mint';

  @override
  String get mintQuote => 'Cotización de Mint';

  @override
  String get peerToPeerOrder => 'Orden de Par a Par';

  @override
  String get groupMetadata => 'Metadatos de Grupo';

  @override
  String get groupAdminMetadata => 'Metadatos de Administrador de Grupo';

  @override
  String get groupMemberMetadata => 'Metadatos de Miembro de Grupo';

  @override
  String get groupAdminsList => 'Lista de Administradores de Grupo';

  @override
  String get groupMembersList => 'Lista de Miembros de Grupo';

  @override
  String get groupRoles => 'Roles de Grupo';

  @override
  String get groupPermissions => 'Permisos de Grupo';

  @override
  String get groupChatMessage => 'Mensaje de Chat de Grupo';

  @override
  String get groupChatThread => 'Hilo de Chat de Grupo';

  @override
  String get groupPinned => 'Fijados de Grupo';

  @override
  String get starterPacks => 'Paquetes Iniciales';

  @override
  String get mediaStarterPacks => 'Paquetes Iniciales de Medios';

  @override
  String get webBookmarks => 'Marcadores Web';

  @override
  String unknownEventKind(int kind) {
    return 'Tipo de Evento $kind';
  }
}
