// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get applications => 'Приложения';

  @override
  String get settings => 'Настройки';

  @override
  String get requests => 'Запросы';

  @override
  String get unnamedApp => 'Безымянное приложение';

  @override
  String get noApplicationsConnected => 'Нет подключенных приложений';

  @override
  String get tapPlusToAddApplication => 'Нажмите + чтобы добавить приложение';

  @override
  String get noRequests => 'Нет запросов';

  @override
  String get whenYouReceiveRequests =>
      'Когда вы получите новые запросы, они появятся здесь';

  @override
  String get manageApplication => 'Управление приложением';

  @override
  String get connectedAccount => 'Подключенная учетная запись';

  @override
  String get permissions => 'Разрешения';

  @override
  String get noPermissionsSet => 'Разрешения не установлены';

  @override
  String removeApp(String appName) {
    return 'Удалить $appName';
  }

  @override
  String get deleteApplication => 'Удалить приложение';

  @override
  String deleteApplicationConfirm(String appName) {
    return 'Вы уверены, что хотите удалить \'$appName\'? Это действие нельзя отменить.';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get addApplication => 'Добавить приложение';

  @override
  String get chooseAccount => 'Выбрать учетную запись';

  @override
  String get nostrConnect => 'Nostr Connect';

  @override
  String get appName => 'Название приложения';

  @override
  String get enterAppName => 'Введите название приложения';

  @override
  String get addThisApp => 'Добавить это приложение';

  @override
  String get requestedPermissions => 'Запрошенные разрешения';

  @override
  String get noSpecificPermissionsRequested =>
      'Конкретные разрешения не запрошены';

  @override
  String get unknownPermission => 'Неизвестное разрешение';

  @override
  String unknownPermissionMessage(
    String appName,
    String permission,
    String userName,
  ) {
    return 'Приложение \'$appName\' запрашивает разрешение для \'$permission\' от имени пользователя \'$userName\'. Хотите разрешить?';
  }

  @override
  String get allow => 'Разрешить';

  @override
  String get deny => 'Отказать';

  @override
  String get copied => 'Скопировано';

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';

  @override
  String get applicationDeleted => 'Приложение удалено';

  @override
  String get permissionUpdated => 'Разрешение обновлено';

  @override
  String get permissionRemoved => 'Разрешение удалено';

  @override
  String get permissionAdded => 'Разрешение добавлено';

  @override
  String permissionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count разрешений',
      few: '$count разрешения',
      one: '1 разрешение',
      zero: 'нет разрешений',
    );
    return '$_temp0';
  }

  @override
  String get loggedAccounts => 'Учетные записи';

  @override
  String get defaultBunkerRelays => 'Реле Bunker по умолчанию';

  @override
  String get addRelay => 'Добавить реле';

  @override
  String get enterRelayUrl => 'Введите URL реле';

  @override
  String get addPrivateKey => 'Добавить приватный ключ';

  @override
  String get enterPrivateKey => 'Введите ваш приватный ключ (nsec или hex)';

  @override
  String get accountAddedSuccessfully => 'Аккаунт успешно добавлен';

  @override
  String get backupAccount => 'Резервная копия учетной записи';

  @override
  String get showPrivateKey => 'Показать приватный ключ';

  @override
  String get hidePrivateKey => 'Скрыть приватный ключ';

  @override
  String get copyPrivateKey => 'Копировать приватный ключ';

  @override
  String get privateKeyCopied => 'Приватный ключ скопирован в буфер обмена';

  @override
  String get appNotFound => 'Приложение не найдено';

  @override
  String get allowed => 'Разрешено';

  @override
  String get blocked => 'Заблокировано';

  @override
  String get permission_connect => 'Подключение';

  @override
  String get permission_get_public_key => 'Получить публичный ключ';

  @override
  String get permission_sign_event => 'Подписать событие';

  @override
  String get permission_ping => 'Пинг';

  @override
  String get permission_get_relays => 'Получить реле';

  @override
  String get permission_nip04_encrypt => 'Шифрование (NIP-04)';

  @override
  String get permission_nip04_decrypt => 'Расшифровка (NIP-04)';

  @override
  String get permission_nip44_encrypt => 'Шифрование (NIP-44)';

  @override
  String get permission_nip44_decrypt => 'Расшифровка (NIP-44)';

  @override
  String get permissionRequested => 'Запрос разрешения';

  @override
  String appRequestingPermission(String appName) {
    return '$appName запрашивает разрешение:';
  }

  @override
  String get authorizeOrBlockRequest =>
      'Вы хотите авторизовать или заблокировать этот запрос?';

  @override
  String get block => 'Блокировать';

  @override
  String get reject => 'Отклонить';

  @override
  String get authorize => 'Авторизовать';

  @override
  String get removeAccount => 'Удалить учетную запись';

  @override
  String get removeAccountConfirm =>
      'Вы уверены, что хотите удалить эту учетную запись? Это действие нельзя отменить.';

  @override
  String get remove => 'Удалить';

  @override
  String get copyNpub => 'Копировать npub';

  @override
  String get addAnAccount => 'Добавить учетную запись';

  @override
  String get removeRelay => 'Удалить реле';

  @override
  String removeRelayConfirm(String relay) {
    return 'Вы уверены, что хотите удалить это реле?\n$relay';
  }

  @override
  String get relayRemoved => 'Реле удалено';

  @override
  String get cannotRemoveLastRelay => 'Невозможно удалить последнее реле';

  @override
  String get cannotRemoveLastRelayMessage =>
      'У вас должно быть хотя бы одно реле. Пожалуйста, добавьте другое реле перед удалением этого.';

  @override
  String get ok => 'OK';

  @override
  String get systemSettings => 'Системные настройки';

  @override
  String get startOnSystemStartup => 'Запуск при старте системы';

  @override
  String get startOnSystemStartupDescription =>
      'Автоматически запускать Peridot при включении компьютера';

  @override
  String get desktopNotifications => 'Уведомления на рабочем столе';

  @override
  String get desktopNotificationsDescription =>
      'Показывать уведомления на рабочем столе для запросов разрешений';

  @override
  String get notifications => 'Уведомления';

  @override
  String get notificationsDescription =>
      'Показывать уведомления для запросов разрешений';

  @override
  String get useTor => 'Использовать Tor';

  @override
  String get useTorDescription =>
      'Маршрутизировать соединения через сеть Tor для повышения конфиденциальности';

  @override
  String get useTorComingSoon =>
      'Маршрутизировать соединения через сеть Tor для повышения конфиденциальности (Скоро)';

  @override
  String get removeClientTag => 'Удалить тег клиента';

  @override
  String get removeClientTagDescription =>
      'Автоматически удалять тег клиента из событий перед подписанием для этого приложения';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get bunkerUrlCopiedSuccessfully => 'URL Bunker успешно скопирован';

  @override
  String get addAnApp => 'Добавить приложение';

  @override
  String get chooseTheAccount => 'Выберите аккаунт';

  @override
  String get connectAnApp => 'Подключить приложение';

  @override
  String get addThisAppQuestion => 'Добавить это приложение?';

  @override
  String get connect => 'Подключить';

  @override
  String get connectWithBunkerUrl => 'Подключиться через URL Bunker';

  @override
  String get copyBunkerUrl => 'Скопировать URL Bunker';

  @override
  String get nostrConnectUrlHint => 'nostrconnect://';

  @override
  String get publicKeyCopiedSuccessfully => 'Публичный ключ успешно скопирован';

  @override
  String get pleaseEnterPassword => 'Пожалуйста, введите пароль';

  @override
  String get encryptedBackupCopied =>
      'Зашифрованная резервная копия скопирована';

  @override
  String get backupFailed => 'Ошибка резервного копирования';

  @override
  String get privateKeyCopiedToClipboard => 'Приватный ключ скопирован';

  @override
  String get copyFailed => 'Ошибка копирования';

  @override
  String get backupThisAccount => 'Резервное копирование этого аккаунта';

  @override
  String get noAccountSelected => 'Аккаунт не выбран';

  @override
  String get recommended => 'Рекомендуется';

  @override
  String get notRecommended => 'Не рекомендуется';

  @override
  String get password => 'Пароль';

  @override
  String get copyEncryptedVersion => 'Скопировать зашифрованную версию';

  @override
  String get copyUnencryptedVersion => 'Скопировать незашифрованную версию';

  @override
  String get yourPassword => 'Ваш пароль';

  @override
  String get createOne => 'Создать новый';

  @override
  String get create => 'Создать';

  @override
  String get or => 'ИЛИ';

  @override
  String get importOne => 'Импортировать';

  @override
  String get nsecNcryptsecOrHex => 'Nsec, ncryptsec или hex';

  @override
  String get ncryptsecPassword => 'Пароль ncryptsec';

  @override
  String get importKey => 'Импортировать ключ';

  @override
  String get backupSecurelyWithPassword =>
      'Создать резервную копию этого аккаунта безопасно с паролем';

  @override
  String get backupInsecurelyWithoutPassword =>
      'Создать резервную копию этого аккаунта небезопасно без пароля';

  @override
  String get connectWithNostrConnectUrl =>
      'Подключиться через URL Nostr connect';

  @override
  String get decryptionFailed =>
      'Извините, мы не смогли расшифровать ваш приватный ключ с этим паролем.';

  @override
  String get invalidPrivateKey =>
      'Извините, похоже, что этот приватный ключ недействителен.';

  @override
  String get userMetadata => 'Метаданные пользователя';

  @override
  String get shortTextNote => 'Короткая текстовая заметка';

  @override
  String get recommendRelay => 'Рекомендовать реле';

  @override
  String get follows => 'Подписки';

  @override
  String get encryptedDirectMessages => 'Зашифрованные личные сообщения';

  @override
  String get eventDeletionRequest => 'Запрос на удаление события';

  @override
  String get repost => 'Репост';

  @override
  String get reaction => 'Реакция';

  @override
  String get badgeAward => 'Награждение значком';

  @override
  String get chatMessage => 'Сообщение в чате';

  @override
  String get groupChatThreadedReply => 'Ответ в ветке группового чата';

  @override
  String get thread => 'Ветка';

  @override
  String get groupThreadReply => 'Ответ в групповой ветке';

  @override
  String get seal => 'Печать';

  @override
  String get directMessage => 'Личное сообщение';

  @override
  String get fileMessage => 'Файловое сообщение';

  @override
  String get genericRepost => 'Общий репост';

  @override
  String get reactionToWebsite => 'Реакция на веб-сайт';

  @override
  String get picture => 'Изображение';

  @override
  String get videoEvent => 'Видео событие';

  @override
  String get shortFormPortraitVideoEvent =>
      'Короткое вертикальное видео событие';

  @override
  String get internalReference => 'Внутренняя ссылка';

  @override
  String get externalReference => 'Внешняя ссылка';

  @override
  String get hardcopyReference => 'Ссылка на бумажную копию';

  @override
  String get promptReference => 'Ссылка на запрос';

  @override
  String get channelCreation => 'Создание канала';

  @override
  String get channelMetadata => 'Метаданные канала';

  @override
  String get channelMessage => 'Сообщение канала';

  @override
  String get channelHideMessage => 'Скрыть сообщение канала';

  @override
  String get channelMuteUser => 'Заглушить пользователя канала';

  @override
  String get requestToVanish => 'Запрос на исчезновение';

  @override
  String get chessPgn => 'Шахматы (PGN)';

  @override
  String get mlsKeyPackage => 'Пакет ключей MLS';

  @override
  String get mlsWelcome => 'Приветствие MLS';

  @override
  String get mlsGroupEvent => 'Групповое событие MLS';

  @override
  String get mergeRequests => 'Запросы на слияние';

  @override
  String get pollResponse => 'Ответ на опрос';

  @override
  String get marketplaceBid => 'Ставка на маркетплейсе';

  @override
  String get marketplaceBidConfirmation =>
      'Подтверждение ставки на маркетплейсе';

  @override
  String get openTimestamps => 'OpenTimestamps';

  @override
  String get giftWrap => 'Подарочная упаковка';

  @override
  String get fileMetadata => 'Метаданные файла';

  @override
  String get poll => 'Опрос';

  @override
  String get comment => 'Комментарий';

  @override
  String get voiceMessage => 'Голосовое сообщение';

  @override
  String get voiceMessageComment => 'Комментарий к голосовому сообщению';

  @override
  String get liveChatMessage => 'Сообщение в прямом эфире';

  @override
  String get codeSnippet => 'Фрагмент кода';

  @override
  String get gitPatch => 'Git патч';

  @override
  String get gitPullRequest => 'Git запрос на извлечение';

  @override
  String get gitStatusUpdate => 'Обновление статуса Git';

  @override
  String get gitIssue => 'Git проблема';

  @override
  String get gitIssueUpdate => 'Обновление Git проблемы';

  @override
  String get status => 'Статус';

  @override
  String get statusUpdate => 'Обновление статуса';

  @override
  String get statusDelete => 'Удалить статус';

  @override
  String get statusReply => 'Ответ на статус';

  @override
  String get problemTracker => 'Трекер проблем';

  @override
  String get reporting => 'Жалоба';

  @override
  String get label => 'Метка';

  @override
  String get relayReviews => 'Обзоры реле';

  @override
  String get aiEmbeddings => 'AI встраивания / Векторные списки';

  @override
  String get torrent => 'Торрент';

  @override
  String get torrentComment => 'Комментарий к торренту';

  @override
  String get coinjoinPool => 'Пул Coinjoin';

  @override
  String get communityPostApproval => 'Одобрение публикации сообщества';

  @override
  String get jobRequest => 'Запрос на задание';

  @override
  String get jobResult => 'Результат задания';

  @override
  String get jobFeedback => 'Обратная связь по заданию';

  @override
  String get cashuWalletToken => 'Токен кошелька Cashu';

  @override
  String get cashuWalletProofs => 'Доказательства кошелька Cashu';

  @override
  String get cashuWalletHistory => 'История кошелька Cashu';

  @override
  String get geocacheCreate => 'Создать геокэш';

  @override
  String get geocacheUpdate => 'Обновить геокэш';

  @override
  String get groupControlEvent => 'Событие управления группой';

  @override
  String get zapGoal => 'Цель Zap';

  @override
  String get nutzap => 'Nutzap';

  @override
  String get tidalLogin => 'Вход Tidal';

  @override
  String get zapRequest => 'Запрос Zap';

  @override
  String get zap => 'Zap';

  @override
  String get highlights => 'Выделения';

  @override
  String get muteList => 'Список заглушенных';

  @override
  String get pinList => 'Список закрепленных';

  @override
  String get relayListMetadata => 'Метаданные списка реле';

  @override
  String get bookmarkList => 'Список закладок';

  @override
  String get communitiesList => 'Список сообществ';

  @override
  String get publicChatsList => 'Список публичных чатов';

  @override
  String get blockedRelaysList => 'Список заблокированных реле';

  @override
  String get searchRelaysList => 'Список реле для поиска';

  @override
  String get userGroups => 'Группы пользователей';

  @override
  String get favoritesList => 'Список избранного';

  @override
  String get privateEventsList => 'Список приватных событий';

  @override
  String get interestsList => 'Список интересов';

  @override
  String get mediaFollowsList => 'Список подписок на медиа';

  @override
  String get peopleFollowsList => 'Список подписок на людей';

  @override
  String get userEmojiList => 'Список эмодзи пользователя';

  @override
  String get dmRelayList => 'Список реле для ЛС';

  @override
  String get keyPackageRelayList => 'Список реле для пакетов ключей';

  @override
  String get userServerList => 'Список серверов пользователя';

  @override
  String get fileStorageServerList => 'Список серверов хранения файлов';

  @override
  String get relayMonitorAnnouncement => 'Объявление мониторинга реле';

  @override
  String get roomPresence => 'Присутствие в комнате';

  @override
  String get proxyAnnouncement => 'Объявление прокси';

  @override
  String get transportMethodAnnouncement => 'Объявление метода транспорта';

  @override
  String get walletInfo => 'Информация о кошельке';

  @override
  String get cashuWalletEvent => 'Событие кошелька Cashu';

  @override
  String get lightningPubRpc => 'Lightning Pub RPC';

  @override
  String get clientAuthentication => 'Аутентификация клиента';

  @override
  String get walletRequest => 'Запрос к кошельку';

  @override
  String get walletResponse => 'Ответ кошелька';

  @override
  String get nostrConnectEvent => 'Nostr Connect';

  @override
  String get blobsStoredOnMediaservers => 'Blobs, хранящиеся на медиасерверах';

  @override
  String get httpAuth => 'HTTP аутентификация';

  @override
  String get categorizedPeopleList => 'Категоризированный список людей';

  @override
  String get categorizedBookmarkList => 'Категоризированный список закладок';

  @override
  String get categorizedRelayList => 'Категоризированный список реле';

  @override
  String get bookmarkSets => 'Наборы закладок';

  @override
  String get curationSets => 'Наборы курирования';

  @override
  String get videoSets => 'Наборы видео';

  @override
  String get kindMuteSets => 'Наборы заглушенных типов';

  @override
  String get profileBadges => 'Значки профиля';

  @override
  String get badgeDefinition => 'Определение значка';

  @override
  String get interestSets => 'Наборы интересов';

  @override
  String get createOrUpdateStall => 'Создать или обновить киоск';

  @override
  String get createOrUpdateProduct => 'Создать или обновить продукт';

  @override
  String get marketplaceUiUx => 'UI/UX маркетплейса';

  @override
  String get productSoldAsAuction => 'Продукт, проданный на аукционе';

  @override
  String get longFormContent => 'Длинный контент';

  @override
  String get draftLongFormContent => 'Черновик длинного контента';

  @override
  String get emojiSets => 'Наборы эмодзи';

  @override
  String get curatedPublicationItem => 'Курированная публикация';

  @override
  String get curatedPublicationDraft => 'Черновик курированной публикации';

  @override
  String get releaseArtifactSets => 'Наборы артефактов релиза';

  @override
  String get applicationSpecificData => 'Данные, специфичные для приложения';

  @override
  String get relayDiscovery => 'Обнаружение реле';

  @override
  String get appCurationSets => 'Наборы курирования приложений';

  @override
  String get liveEvent => 'Живое событие';

  @override
  String get userStatus => 'Статус пользователя';

  @override
  String get slideSet => 'Набор слайдов';

  @override
  String get classifiedListing => 'Объявление';

  @override
  String get draftClassifiedListing => 'Черновик объявления';

  @override
  String get repositoryAnnouncement => 'Объявление репозитория';

  @override
  String get repositoryStateAnnouncement => 'Объявление состояния репозитория';

  @override
  String get wikiArticle => 'Статья Wiki';

  @override
  String get redirects => 'Перенаправления';

  @override
  String get draftEvent => 'Черновик события';

  @override
  String get linkSet => 'Набор ссылок';

  @override
  String get feed => 'Лента';

  @override
  String get dateBasedCalendarEvent => 'Событие календаря по дате';

  @override
  String get timeBasedCalendarEvent => 'Событие календаря по времени';

  @override
  String get calendar => 'Календарь';

  @override
  String get calendarEventRsvp => 'RSVP события календаря';

  @override
  String get handlerRecommendation => 'Рекомендация обработчика';

  @override
  String get handlerInformation => 'Информация об обработчике';

  @override
  String get softwareApplication => 'Программное приложение';

  @override
  String get communityDefinition => 'Определение сообщества';

  @override
  String get geocacheListing => 'Список геокэшей';

  @override
  String get mintAnnouncement => 'Объявление Mint';

  @override
  String get mintQuote => 'Котировка Mint';

  @override
  String get peerToPeerOrder => 'Заказ P2P';

  @override
  String get groupMetadata => 'Метаданные группы';

  @override
  String get groupAdminMetadata => 'Метаданные администратора группы';

  @override
  String get groupMemberMetadata => 'Метаданные участника группы';

  @override
  String get groupAdminsList => 'Список администраторов группы';

  @override
  String get groupMembersList => 'Список участников группы';

  @override
  String get groupRoles => 'Роли группы';

  @override
  String get groupPermissions => 'Разрешения группы';

  @override
  String get groupChatMessage => 'Сообщение группового чата';

  @override
  String get groupChatThread => 'Ветка группового чата';

  @override
  String get groupPinned => 'Закрепленные группы';

  @override
  String get starterPacks => 'Стартовые паки';

  @override
  String get mediaStarterPacks => 'Медиа стартовые паки';

  @override
  String get webBookmarks => 'Веб-закладки';

  @override
  String get videoView => 'Видеопросмотр';

  @override
  String unknownEventKind(int kind) {
    return 'Тип события $kind';
  }

  @override
  String get selectAccountToUse => 'Выберите учетную запись для использования';

  @override
  String get use => 'Использовать';

  @override
  String get alwaysAskPermission => 'Всегда спрашивать разрешение';

  @override
  String get alwaysAskPermissionDescription =>
      'Для каждого запроса от приложения вы будете выбирать, что делать';

  @override
  String get allowCommonActions => 'Разрешить обычные действия';

  @override
  String get allowCommonActionsDescription =>
      'Обычные запросы обрабатываются автоматически, вы будете выбирать, что делать с остальными';

  @override
  String get fullyTrust => 'Полностью доверять';

  @override
  String get fullyTrustDescription =>
      'Все запросы обрабатываются автоматически';

  @override
  String get enableThisApp => 'Включить это приложение';

  @override
  String get enableThisAppDescription =>
      'При отключении все запросы блокируются';

  @override
  String get appConfiguration => 'Конфигурация приложения';

  @override
  String get finish => 'Завершить';

  @override
  String get trustLevel => 'Уровень доверия';

  @override
  String get deletedApp => 'Удаленное приложение';

  @override
  String get deprecatedEncryptionWarning =>
      'Этот запрос использует устаревшее шифрование';

  @override
  String get deprecatedEncryptionWarningMessage =>
      'Пожалуйста, свяжитесь и сообщите разработчику приложения';

  @override
  String get metadataLeakWarning => 'Этот запрос утекает метаданные';

  @override
  String get metadataLeakWarningMessage =>
      'Люди могут узнать, что вы используете бункер и когда вы его используете. Пожалуйста, свяжитесь и сообщите разработчику приложения';

  @override
  String get params => 'Параметры';

  @override
  String get allowOnce => 'Разрешить один раз';

  @override
  String get rejectOnce => 'Отклонить один раз';

  @override
  String get allowForever => 'Разрешить навсегда';

  @override
  String get rejectForever => 'Отклонить навсегда';

  @override
  String processedRequestsCount(int count) {
    return '$count Обработанных запросов';
  }

  @override
  String blockedRequestsCount(int count) {
    return '$count Заблокированных запросов';
  }

  @override
  String get deleteAll => 'Удалить все';

  @override
  String get newPendingRequest => 'Новый ожидающий запрос';

  @override
  String newPendingRequestBody(String appName) {
    return 'Получен новый запрос от $appName и ожидает вашего одобрения.';
  }
}
