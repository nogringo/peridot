import 'package:ndk/data_layer/repositories/signers/bip340_event_signer.dart';
import 'package:peridot/controllers/repository.dart';

Bip340EventSigner? getSigner(String pubkey) {
  final account = Repository.ndk.accounts.accounts[pubkey];
  if (account == null) return null;
  return account.signer as Bip340EventSigner?;
}
