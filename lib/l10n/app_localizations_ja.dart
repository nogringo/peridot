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
  String unknownPermissionMessage(String appName, String permission) {
    return 'アプリケーション \'$appName\' が \'$permission\' の権限を要求しています。許可しますか？';
  }

  @override
  String get allow => '許可';

  @override
  String get deny => '拒否';

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
  String get appNotFound => 'アプリケーションが見つかりません';

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
