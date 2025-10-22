import 'package:flutter/material.dart';

class WarningBannerView extends StatelessWidget {
  final String title;
  final String subtitle;

  const WarningBannerView({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Theme.of(context).brightness,
        ),
      ),
      child: Builder(
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
              border: Border.all(
                width: 1.5,
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.8),
              ),
              borderRadius: BorderRadiusDirectional.circular(16),
            ),
            child: ListTile(
              leading: Icon(Icons.warning_rounded),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
          );
        },
      ),
    );
  }
}
