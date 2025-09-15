// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get applications => 'アプリケーション';

  @override
  String get settings => '設定';

  @override
  String get noApplicationsConnected => '接続されているアプリケーションはありません';

  @override
  String get tapPlusToAddApplication => '+ をタップしてアプリケーションを追加';

  @override
  String get manageApplication => 'アプリケーション管理';

  @override
  String get connectedAccount => '接続済みアカウント';

  @override
  String get permissions => '権限';

  @override
  String get noPermissionsSet => '権限が設定されていません';

  @override
  String removeApp(String appName) {
    return '$appName を削除';
  }

  @override
  String get deleteApplication => 'アプリケーションを削除';

  @override
  String deleteApplicationConfirm(String appName) {
    return '\'$appName\' を削除してもよろしいですか？この操作は取り消せません。';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get addApplication => 'アプリケーションを追加';

  @override
  String get chooseAccount => 'アカウントを選択';

  @override
  String get nostrConnect => 'Nostr コネクト';

  @override
  String get appName => 'アプリケーション名';

  @override
  String get enterAppName => 'アプリケーション名を入力';

  @override
  String get addThisApp => 'このアプリを追加';

  @override
  String get requestedPermissions => '要求された権限';

  @override
  String get noSpecificPermissionsRequested => '特定の権限は要求されていません';

  @override
  String get unknownPermission => '不明な権限';

  @override
  String unknownPermissionMessage(
    String appName,
    String permission,
    String userName,
  ) {
    return 'アプリケーション \'$appName\' がユーザー \'$userName\' のために \'$permission\' の権限を要求しています。許可しますか？';
  }

  @override
  String get allow => '許可';

  @override
  String get deny => '拒否';

  @override
  String get copied => 'コピー済み';

  @override
  String get copiedToClipboard => 'クリップボードにコピーしました';

  @override
  String get applicationDeleted => 'アプリケーションを削除しました';

  @override
  String get permissionUpdated => '権限を更新しました';

  @override
  String get permissionRemoved => '権限を削除しました';

  @override
  String get permissionAdded => '権限を追加しました';

  @override
  String permissionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個の権限',
      one: '1個の権限',
      zero: '権限なし',
    );
    return '$_temp0';
  }

  @override
  String get loggedAccounts => 'ログイン済みアカウント';

  @override
  String get defaultBunkerRelays => 'デフォルト Bunker リレー';

  @override
  String get addRelay => 'リレーを追加';

  @override
  String get enterRelayUrl => 'リレー URL を入力';

  @override
  String get addPrivateKey => '秘密鍵を追加';

  @override
  String get enterPrivateKey => '秘密鍵を入力（nsec または hex）';

  @override
  String get invalidPrivateKey => '無効な秘密鍵';

  @override
  String get accountAddedSuccessfully => 'アカウントを正常に追加しました';

  @override
  String get backupAccount => 'アカウントをバックアップ';

  @override
  String get showPrivateKey => '秘密鍵を表示';

  @override
  String get hidePrivateKey => '秘密鍵を非表示';

  @override
  String get copyPrivateKey => '秘密鍵をコピー';

  @override
  String get privateKeyCopied => '秘密鍵をクリップボードにコピーしました';

  @override
  String get appNotFound => 'アプリが見つかりません';

  @override
  String get allowed => '許可済み';

  @override
  String get blocked => 'ブロック済み';

  @override
  String get permission_connect => '接続';

  @override
  String get permission_get_public_key => '公開鍵を取得';

  @override
  String get permission_sign_event => 'イベントに署名';

  @override
  String get permission_ping => 'Ping';

  @override
  String get permission_get_relays => 'リレーを取得';

  @override
  String get permission_nip04_encrypt => '暗号化 (NIP-04)';

  @override
  String get permission_nip04_decrypt => '復号化 (NIP-04)';

  @override
  String get permission_nip44_encrypt => '暗号化 (NIP-44)';

  @override
  String get permission_nip44_decrypt => '復号化 (NIP-44)';

  @override
  String get permissionRequested => '権限のリクエスト';

  @override
  String appRequestingPermission(String appName) {
    return '$appName が権限を要求しています：';
  }

  @override
  String get authorizeOrBlockRequest => 'このリクエストを許可またはブロックしますか？';

  @override
  String get block => 'ブロック';

  @override
  String get reject => '拒否';

  @override
  String get authorize => '許可';

  @override
  String get removeAccount => 'アカウントを削除';

  @override
  String get removeAccountConfirm => 'このアカウントを削除してもよろしいですか？この操作は取り消せません。';

  @override
  String get remove => '削除';

  @override
  String get copyNpub => 'npubをコピー';

  @override
  String get addAnAccount => 'アカウントを追加';

  @override
  String get removeRelay => 'リレーを削除';

  @override
  String removeRelayConfirm(String relay) {
    return 'このリレーを削除してもよろしいですか？\n$relay';
  }

  @override
  String get relayRemoved => 'リレーを削除しました';

  @override
  String get cannotRemoveLastRelay => '最後のリレーは削除できません';

  @override
  String get cannotRemoveLastRelayMessage =>
      '少なくとも1つのリレーが必要です。このリレーを削除する前に別のリレーを追加してください。';

  @override
  String get ok => 'OK';

  @override
  String get systemSettings => 'システム設定';

  @override
  String get startOnSystemStartup => 'システム起動時に開始';

  @override
  String get startOnSystemStartupDescription => 'コンピューターの起動時に自動的にPeridotを起動する';

  @override
  String get desktopNotifications => 'デスクトップ通知';

  @override
  String get desktopNotificationsDescription => '権限リクエストのデスクトップ通知を表示する';

  @override
  String get notifications => '通知';

  @override
  String get notificationsDescription => '権限リクエストの通知を表示';

  @override
  String get useTor => 'Torを使用';

  @override
  String get useTorDescription => 'プライバシー強化のためTorネットワーク経由で接続をルーティング';

  @override
  String get useTorComingSoon => 'プライバシー強化のためTorネットワーク経由で接続をルーティング（近日公開）';

  @override
  String get continueButton => '続ける';

  @override
  String get bunkerUrlCopiedSuccessfully => 'Bunker URLを正常にコピーしました';

  @override
  String get addAnApp => 'アプリを追加';

  @override
  String get chooseTheAccount => 'アカウントを選択';

  @override
  String get connectAnApp => 'アプリを接続';

  @override
  String get addThisAppQuestion => 'このアプリを追加しますか？';

  @override
  String get connect => '接続';

  @override
  String get connectWithBunkerUrl => 'Bunker URLで接続';

  @override
  String get copyBunkerUrl => 'Bunker URLをコピー';

  @override
  String get nostrConnectUrlHint => 'nostrconnect://';

  @override
  String get publicKeyCopiedSuccessfully => '公開鍵を正常にコピーしました';

  @override
  String get pleaseEnterPassword => 'パスワードを入力してください';

  @override
  String get encryptedBackupCopied => '暗号化されたバックアップをコピーしました';

  @override
  String get backupFailed => 'バックアップに失敗しました';

  @override
  String get privateKeyCopiedToClipboard => '秘密鍵をコピーしました';

  @override
  String get copyFailed => 'コピーに失敗しました';

  @override
  String get backupThisAccount => 'このアカウントをバックアップ';

  @override
  String get noAccountSelected => 'アカウントが選択されていません';

  @override
  String get recommended => '推奨';

  @override
  String get notRecommended => '非推奨';

  @override
  String get password => 'パスワード';

  @override
  String get copyEncryptedVersion => '暗号化されたバージョンをコピー';

  @override
  String get copyUnencryptedVersion => '暗号化されていないバージョンをコピー';

  @override
  String get yourPassword => 'あなたのパスワード';
}
