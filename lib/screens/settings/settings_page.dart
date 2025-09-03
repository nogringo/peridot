import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          Text("Bunker default relays"),
          TextField(),
          SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
