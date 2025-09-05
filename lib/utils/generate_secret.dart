import 'dart:math';

String generateSecret() {
  final random = Random.secure();
  final secretBytes = List<int>.generate(16, (i) => random.nextInt(256));
  return secretBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
}
