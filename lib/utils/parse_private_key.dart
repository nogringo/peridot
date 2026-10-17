import 'package:ndk/shared/nips/nip19/nip19.dart';

final _secp256k1Order = BigInt.parse(
  'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141',
  radix: 16,
);

bool isValidPrivateKey(String hex) {
  if (!RegExp(r'^[0-9a-f]{64}$').hasMatch(hex)) return false;
  final value = BigInt.parse(hex, radix: 16);
  return value > BigInt.zero && value < _secp256k1Order;
}

String? parsePrivateKey(String input) {
  // Nip19.decode returns '' instead of throwing on an invalid nsec.
  final hex = input.startsWith('nsec1') ? Nip19.decode(input) : input;
  return isValidPrivateKey(hex) ? hex : null;
}
