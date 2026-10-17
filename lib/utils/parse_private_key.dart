import 'package:ndk/shared/nips/nip19/nip19.dart';

enum PrivateKeyError {
  empty,
  publicKey,
  invalidNsec,
  notHex,
  wrongLength,
  outOfRange,
}

class InvalidPrivateKeyException implements Exception {
  final PrivateKeyError error;
  final String input;

  const InvalidPrivateKeyException(this.error, this.input);

  @override
  String toString() => 'InvalidPrivateKeyException: ${error.name}';
}

final _secp256k1Order = BigInt.parse(
  'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141',
  radix: 16,
);

final _hex = RegExp(r'^[0-9a-f]+$');

bool _isInCurveRange(String hex) {
  final value = BigInt.parse(hex, radix: 16);
  return value > BigInt.zero && value < _secp256k1Order;
}

String parsePrivateKey(String input) {
  InvalidPrivateKeyException invalid(PrivateKeyError error) =>
      InvalidPrivateKeyException(error, input);

  if (input.isEmpty) throw invalid(PrivateKeyError.empty);
  if (input.startsWith('npub1')) throw invalid(PrivateKeyError.publicKey);

  if (input.startsWith('nsec1')) {
    // Nip19.decode returns '' instead of throwing on an invalid nsec.
    final hex = Nip19.decode(input);
    if (hex.length != 64 || !_hex.hasMatch(hex) || !_isInCurveRange(hex)) {
      throw invalid(PrivateKeyError.invalidNsec);
    }
    return hex;
  }

  if (!_hex.hasMatch(input)) throw invalid(PrivateKeyError.notHex);
  if (input.length != 64) throw invalid(PrivateKeyError.wrongLength);
  if (!_isInCurveRange(input)) throw invalid(PrivateKeyError.outOfRange);
  return input;
}
