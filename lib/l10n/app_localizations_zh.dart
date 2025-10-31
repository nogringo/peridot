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
  String get noRequests => 'No requests';

  @override
  String get whenYouReceiveRequests =>
      'When you receive new requests, they will appear here';

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
  String get invalidPrivateKey => '抱歉，该私钥似乎无效。';

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
  String get removeClientTag => '删除客户端标签';

  @override
  String get removeClientTagDescription => '在为此应用签名前自动从事件中删除客户端标签';

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

  @override
  String get createOne => '创建一个';

  @override
  String get create => '创建';

  @override
  String get or => '或';

  @override
  String get importOne => '导入一个';

  @override
  String get nsecNcryptsecOrHex => 'Nsec、ncryptsec 或 hex';

  @override
  String get ncryptsecPassword => 'Ncryptsec 密码';

  @override
  String get importKey => '导入密钥';

  @override
  String get backupSecurelyWithPassword => '使用密码安全备份此账户';

  @override
  String get backupInsecurelyWithoutPassword => '不使用密码不安全地备份此账户';

  @override
  String get connectWithNostrConnectUrl => '使用 Nostr connect URL 连接';

  @override
  String get decryptionFailed => '抱歉，我们无法使用该密码解密您的私钥。';

  @override
  String get userMetadata => '用户元数据';

  @override
  String get shortTextNote => '短文本笔记';

  @override
  String get recommendRelay => '推荐中继';

  @override
  String get follows => '关注';

  @override
  String get encryptedDirectMessages => '加密私信';

  @override
  String get eventDeletionRequest => '事件删除请求';

  @override
  String get repost => '转发';

  @override
  String get reaction => '反应';

  @override
  String get badgeAward => '徽章授予';

  @override
  String get chatMessage => '聊天消息';

  @override
  String get groupChatThreadedReply => '群聊线程回复';

  @override
  String get thread => '线程';

  @override
  String get groupThreadReply => '群组线程回复';

  @override
  String get seal => '密封';

  @override
  String get directMessage => '私信';

  @override
  String get fileMessage => '文件消息';

  @override
  String get genericRepost => '通用转发';

  @override
  String get reactionToWebsite => '对网站的反应';

  @override
  String get picture => '图片';

  @override
  String get videoEvent => '视频事件';

  @override
  String get shortFormPortraitVideoEvent => '短视频竖屏事件';

  @override
  String get internalReference => '内部引用';

  @override
  String get externalReference => '外部引用';

  @override
  String get hardcopyReference => '纸质副本引用';

  @override
  String get promptReference => '提示引用';

  @override
  String get channelCreation => '频道创建';

  @override
  String get channelMetadata => '频道元数据';

  @override
  String get channelMessage => '频道消息';

  @override
  String get channelHideMessage => '隐藏频道消息';

  @override
  String get channelMuteUser => '静音频道用户';

  @override
  String get requestToVanish => '消失请求';

  @override
  String get chessPgn => '国际象棋 (PGN)';

  @override
  String get mlsKeyPackage => 'MLS 密钥包';

  @override
  String get mlsWelcome => 'MLS 欢迎';

  @override
  String get mlsGroupEvent => 'MLS 群组事件';

  @override
  String get mergeRequests => '合并请求';

  @override
  String get pollResponse => '投票回复';

  @override
  String get marketplaceBid => '市场出价';

  @override
  String get marketplaceBidConfirmation => '市场出价确认';

  @override
  String get openTimestamps => 'OpenTimestamps';

  @override
  String get giftWrap => '礼物包装';

  @override
  String get fileMetadata => '文件元数据';

  @override
  String get poll => '投票';

  @override
  String get comment => '评论';

  @override
  String get voiceMessage => '语音消息';

  @override
  String get voiceMessageComment => '语音消息评论';

  @override
  String get liveChatMessage => '直播聊天消息';

  @override
  String get codeSnippet => '代码片段';

  @override
  String get gitPatch => 'Git 补丁';

  @override
  String get gitPullRequest => 'Git 拉取请求';

  @override
  String get gitStatusUpdate => 'Git 状态更新';

  @override
  String get gitIssue => 'Git 问题';

  @override
  String get gitIssueUpdate => 'Git 问题更新';

  @override
  String get status => '状态';

  @override
  String get statusUpdate => '状态更新';

  @override
  String get statusDelete => '删除状态';

  @override
  String get statusReply => '状态回复';

  @override
  String get problemTracker => '问题跟踪器';

  @override
  String get reporting => '报告';

  @override
  String get label => '标签';

  @override
  String get relayReviews => '中继评论';

  @override
  String get aiEmbeddings => 'AI 嵌入 / 向量列表';

  @override
  String get torrent => '种子';

  @override
  String get torrentComment => '种子评论';

  @override
  String get coinjoinPool => 'Coinjoin 池';

  @override
  String get communityPostApproval => '社区帖子批准';

  @override
  String get jobRequest => '作业请求';

  @override
  String get jobResult => '作业结果';

  @override
  String get jobFeedback => '作业反馈';

  @override
  String get cashuWalletToken => 'Cashu 钱包代币';

  @override
  String get cashuWalletProofs => 'Cashu 钱包证明';

  @override
  String get cashuWalletHistory => 'Cashu 钱包历史';

  @override
  String get geocacheCreate => '创建地理缓存';

  @override
  String get geocacheUpdate => '更新地理缓存';

  @override
  String get groupControlEvent => '群组控制事件';

  @override
  String get zapGoal => 'Zap 目标';

  @override
  String get nutzap => 'Nutzap';

  @override
  String get tidalLogin => 'Tidal 登录';

  @override
  String get zapRequest => 'Zap 请求';

  @override
  String get zap => 'Zap';

  @override
  String get highlights => '高亮';

  @override
  String get muteList => '静音列表';

  @override
  String get pinList => '置顶列表';

  @override
  String get relayListMetadata => '中继列表元数据';

  @override
  String get bookmarkList => '书签列表';

  @override
  String get communitiesList => '社区列表';

  @override
  String get publicChatsList => '公共聊天列表';

  @override
  String get blockedRelaysList => '已屏蔽中继列表';

  @override
  String get searchRelaysList => '搜索中继列表';

  @override
  String get userGroups => '用户群组';

  @override
  String get favoritesList => '收藏列表';

  @override
  String get privateEventsList => '私密事件列表';

  @override
  String get interestsList => '兴趣列表';

  @override
  String get mediaFollowsList => '媒体关注列表';

  @override
  String get peopleFollowsList => '人物关注列表';

  @override
  String get userEmojiList => '用户表情列表';

  @override
  String get dmRelayList => '私信中继列表';

  @override
  String get keyPackageRelayList => '密钥包中继列表';

  @override
  String get userServerList => '用户服务器列表';

  @override
  String get fileStorageServerList => '文件存储服务器列表';

  @override
  String get relayMonitorAnnouncement => '中继监控公告';

  @override
  String get roomPresence => '房间在线状态';

  @override
  String get proxyAnnouncement => '代理公告';

  @override
  String get transportMethodAnnouncement => '传输方法公告';

  @override
  String get walletInfo => '钱包信息';

  @override
  String get cashuWalletEvent => 'Cashu 钱包事件';

  @override
  String get lightningPubRpc => 'Lightning Pub RPC';

  @override
  String get clientAuthentication => '客户端认证';

  @override
  String get walletRequest => '钱包请求';

  @override
  String get walletResponse => '钱包响应';

  @override
  String get nostrConnectEvent => 'Nostr Connect';

  @override
  String get blobsStoredOnMediaservers => '存储在媒体服务器上的 Blobs';

  @override
  String get httpAuth => 'HTTP 认证';

  @override
  String get categorizedPeopleList => '分类人物列表';

  @override
  String get categorizedBookmarkList => '分类书签列表';

  @override
  String get categorizedRelayList => '分类中继列表';

  @override
  String get bookmarkSets => '书签集';

  @override
  String get curationSets => '策展集';

  @override
  String get videoSets => '视频集';

  @override
  String get kindMuteSets => '类型静音集';

  @override
  String get profileBadges => '个人资料徽章';

  @override
  String get badgeDefinition => '徽章定义';

  @override
  String get interestSets => '兴趣集';

  @override
  String get createOrUpdateStall => '创建或更新摊位';

  @override
  String get createOrUpdateProduct => '创建或更新产品';

  @override
  String get marketplaceUiUx => '市场 UI/UX';

  @override
  String get productSoldAsAuction => '作为拍卖出售的产品';

  @override
  String get longFormContent => '长篇内容';

  @override
  String get draftLongFormContent => '长篇内容草稿';

  @override
  String get emojiSets => '表情集';

  @override
  String get curatedPublicationItem => '策展出版物项';

  @override
  String get curatedPublicationDraft => '策展出版物草稿';

  @override
  String get releaseArtifactSets => '发布工件集';

  @override
  String get applicationSpecificData => '应用特定数据';

  @override
  String get relayDiscovery => '中继发现';

  @override
  String get appCurationSets => '应用策展集';

  @override
  String get liveEvent => '直播事件';

  @override
  String get userStatus => '用户状态';

  @override
  String get slideSet => '幻灯片集';

  @override
  String get classifiedListing => '分类广告';

  @override
  String get draftClassifiedListing => '分类广告草稿';

  @override
  String get repositoryAnnouncement => '仓库公告';

  @override
  String get repositoryStateAnnouncement => '仓库状态公告';

  @override
  String get wikiArticle => 'Wiki 文章';

  @override
  String get redirects => '重定向';

  @override
  String get draftEvent => '事件草稿';

  @override
  String get linkSet => '链接集';

  @override
  String get feed => '动态';

  @override
  String get dateBasedCalendarEvent => '基于日期的日历事件';

  @override
  String get timeBasedCalendarEvent => '基于时间的日历事件';

  @override
  String get calendar => '日历';

  @override
  String get calendarEventRsvp => '日历事件回复';

  @override
  String get handlerRecommendation => '处理器推荐';

  @override
  String get handlerInformation => '处理器信息';

  @override
  String get softwareApplication => '软件应用';

  @override
  String get communityDefinition => '社区定义';

  @override
  String get geocacheListing => '地理缓存列表';

  @override
  String get mintAnnouncement => '铸币公告';

  @override
  String get mintQuote => '铸币报价';

  @override
  String get peerToPeerOrder => '点对点订单';

  @override
  String get groupMetadata => '群组元数据';

  @override
  String get groupAdminMetadata => '群组管理员元数据';

  @override
  String get groupMemberMetadata => '群组成员元数据';

  @override
  String get groupAdminsList => '群组管理员列表';

  @override
  String get groupMembersList => '群组成员列表';

  @override
  String get groupRoles => '群组角色';

  @override
  String get groupPermissions => '群组权限';

  @override
  String get groupChatMessage => '群组聊天消息';

  @override
  String get groupChatThread => '群组聊天线程';

  @override
  String get groupPinned => '群组置顶';

  @override
  String get starterPacks => '入门包';

  @override
  String get mediaStarterPacks => '媒体入门包';

  @override
  String get webBookmarks => '网页书签';

  @override
  String unknownEventKind(int kind) {
    return '事件类型 $kind';
  }

  @override
  String get selectAccountToUse => '选择要使用的账户';

  @override
  String get use => '使用';

  @override
  String get alwaysAskPermission => '总是询问权限';

  @override
  String get alwaysAskPermissionDescription => '对于应用程序的每个请求，您将选择要做什么';

  @override
  String get allowCommonActions => '允许常见操作';

  @override
  String get allowCommonActionsDescription => '常见请求会自动处理，您将选择如何处理其他请求';

  @override
  String get fullyTrust => '完全信任';

  @override
  String get fullyTrustDescription => '所有请求都会自动处理';

  @override
  String get enableThisApp => '启用此应用';

  @override
  String get enableThisAppDescription => '禁用时，所有请求都会被阻止';

  @override
  String get appConfiguration => '应用配置';

  @override
  String get finish => '完成';

  @override
  String get trustLevel => '信任级别';

  @override
  String get deletedApp => '已删除的应用';

  @override
  String get deprecatedEncryptionWarning => '此请求使用已弃用的加密';

  @override
  String get deprecatedEncryptionWarningMessage => '请联系并告知应用开发者';

  @override
  String get metadataLeakWarning => '此请求泄露元数据';

  @override
  String get metadataLeakWarningMessage =>
      '人们可以知道您使用了bunker以及何时使用它。请联系并告知应用开发者';

  @override
  String get params => '参数';

  @override
  String get allowOnce => '允许一次';

  @override
  String get rejectOnce => '拒绝一次';

  @override
  String get allowForever => '永久允许';

  @override
  String get rejectForever => '永久拒绝';

  @override
  String processedRequestsCount(int count) {
    return '$count 已处理的请求';
  }

  @override
  String blockedRequestsCount(int count) {
    return '$count 已阻止的请求';
  }

  @override
  String get deleteAll => '全部删除';

  @override
  String get newPendingRequest => '新的待处理请求';

  @override
  String newPendingRequestBody(String appName) {
    return '收到来自 $appName 的新请求，正在等待您的批准。';
  }
}
