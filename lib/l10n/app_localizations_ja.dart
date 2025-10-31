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
  String get requests => 'リクエスト';

  @override
  String get unnamedApp => '名無しアプリ';

  @override
  String get noApplicationsConnected => '接続されているアプリケーションはありません';

  @override
  String get tapPlusToAddApplication => '+ をタップしてアプリケーションを追加';

  @override
  String get noRequests => 'リクエストなし';

  @override
  String get whenYouReceiveRequests => '新しいリクエストを受信すると、ここに表示されます';

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
  String get enterPrivateKey => '秘密鍵（nsecまたはhex）を入力してください';

  @override
  String get accountAddedSuccessfully => 'アカウントが正常に追加されました';

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
  String get removeClientTag => 'クライアントタグを削除';

  @override
  String get removeClientTagDescription => 'このアプリの署名前にイベントからクライアントタグを自動的に削除';

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

  @override
  String get createOne => '新規作成';

  @override
  String get create => '作成';

  @override
  String get or => 'または';

  @override
  String get importOne => 'インポート';

  @override
  String get nsecNcryptsecOrHex => 'Nsec、ncryptsecまたはhex';

  @override
  String get ncryptsecPassword => 'Ncryptsecパスワード';

  @override
  String get importKey => '鍵をインポート';

  @override
  String get backupSecurelyWithPassword => 'このアカウントをパスワードで安全にバックアップ';

  @override
  String get backupInsecurelyWithoutPassword =>
      'このアカウントをパスワードなしで安全でない方法でバックアップ';

  @override
  String get connectWithNostrConnectUrl => 'Nostr connect URLで接続';

  @override
  String get decryptionFailed => '申し訳ありませんが、そのパスワードで秘密鍵を復号化できませんでした。';

  @override
  String get invalidPrivateKey => '申し訳ありませんが、その秘密鍵は無効のようです。';

  @override
  String get userMetadata => 'ユーザーメタデータ';

  @override
  String get shortTextNote => '短いテキストノート';

  @override
  String get recommendRelay => 'リレーを推薦';

  @override
  String get follows => 'フォロー';

  @override
  String get encryptedDirectMessages => '暗号化ダイレクトメッセージ';

  @override
  String get eventDeletionRequest => 'イベント削除リクエスト';

  @override
  String get repost => 'リポスト';

  @override
  String get reaction => 'リアクション';

  @override
  String get badgeAward => 'バッジ授与';

  @override
  String get chatMessage => 'チャットメッセージ';

  @override
  String get groupChatThreadedReply => 'グループチャットスレッド返信';

  @override
  String get thread => 'スレッド';

  @override
  String get groupThreadReply => 'グループスレッド返信';

  @override
  String get seal => 'シール';

  @override
  String get directMessage => 'ダイレクトメッセージ';

  @override
  String get fileMessage => 'ファイルメッセージ';

  @override
  String get genericRepost => '汎用リポスト';

  @override
  String get reactionToWebsite => 'ウェブサイトへのリアクション';

  @override
  String get picture => '画像';

  @override
  String get videoEvent => 'ビデオイベント';

  @override
  String get shortFormPortraitVideoEvent => '短編縦型ビデオイベント';

  @override
  String get internalReference => '内部参照';

  @override
  String get externalReference => '外部参照';

  @override
  String get hardcopyReference => 'ハードコピー参照';

  @override
  String get promptReference => 'プロンプト参照';

  @override
  String get channelCreation => 'チャンネル作成';

  @override
  String get channelMetadata => 'チャンネルメタデータ';

  @override
  String get channelMessage => 'チャンネルメッセージ';

  @override
  String get channelHideMessage => 'チャンネルメッセージ非表示';

  @override
  String get channelMuteUser => 'チャンネルユーザーミュート';

  @override
  String get requestToVanish => '消去リクエスト';

  @override
  String get chessPgn => 'チェス (PGN)';

  @override
  String get mlsKeyPackage => 'MLSキーパッケージ';

  @override
  String get mlsWelcome => 'MLSウェルカム';

  @override
  String get mlsGroupEvent => 'MLSグループイベント';

  @override
  String get mergeRequests => 'マージリクエスト';

  @override
  String get pollResponse => '投票回答';

  @override
  String get marketplaceBid => 'マーケットプレイス入札';

  @override
  String get marketplaceBidConfirmation => 'マーケットプレイス入札確認';

  @override
  String get openTimestamps => 'OpenTimestamps';

  @override
  String get giftWrap => 'ギフトラップ';

  @override
  String get fileMetadata => 'ファイルメタデータ';

  @override
  String get poll => '投票';

  @override
  String get comment => 'コメント';

  @override
  String get voiceMessage => '音声メッセージ';

  @override
  String get voiceMessageComment => '音声メッセージコメント';

  @override
  String get liveChatMessage => 'ライブチャットメッセージ';

  @override
  String get codeSnippet => 'コードスニペット';

  @override
  String get gitPatch => 'Gitパッチ';

  @override
  String get gitPullRequest => 'Gitプルリクエスト';

  @override
  String get gitStatusUpdate => 'Gitステータス更新';

  @override
  String get gitIssue => 'Git Issue';

  @override
  String get gitIssueUpdate => 'Git Issue更新';

  @override
  String get status => 'ステータス';

  @override
  String get statusUpdate => 'ステータス更新';

  @override
  String get statusDelete => 'ステータス削除';

  @override
  String get statusReply => 'ステータス返信';

  @override
  String get problemTracker => '問題トラッカー';

  @override
  String get reporting => '報告';

  @override
  String get label => 'ラベル';

  @override
  String get relayReviews => 'リレーレビュー';

  @override
  String get aiEmbeddings => 'AI埋め込み / ベクトルリスト';

  @override
  String get torrent => 'トレント';

  @override
  String get torrentComment => 'トレントコメント';

  @override
  String get coinjoinPool => 'Coinjoinプール';

  @override
  String get communityPostApproval => 'コミュニティ投稿承認';

  @override
  String get jobRequest => 'ジョブリクエスト';

  @override
  String get jobResult => 'ジョブ結果';

  @override
  String get jobFeedback => 'ジョブフィードバック';

  @override
  String get cashuWalletToken => 'Cashuウォレットトークン';

  @override
  String get cashuWalletProofs => 'Cashuウォレット証明';

  @override
  String get cashuWalletHistory => 'Cashuウォレット履歴';

  @override
  String get geocacheCreate => 'ジオキャッシュ作成';

  @override
  String get geocacheUpdate => 'ジオキャッシュ更新';

  @override
  String get groupControlEvent => 'グループ制御イベント';

  @override
  String get zapGoal => 'Zap目標';

  @override
  String get nutzap => 'Nutzap';

  @override
  String get tidalLogin => 'Tidalログイン';

  @override
  String get zapRequest => 'Zapリクエスト';

  @override
  String get zap => 'Zap';

  @override
  String get highlights => 'ハイライト';

  @override
  String get muteList => 'ミュートリスト';

  @override
  String get pinList => 'ピンリスト';

  @override
  String get relayListMetadata => 'リレーリストメタデータ';

  @override
  String get bookmarkList => 'ブックマークリスト';

  @override
  String get communitiesList => 'コミュニティリスト';

  @override
  String get publicChatsList => 'パブリックチャットリスト';

  @override
  String get blockedRelaysList => 'ブロックされたリレーリスト';

  @override
  String get searchRelaysList => '検索リレーリスト';

  @override
  String get userGroups => 'ユーザーグループ';

  @override
  String get favoritesList => 'お気に入りリスト';

  @override
  String get privateEventsList => 'プライベートイベントリスト';

  @override
  String get interestsList => '興味リスト';

  @override
  String get mediaFollowsList => 'メディアフォローリスト';

  @override
  String get peopleFollowsList => '人物フォローリスト';

  @override
  String get userEmojiList => 'ユーザー絵文字リスト';

  @override
  String get dmRelayList => 'DMリレーリスト';

  @override
  String get keyPackageRelayList => 'キーパッケージリレーリスト';

  @override
  String get userServerList => 'ユーザーサーバーリスト';

  @override
  String get fileStorageServerList => 'ファイルストレージサーバーリスト';

  @override
  String get relayMonitorAnnouncement => 'リレーモニター発表';

  @override
  String get roomPresence => 'ルームプレゼンス';

  @override
  String get proxyAnnouncement => 'プロキシ発表';

  @override
  String get transportMethodAnnouncement => 'トランスポート方法発表';

  @override
  String get walletInfo => 'ウォレット情報';

  @override
  String get cashuWalletEvent => 'Cashuウォレットイベント';

  @override
  String get lightningPubRpc => 'Lightning Pub RPC';

  @override
  String get clientAuthentication => 'クライアント認証';

  @override
  String get walletRequest => 'ウォレットリクエスト';

  @override
  String get walletResponse => 'ウォレットレスポンス';

  @override
  String get nostrConnectEvent => 'Nostr Connect';

  @override
  String get blobsStoredOnMediaservers => 'メディアサーバーに保存されたBlobs';

  @override
  String get httpAuth => 'HTTP認証';

  @override
  String get categorizedPeopleList => 'カテゴリ分けされた人物リスト';

  @override
  String get categorizedBookmarkList => 'カテゴリ分けされたブックマークリスト';

  @override
  String get categorizedRelayList => 'カテゴリ分けされたリレーリスト';

  @override
  String get bookmarkSets => 'ブックマークセット';

  @override
  String get curationSets => 'キュレーションセット';

  @override
  String get videoSets => 'ビデオセット';

  @override
  String get kindMuteSets => '種類別ミュートセット';

  @override
  String get profileBadges => 'プロフィールバッジ';

  @override
  String get badgeDefinition => 'バッジ定義';

  @override
  String get interestSets => '興味セット';

  @override
  String get createOrUpdateStall => 'ストールを作成または更新';

  @override
  String get createOrUpdateProduct => '製品を作成または更新';

  @override
  String get marketplaceUiUx => 'マーケットプレイスUI/UX';

  @override
  String get productSoldAsAuction => 'オークションとして販売される製品';

  @override
  String get longFormContent => '長文コンテンツ';

  @override
  String get draftLongFormContent => '長文コンテンツの下書き';

  @override
  String get emojiSets => '絵文字セット';

  @override
  String get curatedPublicationItem => 'キュレーションされた出版物アイテム';

  @override
  String get curatedPublicationDraft => 'キュレーションされた出版物の下書き';

  @override
  String get releaseArtifactSets => 'リリースアーティファクトセット';

  @override
  String get applicationSpecificData => 'アプリケーション固有データ';

  @override
  String get relayDiscovery => 'リレー発見';

  @override
  String get appCurationSets => 'アプリキュレーションセット';

  @override
  String get liveEvent => 'ライブイベント';

  @override
  String get userStatus => 'ユーザーステータス';

  @override
  String get slideSet => 'スライドセット';

  @override
  String get classifiedListing => '分類広告';

  @override
  String get draftClassifiedListing => '分類広告の下書き';

  @override
  String get repositoryAnnouncement => 'リポジトリ発表';

  @override
  String get repositoryStateAnnouncement => 'リポジトリ状態発表';

  @override
  String get wikiArticle => 'Wiki記事';

  @override
  String get redirects => 'リダイレクト';

  @override
  String get draftEvent => 'イベントの下書き';

  @override
  String get linkSet => 'リンクセット';

  @override
  String get feed => 'フィード';

  @override
  String get dateBasedCalendarEvent => '日付ベースのカレンダーイベント';

  @override
  String get timeBasedCalendarEvent => '時間ベースのカレンダーイベント';

  @override
  String get calendar => 'カレンダー';

  @override
  String get calendarEventRsvp => 'カレンダーイベントRSVP';

  @override
  String get handlerRecommendation => 'ハンドラー推奨';

  @override
  String get handlerInformation => 'ハンドラー情報';

  @override
  String get softwareApplication => 'ソフトウェアアプリケーション';

  @override
  String get communityDefinition => 'コミュニティ定義';

  @override
  String get geocacheListing => 'ジオキャッシュリスト';

  @override
  String get mintAnnouncement => 'Mint発表';

  @override
  String get mintQuote => 'Mint見積もり';

  @override
  String get peerToPeerOrder => 'ピアツーピア注文';

  @override
  String get groupMetadata => 'グループメタデータ';

  @override
  String get groupAdminMetadata => 'グループ管理者メタデータ';

  @override
  String get groupMemberMetadata => 'グループメンバーメタデータ';

  @override
  String get groupAdminsList => 'グループ管理者リスト';

  @override
  String get groupMembersList => 'グループメンバーリスト';

  @override
  String get groupRoles => 'グループロール';

  @override
  String get groupPermissions => 'グループ権限';

  @override
  String get groupChatMessage => 'グループチャットメッセージ';

  @override
  String get groupChatThread => 'グループチャットスレッド';

  @override
  String get groupPinned => 'グループピン留め';

  @override
  String get starterPacks => 'スターターパック';

  @override
  String get mediaStarterPacks => 'メディアスターターパック';

  @override
  String get webBookmarks => 'Webブックマーク';

  @override
  String unknownEventKind(int kind) {
    return 'イベント種類 $kind';
  }

  @override
  String get selectAccountToUse => '使用するアカウントを選択';

  @override
  String get use => '使用';

  @override
  String get alwaysAskPermission => '常に許可を求める';

  @override
  String get alwaysAskPermissionDescription => 'アプリからの各リクエストに対して、何をするか選択します';

  @override
  String get allowCommonActions => '一般的なアクションを許可';

  @override
  String get allowCommonActionsDescription =>
      '一般的なリクエストは自動的に処理され、その他については選択します';

  @override
  String get fullyTrust => '完全に信頼';

  @override
  String get fullyTrustDescription => 'すべてのリクエストが自動的に処理されます';

  @override
  String get enableThisApp => 'このアプリを有効化';

  @override
  String get enableThisAppDescription => '無効にすると、すべてのリクエストがブロックされます';

  @override
  String get appConfiguration => 'アプリ設定';

  @override
  String get finish => '完了';

  @override
  String get trustLevel => '信頼レベル';

  @override
  String get deletedApp => '削除されたアプリ';

  @override
  String get deprecatedEncryptionWarning => 'このリクエストは非推奨の暗号化を使用しています';

  @override
  String get deprecatedEncryptionWarningMessage => 'アプリ開発者に連絡してお知らせください';

  @override
  String get metadataLeakWarning => 'このリクエストはメタデータを漏洩しています';

  @override
  String get metadataLeakWarningMessage =>
      'バンカーを使用していることと使用時期が他の人に知られる可能性があります。アプリ開発者に連絡してお知らせください';

  @override
  String get params => 'パラメータ';

  @override
  String get allowOnce => '1回許可';

  @override
  String get rejectOnce => '1回拒否';

  @override
  String get allowForever => '常に許可';

  @override
  String get rejectForever => '常に拒否';

  @override
  String processedRequestsCount(int count) {
    return '$count 処理済みリクエスト';
  }

  @override
  String blockedRequestsCount(int count) {
    return '$count ブロック済みリクエスト';
  }

  @override
  String get deleteAll => 'すべて削除';

  @override
  String get newPendingRequest => '新しい保留中のリクエスト';

  @override
  String newPendingRequestBody(String appName) {
    return '$appNameから新しいリクエストを受信しました。承認をお待ちしています。';
  }
}
