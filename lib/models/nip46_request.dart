enum Nip46Commands {
  connect,
  signEvent,
  ping,
  getPublicKey,
  nip04Encrypt,
  nip04Decrypt,
  nip44Encrypt,
  nip44Decrypt,
}

class Nip46Request {
  final String id;
  final Nip46Commands command;
  final List<String> params;
  final String clientPubkey;
  final String remotePubkey;
  final bool useNip44;

  Nip46Request({
    required this.id,
    required this.command,
    required this.params,
    required this.clientPubkey,
    required this.remotePubkey,
    required this.useNip44,
  });
}
