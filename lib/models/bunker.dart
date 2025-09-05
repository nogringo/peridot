import 'package:peridot/utils/generate_secret.dart';

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
    : secret = secret ?? generateSecret();
}
