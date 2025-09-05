
class NostrApp {
  final String pubkey;
  final String? name;
  final List<String> relays;
  final List<String> permissions;

  NostrApp({
    required this.pubkey,
    this.name,
    required this.relays,
    required this.permissions,
  });

  factory NostrApp.fromJson(Map<String, dynamic> json) {
    return NostrApp(
      pubkey: json['pubkey'] as String,
      name: json['name'] as String?,
      relays: (json['relays'] as List<dynamic>).cast<String>(),
      permissions: (json['permissions'] as List<dynamic>).cast<String>(),
    );
  }

  factory NostrApp.fromNostrConnectUrl(String url) {
    // Parse nostrconnect URL according to NIP-46
    // Format: nostrconnect://<client-pubkey>?relay=<relay>&secret=<secret>&perms=<perms>&name=<name>
    final uri = Uri.parse(url);
    final clientPubkey = uri.host;
    
    if (clientPubkey.isEmpty || clientPubkey.length != 64) {
      throw ArgumentError('Invalid client pubkey in URL');
    }

    // Extract required relay parameters
    final relayParams = uri.queryParametersAll['relay'] ?? [];
    if (relayParams.isEmpty) {
      throw ArgumentError('Missing required relay parameter');
    }

    // Extract required secret parameter
    final secret = uri.queryParameters['secret'];
    if (secret == null || secret.isEmpty) {
      throw ArgumentError('Missing required secret parameter');
    }

    // Extract permissions if present
    final permsParam = uri.queryParameters['perms'] ?? '';
    final permissions = permsParam.isNotEmpty 
        ? permsParam.split(',').map((p) => p.trim()).toList()
        : <String>[];

    // Extract optional name directly from query parameters
    final appName = uri.queryParameters['name'];
    
    return NostrApp(
      pubkey: clientPubkey,
      name: appName,
      relays: relayParams,
      permissions: permissions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pubkey': pubkey,
      if (name != null) 'name': name,
      'relays': relays,
      'permissions': permissions,
    };
  }
}
