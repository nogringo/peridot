import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ndk/ndk.dart';
import 'package:ndk_flutter/widgets/widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';

class Kind3Widget extends StatefulWidget {
  final String eventJson;
  final String userPubkey;

  const Kind3Widget({
    super.key,
    required this.eventJson,
    required this.userPubkey,
  });

  @override
  State<Kind3Widget> createState() => _Kind3WidgetState();
}

class _Kind3WidgetState extends State<Kind3Widget> {
  Set<String> currentFollows = {};
  Set<String> newFollows = {};
  Set<String> addedFollows = {};
  Set<String> removedFollows = {};
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _loadAndCompare();
  }

  Future<void> _loadAndCompare() async {
    try {
      // Parse the new event
      final Map<String, dynamic> newEventData = jsonDecode(widget.eventJson);
      final tags = newEventData['tags'] as List<dynamic>? ?? [];

      // Extract follows from p tags
      for (final tag in tags) {
        if (tag is List && tag.isNotEmpty && tag[0] == 'p') {
          if (tag.length > 1 && tag[1] is String) {
            newFollows.add(tag[1] as String);
          }
        }
      }

      // Fetch current kind 3 event from relays
      final filter = Filter(kinds: [3], authors: [widget.userPubkey], limit: 1);

      final ndk = Repository.ndk;
      final response = ndk.requests.query(filter: filter);

      await for (final event in response.stream) {
        final currentTags = event.tags;

        // Extract current follows from p tags
        for (final tag in currentTags) {
          if (tag.isNotEmpty && tag[0] == 'p') {
            if (tag.length > 1) {
              currentFollows.add(tag[1]);
            }
          }
        }
        break; // Only need the first (most recent) event
      }

      // Calculate differences
      addedFollows = newFollows.difference(currentFollows);
      removedFollows = currentFollows.difference(newFollows);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (hasError) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          l10n.unableToLoadFollows,
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    }

    if (addedFollows.isEmpty && removedFollows.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          l10n.noFollowChanges,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (addedFollows.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Row(
              children: [
                Icon(Icons.person_add, color: Colors.green, size: 20),
                SizedBox(width: 8),
                Text(
                  l10n.addingFollowsCount(addedFollows.length),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ...addedFollows.map(
            (pubkey) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _FollowCard(pubkey: pubkey, isAdded: true),
            ),
          ),
        ],
        if (removedFollows.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Row(
              children: [
                Icon(Icons.person_remove, color: Colors.red, size: 20),
                SizedBox(width: 8),
                Text(
                  l10n.removingFollowsCount(removedFollows.length),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ...removedFollows.map(
            (pubkey) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _FollowCard(pubkey: pubkey, isAdded: false),
            ),
          ),
        ],
      ],
    );
  }
}

class _FollowCard extends StatelessWidget {
  final String pubkey;
  final bool isAdded;

  const _FollowCard({required this.pubkey, required this.isAdded});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isAdded
              ? Colors.green.withValues(alpha: 0.3)
              : Colors.red.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(12),
        color: (isAdded ? Colors.green : Colors.red).withValues(alpha: 0.05),
      ),
      child: ListTile(
        leading: NPicture(
          ndkFlutter: Repository.ndkFlutter,
          pubkey: pubkey,
          circleAvatarRadius: 20,
        ),
        title: NName(
          ndkFlutter: Repository.ndkFlutter,
          pubkey: pubkey,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          Nip19.encodePubKey(pubkey),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
