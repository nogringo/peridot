import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/models/bunker_request.dart';

import '../helpers/fixtures.dart';

void main() {
  group('BunkerRequest', () {
    test('defaults to pending and to the current date', () {
      final before = DateTime.now();
      final request = BunkerRequest(originalRequest: nip46Request(id: 'r1'));

      expect(request.status, BunkerRequestStatus.pending);
      expect(request.date.isBefore(before), isFalse);
      expect(request.date.isAfter(DateTime.now()), isFalse);
    });

    test('survives a JSON round trip', () {
      final original = BunkerRequest(
        originalRequest: nip46Request(
          id: 'r1',
          appPubkey: 'app1',
          bunkerPubkey: 'bunker1',
          command: Nip46Commands.signEvent,
          params: ['{"kind":1,"content":"hello"}'],
          useNip44: false,
        ),
        date: DateTime(2026, 10, 17, 12, 30, 45, 123),
        status: BunkerRequestStatus.blocked,
      );

      final decoded = BunkerRequest.fromJson(
        jsonDecode(jsonEncode(original.toJson())),
      );

      expect(decoded.date, original.date);
      expect(decoded.status, BunkerRequestStatus.blocked);
      expect(decoded.originalRequest.id, 'r1');
      expect(decoded.originalRequest.command, Nip46Commands.signEvent);
      expect(decoded.originalRequest.params, ['{"kind":1,"content":"hello"}']);
      expect(decoded.originalRequest.appPubkey, 'app1');
      expect(decoded.originalRequest.bunkerPubkey, 'bunker1');
      expect(decoded.originalRequest.useNip44, isFalse);
      expect(decoded.originalRequest.commandString, 'sign_event:1');
    });

    test('stores the status by name', () {
      for (final status in BunkerRequestStatus.values) {
        final json = bunkerRequest(id: 'r1', status: status).toJson();
        expect(json['status'], status.name);
        expect(BunkerRequest.fromJson(json).status, status);
      }
    });
  });
}
