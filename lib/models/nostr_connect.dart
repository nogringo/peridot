import 'package:peridot/models/authorized_app.dart';
import 'package:peridot/models/permission.dart';

class NostrConnect {
  final String clientPubkey;
  final String secret;
  final List<String> relays;
  final List<String> permissions;
  final String? name;
  final String? url;
  final String? image;

  NostrConnect({
    required this.clientPubkey,
    required this.secret,
    required this.relays,
    required this.permissions,
    this.name,
    this.url,
    this.image,
  });

  factory NostrConnect.fromUrl(String url) {
    // Parse nostrconnect URL according to NIP-46
    // Format: nostrconnect://<client-pubkey>?relay=<relay>&secret=<secret>&perms=<perms>&name=<name>&url=<url>&image=<image>

    if (!url.startsWith('nostrconnect://')) {
      throw ArgumentError('URL must start with nostrconnect://');
    }

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

    // Extract optional permissions
    final permsParam = uri.queryParameters['perms'] ?? '';
    final permissions = permsParam.isNotEmpty
        ? permsParam.split(',').map((p) => p.trim()).toList()
        : <String>[];

    // Extract optional parameters
    final name = uri.queryParameters['name'];
    final appUrl = uri.queryParameters['url'];
    final image = uri.queryParameters['image'];

    return NostrConnect(
      clientPubkey: clientPubkey,
      secret: secret,
      relays: relayParams,
      permissions: permissions,
      name: name,
      url: appUrl,
      image: image,
    );
  }

  // Convert to AuthorizedApp with a specific signer
  AuthorizedApp toAuthorizedApp({
    required String signerPubkey,
    required String name,
  }) {
    return AuthorizedApp(
      appPubkey: clientPubkey,
      signerPubkey: signerPubkey,
      name: name,
      relays: relays,
      permissions: permissions
          .map((p) => Permission(name: p, isAllowed: !p.startsWith('-')))
          .toList(),
    );
  }
}
