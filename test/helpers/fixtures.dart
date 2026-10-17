import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/models/bunker_request.dart';

Nip46Request nip46Request({
  required String id,
  String appPubkey = 'app',
  String bunkerPubkey = 'bunker',
  Nip46Commands command = Nip46Commands.ping,
  List<String> params = const [],
  bool useNip44 = true,
}) {
  return Nip46Request(
    id: id,
    command: command,
    params: params,
    appPubkey: appPubkey,
    bunkerPubkey: bunkerPubkey,
    useNip44: useNip44,
  );
}

BunkerRequest bunkerRequest({
  required String id,
  String appPubkey = 'app',
  BunkerRequestStatus status = BunkerRequestStatus.pending,
}) {
  return BunkerRequest(
    originalRequest: nip46Request(id: id, appPubkey: appPubkey),
    status: status,
  );
}

App app({
  required String appPubkey,
  required String bunkerPubkey,
  String userPubkey = 'user',
  String? name,
}) {
  return App(
    appPubkey: appPubkey,
    bunkerPubkey: bunkerPubkey,
    userPubkey: userPubkey,
    name: name,
    relays: ['wss://relay.example.com'],
    permissions: [Permission(command: 'ping')],
  );
}
