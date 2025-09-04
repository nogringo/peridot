import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';

class AddApplicationPage extends StatelessWidget {
  const AddApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddApplicationController>(
      init: AddApplicationController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: Text(c.isConnected ? "Add this app ?" : "Connect an app"),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              if (!c.isConnected) ConnectAnAppView(),
              if (c.isConnected) AddThisAppView(),
              SizedBox(height: kToolbarHeight),
            ],
          ),
        );
      },
    );
  }
}

class ConnectAnAppView extends StatelessWidget {
  const ConnectAnAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Connect with Nostr connect URL",
          style: Get.textTheme.titleMedium,
        ),
        TextField(
          controller: AddApplicationController.to.nostrConnectFieldController,
          decoration: InputDecoration(hintText: "nostrconnect://"),
        ),
        Text("Connect with Bunker URL", style: Get.textTheme.titleMedium),
        Text(AddApplicationController.to.bunkerUrl.url),
      ],
    );
  }
}

class AddThisAppView extends StatelessWidget {
  const AddThisAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("App name", style: Get.textTheme.titleMedium),
        TextField(),
        Text("Requested permissions", style: Get.textTheme.titleMedium),
      ],
    );
  }
}
