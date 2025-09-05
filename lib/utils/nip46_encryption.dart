import 'package:ndk/ndk.dart';

/// Encrypts a string using either NIP-44 or NIP-04 encryption
///
/// [signer] - The event signer to use for encryption
/// [plaintext] - The text to encrypt
/// [recipientPubkey] - The public key of the recipient
/// [useNip44] - Whether to use NIP-44 (true) or NIP-04 (false)
///
/// Returns the encrypted string or null if encryption fails
Future<String?> encryptNip46(
  Bip340EventSigner signer,
  String plaintext,
  String recipientPubkey,
  bool useNip44,
) async {
  try {
    if (useNip44) {
      return await signer.encryptNip44(
        plaintext: plaintext,
        recipientPubKey: recipientPubkey,
      );
    } else {
      return await signer.encrypt(plaintext, recipientPubkey);
    }
  } catch (e) {
    return null;
  }
}

/// Decrypts a string using either NIP-44 or NIP-04 decryption
///
/// [signer] - The event signer to use for decryption
/// [ciphertext] - The encrypted text to decrypt
/// [senderPubkey] - The public key of the sender
/// [useNip44] - Whether to use NIP-44 (true) or NIP-04 (false)
///
/// Returns the decrypted string or null if decryption fails
Future<String?> decryptNip46(
  Bip340EventSigner signer,
  String ciphertext,
  String senderPubkey,
  bool useNip44,
) async {
  try {
    if (useNip44) {
      return await signer.decryptNip44(
        ciphertext: ciphertext,
        senderPubKey: senderPubkey,
      );
    } else {
      return await signer.decrypt(ciphertext, senderPubkey);
    }
  } catch (e) {
    return null;
  }
}
