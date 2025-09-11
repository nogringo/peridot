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
  String unknownPermissionMessage(String appName, String permission) {
    return '应用程序 \'$appName\' 正在请求 \'$permission\' 权限。您要允许吗？';
  }

  @override
  String get allow => '允许';

  @override
  String get deny => '拒绝';

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
  String get appNotFound => '未找到应用程序';

  @override
  String get allowed => '已允许';

  @override
  String get blocked => '已阻止';
}
