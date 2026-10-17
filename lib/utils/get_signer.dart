import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:peridot/controllers/repository.dart';

NdkEventSigner? getSigner(String pubkey) {
  final account = Repository.ndk.accounts.accounts[pubkey];
  if (account == null) return null;
  return account.signer as NdkEventSigner?;
}
