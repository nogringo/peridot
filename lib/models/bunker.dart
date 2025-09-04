import 'dart:math';

class Bunker {
  final String pubkey;
  final List<String> relays;
  final String secret;

  String get url {
    final params = <String>[];

    for (final relay in relays) {
      params.add('relay=$relay');
    }

    params.add('secret=$secret');

    final queryString = params.join('&');
    return 'bunker://$pubkey?$queryString';
  }

  Bunker({required this.pubkey, required this.relays, String? secret})
    : secret = secret ?? _generateSecret();

  static String _generateSecret() {
    final random = Random.secure();
    final secretBytes = List<int>.generate(16, (i) => random.nextInt(256));
    return secretBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }
}
