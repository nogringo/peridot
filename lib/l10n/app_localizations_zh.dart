// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get applications => '应用程序';

  @override
  String get settings => '设置';

  @override
  String get noApplicationsConnected => '没有连接的应用程序';

  @override
  String get tapPlusToAddApplication => '点击 + 添加应用程序';

  @override
  String get manageApplication => '管理应用程序';

  @override
  String get connectedAccount => '已连接账户';

  @override
  String get permissions => '权限';

  @override
  String get noPermissionsSet => '未设置权限';

  @override
  String removeApp(String appName) {
    return '移除 $appName';
  }

  @override
  String get deleteApplication => '删除应用程序';

  @override
  String deleteApplicationConfirm(String appName) {
    return '您确定要删除 \'$appName\' 吗？此操作无法撤销。';
  }

  @override
  String get cancel => '取消';

  @override
  String get delete => '删除';

  @override
  String get addApplication => '添加应用程序';

  @override
  String get chooseAccount => '选择账户';

  @override
  String get nostrConnect => 'Nostr 连接';

  @override
  String get appName => '应用程序名称';

  @override
  String get enterAppName => '输入应用程序名称';

  @override
  String get addThisApp => '添加此应用程序';

  @override
  String get requestedPermissions => '请求的权限';

  @override
  String get noSpecificPermissionsRequested => '未请求特定权限';

  @override
  String get unknownPermission => '未知权限';

  @override
  String unknownPermissionMessage(
    String appName,
    String permission,
    String userName,
  ) {
    return '应用程序 \'$appName\' 正在为用户 \'$userName\' 请求 \'$permission\' 权限。您要允许吗？';
  }

  @override
  String get allow => '允许';

  @override
  String get deny => '拒绝';

  @override
  String get copied => '已复制';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get applicationDeleted => '应用程序已删除';

  @override
  String get permissionUpdated => '权限已更新';

  @override
  String get permissionRemoved => '权限已移除';

  @override
  String get permissionAdded => '权限已添加';

  @override
  String permissionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个权限',
      one: '1 个权限',
      zero: '无权限',
    );
    return '$_temp0';
  }

  @override
  String get loggedAccounts => '已登录账户';

  @override
  String get defaultBunkerRelays => '默认 Bunker 中继';

  @override
  String get addRelay => '添加中继';

  @override
  String get enterRelayUrl => '输入中继 URL';

  @override
  String get addPrivateKey => '添加私钥';

  @override
  String get enterPrivateKey => '输入您的私钥（nsec 或 hex）';

  @override
  String get invalidPrivateKey => '无效的私钥';

  @override
  String get accountAddedSuccessfully => '账户添加成功';

  @override
  String get backupAccount => '备份账户';

  @override
  String get showPrivateKey => '显示私钥';

  @override
  String get hidePrivateKey => '隐藏私钥';

  @override
  String get copyPrivateKey => '复制私钥';

  @override
  String get privateKeyCopied => '私钥已复制到剪贴板';

  @override
  String get appNotFound => '未找到应用';

  @override
  String get allowed => '已允许';

  @override
  String get blocked => '已阻止';

  @override
  String get permission_connect => '连接';

  @override
  String get permission_get_public_key => '获取公钥';

  @override
  String get permission_sign_event => '签名事件';

  @override
  String get permission_ping => 'Ping';

  @override
  String get permission_get_relays => '获取中继';

  @override
  String get permission_nip04_encrypt => '加密 (NIP-04)';

  @override
  String get permission_nip04_decrypt => '解密 (NIP-04)';

  @override
  String get permission_nip44_encrypt => '加密 (NIP-44)';

  @override
  String get permission_nip44_decrypt => '解密 (NIP-44)';

  @override
  String get permissionRequested => '权限请求';

  @override
  String appRequestingPermission(String appName) {
    return '$appName 正在请求权限：';
  }

  @override
  String get authorizeOrBlockRequest => '您要授权还是阻止此请求？';

  @override
  String get block => '阻止';

  @override
  String get reject => '拒绝';

  @override
  String get authorize => '授权';

  @override
  String get removeAccount => '删除账户';

  @override
  String get removeAccountConfirm => '您确定要删除此账户吗？此操作无法撤销。';

  @override
  String get remove => '删除';

  @override
  String get copyNpub => '复制 npub';

  @override
  String get addAnAccount => '添加账户';

  @override
  String get removeRelay => '删除中继';

  @override
  String removeRelayConfirm(String relay) {
    return '您确定要删除此中继吗？\n$relay';
  }

  @override
  String get relayRemoved => '中继已删除';

  @override
  String get cannotRemoveLastRelay => '无法删除最后一个中继';

  @override
  String get cannotRemoveLastRelayMessage => '您必须至少有一个中继。请在删除此中继之前添加另一个中继。';

  @override
  String get ok => '确定';

  @override
  String get systemSettings => '系统设置';

  @override
  String get startOnSystemStartup => '开机自启动';

  @override
  String get startOnSystemStartupDescription => '计算机启动时自动运行 Peridot';

  @override
  String get desktopNotifications => '桌面通知';

  @override
  String get desktopNotificationsDescription => '为权限请求显示桌面通知';

  @override
  String get notifications => '通知';

  @override
  String get notificationsDescription => '显示权限请求通知';

  @override
  String get useTor => '使用 Tor';

  @override
  String get useTorDescription => '通过 Tor 网络路由连接以增强隐私';

  @override
  String get useTorComingSoon => '通过 Tor 网络路由连接以增强隐私（即将推出）';

  @override
  String get continueButton => '继续';

  @override
  String get bunkerUrlCopiedSuccessfully => 'Bunker URL 复制成功';

  @override
  String get addAnApp => '添加应用';

  @override
  String get chooseTheAccount => '选择账户';

  @override
  String get connectAnApp => '连接应用';

  @override
  String get addThisAppQuestion => '添加此应用？';

  @override
  String get connect => '连接';

  @override
  String get connectWithBunkerUrl => '使用 Bunker URL 连接';

  @override
  String get copyBunkerUrl => '复制 Bunker URL';

  @override
  String get nostrConnectUrlHint => 'nostrconnect://';

  @override
  String get publicKeyCopiedSuccessfully => '公钥复制成功';

  @override
  String get pleaseEnterPassword => '请输入密码';

  @override
  String get encryptedBackupCopied => '加密备份已复制';

  @override
  String get backupFailed => '备份失败';

  @override
  String get privateKeyCopiedToClipboard => '私钥已复制';

  @override
  String get copyFailed => '复制失败';

  @override
  String get backupThisAccount => '备份此账户';

  @override
  String get noAccountSelected => '未选择账户';

  @override
  String get recommended => '推荐';

  @override
  String get notRecommended => '不推荐';

  @override
  String get password => '密码';

  @override
  String get copyEncryptedVersion => '复制加密版本';

  @override
  String get copyUnencryptedVersion => '复制未加密版本';

  @override
  String get yourPassword => '您的密码';
}
