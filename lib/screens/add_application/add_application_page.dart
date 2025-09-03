import 'package:flutter/material.dart';

class AddApplicationPage extends StatelessWidget {
  const AddApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add application")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          TextField(decoration: InputDecoration(hintText: "nostrconnect://")),
          SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
