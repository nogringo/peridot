import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: HighlightView(
              formattedJson,
              language: 'json',
              theme: Theme.of(context).brightness == Brightness.light
                  ? a11yLightTheme
                  : a11yDarkTheme,
              padding: EdgeInsets.all(12),
              textStyle: GoogleFonts.sourceCodePro(),
            ),
          ),
        );
      },
    );
  }
}
