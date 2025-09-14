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
  String get noApplicationsConnected => 'Нет подключенных приложений';

  @override
  String get tapPlusToAddApplication => 'Нажмите + чтобы добавить приложение';

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
  String get invalidPrivateKey => 'Недействительный приватный ключ';

  @override
  String get accountAddedSuccessfully => 'Учетная запись успешно добавлена';

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
}
