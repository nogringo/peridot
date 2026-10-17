import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/request/request_controller.dart';
import 'package:peridot/utils/toast_utils.dart';

class JsonViewer extends StatelessWidget {
  final String json;
  final RequestController controller;

  const JsonViewer({super.key, required this.json, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final decodedObject = jsonDecode(json);
        const encoder = JsonEncoder.withIndent('  ');
        final formattedJson = encoder.convert(decodedObject);
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ColoredBox(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SelectableText(
                        formattedJson,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontFamilyFallback: ['Menlo', 'Consolas', 'Courier'],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton(
                        tooltip: AppLocalizations.of(context)!.copyJson,
                        onPressed: () {
                          controller.copyJson(formattedJson);
                          announce(
                            AppLocalizations.of(context)!.copied,
                            context,
                          );
                        },
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          child: Icon(
                            controller.isJsonCopied ? Icons.check : Icons.copy,
                            key: ValueKey<bool>(controller.isJsonCopied),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
