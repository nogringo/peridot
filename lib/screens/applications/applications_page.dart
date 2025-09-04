import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/routes/app_routes.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Applications"),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.settings),
            icon: Icon(Icons.person_outline),
          ),
          SizedBox(width: 12),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addApplication);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
