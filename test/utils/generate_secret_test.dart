import 'package:flutter_test/flutter_test.dart';
import 'package:peridot/utils/generate_secret.dart';

void main() {
  test('generateSecret returns 16 random bytes as lowercase hex', () {
    final secrets = List.generate(50, (_) => generateSecret());

    for (final secret in secrets) {
      expect(secret, matches(RegExp(r'^[0-9a-f]{32}$')));
    }
    expect(secrets.toSet(), hasLength(secrets.length));
  });
}
