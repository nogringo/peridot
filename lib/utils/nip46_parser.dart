import 'dart:convert';
import 'package:ndk/ndk.dart';
import 'package:peridot/controllers/repository.dart';

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

String nip46CommandToString(Nip46Commands command) {
  switch (command) {
    case Nip46Commands.connect:
      return 'connect';
    case Nip46Commands.signEvent:
      return 'sign_event';
    case Nip46Commands.ping:
      return 'ping';
    case Nip46Commands.getPublicKey:
      return 'get_public_key';
    case Nip46Commands.nip04Encrypt:
      return 'nip04_encrypt';
    case Nip46Commands.nip04Decrypt:
      return 'nip04_decrypt';
    case Nip46Commands.nip44Encrypt:
      return 'nip44_encrypt';
    case Nip46Commands.nip44Decrypt:
      return 'nip44_decrypt';
  }
}

Nip46Commands? stringToNip46Command(String method) {
  switch (method) {
    case 'connect':
      return Nip46Commands.connect;
    case 'sign_event':
      return Nip46Commands.signEvent;
    case 'ping':
      return Nip46Commands.ping;
    case 'get_public_key':
      return Nip46Commands.getPublicKey;
    case 'nip04_encrypt':
      return Nip46Commands.nip04Encrypt;
    case 'nip04_decrypt':
      return Nip46Commands.nip04Decrypt;
    case 'nip44_encrypt':
      return Nip46Commands.nip44Encrypt;
    case 'nip44_decrypt':
      return Nip46Commands.nip44Decrypt;
    default:
      return null;
  }
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

Future<Nip46Request?> parseNip46Request(Nip01Event event) async {
  try {
    final targetPubkey = event.getFirstTag("p");
    if (targetPubkey == null) return null;

    // Get the signer from repository
    final account = Repository.ndk.accounts.accounts[targetPubkey];
    if (account == null) return null;
    final signer = account.signer as Bip340EventSigner;

    // Try to decrypt with NIP-44 first, fallback to NIP-04
    String? decryptedContent;
    bool usedNip44 = true;

    try {
      decryptedContent = await signer.decryptNip44(
        ciphertext: event.content,
        senderPubKey: event.pubKey,
      );
    } catch (_) {
      // NIP-44 failed, try NIP-04
      try {
        decryptedContent = await signer.decrypt(event.content, event.pubKey);
        usedNip44 = false;
      } catch (e) {
        return null;
      }
    }

    if (decryptedContent == null) return null;

    // Parse the JSON request
    final request = jsonDecode(decryptedContent);
    final method = request['method'] as String?;
    final params = request['params'];
    final id = request['id'] as String?;

    if (method == null || id == null) return null;

    final command = stringToNip46Command(method);
    if (command == null) return null;

    return Nip46Request(
      id: id,
      command: command,
      params: params,
      clientPubkey: event.pubKey,
      remotePubkey: targetPubkey,
      useNip44: usedNip44,
    );
  } catch (e) {
    return null;
  }
}
