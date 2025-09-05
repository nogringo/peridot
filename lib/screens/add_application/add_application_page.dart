import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';
import 'package:peridot/screens/add_application/add_this_app_view.dart';
import 'package:peridot/screens/add_application/choose_account_view.dart';
import 'package:peridot/screens/add_application/connect_an_app_view.dart';

class AddApplicationPage extends StatelessWidget {
  const AddApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddApplicationController());
    return Scaffold(
      appBar: AppBar(title: Text("Add an app")),
      body: GetBuilder<AddApplicationController>(
        builder: (c) {
          return Stepper(
            currentStep: c.currentStep,
            steps: [
              Step(
                isActive: c.currentStep == 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Choose the account"),
                    Builder(
                      builder: (context) {
                        if (c.currentStep == 0) {
                          return Container();
                        }

                        return NPicture(
                          ndk: Repository.ndk,
                          pubkey: c.selectedPubkey.value,
                          circleAvatarRadius: 14,
                        );
                      },
                    ),
                  ],
                ),
                content: ChooseAccountView(),
              ),
              Step(
                isActive: c.currentStep == 1,
                title: Text("Connect an app"),
                content: ConnectAnAppView(),
              ),
              Step(
                isActive: c.currentStep == 2,
                title: Text("Add this app ?"),
                content: AddThisAppView(),
              ),
            ],
            controlsBuilder: (_, __) => Container(),
          );
        },
      ),
    );
  }
}
