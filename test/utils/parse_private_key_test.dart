import 'package:flutter_test/flutter_test.dart';
import 'package:ndk/shared/nips/nip01/bip340.dart';
import 'package:ndk/shared/nips/nip19/nip19.dart';
import 'package:peridot/utils/parse_private_key.dart';

Matcher throwsPrivateKeyError(PrivateKeyError error) {
  return throwsA(
    isA<InvalidPrivateKeyException>().having((e) => e.error, 'error', error),
  );
}

void main() {
  final keyPair = Bip340.generatePrivateKey();
  final hex = keyPair.privateKey!;
  final nsec = Nip19.encodePrivateKey(hex);
  final npub = Nip19.encodePubKey(keyPair.publicKey);

  group('parsePrivateKey accepts', () {
    test('a hex key', () => expect(parsePrivateKey(hex), hex));

    test('an nsec', () => expect(parsePrivateKey(nsec), hex));

    test('the largest valid key', () {
      const max =
          'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364140';
      expect(parsePrivateKey(max), max);
    });
  });

  group('parsePrivateKey rejects', () {
    final invalid = {
      'an empty field': ('', PrivateKeyError.empty),
      'an npub': (npub, PrivateKeyError.publicKey),
      'random text': ('hello', PrivateKeyError.notHex),
      'non hex characters': ('z' * 64, PrivateKeyError.notHex),
      'a truncated hex key': (
        hex.substring(0, 63),
        PrivateKeyError.wrongLength,
      ),
      'a hex key that is too long': ('${hex}00', PrivateKeyError.wrongLength),
      'a zero key': ('0' * 64, PrivateKeyError.outOfRange),
      'the curve order': (
        'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141',
        PrivateKeyError.outOfRange,
      ),
      'an nsec with a bad checksum': (
        nsec.endsWith('q')
            ? '${nsec.substring(0, nsec.length - 1)}p'
            : '${nsec.substring(0, nsec.length - 1)}q',
        PrivateKeyError.invalidNsec,
      ),
      'a truncated nsec': (
        nsec.substring(0, nsec.length - 3),
        PrivateKeyError.invalidNsec,
      ),
      'a bare nsec1 prefix': ('nsec1', PrivateKeyError.invalidNsec),
    };

    for (final MapEntry(key: name, value: (input, error)) in invalid.entries) {
      test(name, () {
        expect(() => parsePrivateKey(input), throwsPrivateKeyError(error));
      });
    }
  });
}
