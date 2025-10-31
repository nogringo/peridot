import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peridot/screens/request/request_controller.dart';

class JsonViewer extends StatelessWidget {
  final String json;

  const JsonViewer({super.key, required this.json});

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
                color:
                    (Theme.of(context).brightness == Brightness.light
                            ? a11yLightTheme
                            : a11yDarkTheme)["root"]!
                        .backgroundColor!,
                child: Stack(
                  children: [
                    HighlightView(
                      formattedJson,
                      language: 'json',
                      theme: Theme.of(context).brightness == Brightness.light
                          ? a11yLightTheme
                          : a11yDarkTheme,
                      padding: EdgeInsets.all(12),
                      textStyle: GoogleFonts.sourceCodePro(),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton(
                        onPressed: () {
                          RequestController.to.copyJson(formattedJson);
                        },
                        icon: Obx(() {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 100),
                            child: Icon(
                              RequestController.to.isJsonCopied.value
                                  ? Icons.check
                                  : Icons.copy,
                              key: ValueKey<bool>(
                                RequestController.to.isJsonCopied.value,
                              ),
                            ),
                          );
                        }),
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
