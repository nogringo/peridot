import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nip19/nip19.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
import 'package:peridot/controllers/repository.dart';

class RemoveAccountDialog extends StatelessWidget {
  final String pubkey;

  const RemoveAccountDialog({super.key, required this.pubkey});

  @override
  Widget build(BuildContext context) {
    final npub = Nip19.npubFromHex(pubkey);

    return AlertDialog(
      title: const Text('Remove Account'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              NPicture(ndk: Repository.ndk, pubkey: pubkey),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NName(
                      ndk: Repository.ndk,
                      pubkey: pubkey,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      npub,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Are you sure you want to remove this account? This action cannot be undone.',
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Get.back(result: true),
          child: const Text('Remove', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
