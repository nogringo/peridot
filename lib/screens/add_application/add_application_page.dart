import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';

class AddApplicationPage extends StatelessWidget {
  const AddApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddApplicationController());
    return Scaffold(
      appBar: AppBar(title: Text("Add an app")),
      body: Obx(() {
        return Stepper(
          currentStep: AddApplicationController.to.currentStep.value,
          steps: [
            Step(
              isActive: AddApplicationController.to.currentStep.value == 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Choose the account"),
                  Builder(
                    builder: (context) {
                      if (AddApplicationController.to.currentStep.value == 0) {
                        return Container();
                      }

                      return NPicture(
                        ndk: Repository.ndk,
                        pubkey:
                            AddApplicationController.to.selectedPubkey.value,
                        circleAvatarRadius: 14,
                      );
                    },
                  ),
                ],
              ),
              content: ChooseAccountView(),
            ),
            Step(
              isActive: AddApplicationController.to.currentStep.value == 1,
              title: Text("Connect an app"),
              content: ConnectAnAppView(),
            ),
            Step(
              isActive: AddApplicationController.to.currentStep.value == 2,
              title: Text("Add this app ?"),
              content: AddThisAppView(),
            ),
          ],
          onStepContinue: AddApplicationController.to.onStepContinue,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            if (AddApplicationController.to.currentStep.value == 1) {
              return Container();
            }

            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Align(
                alignment: AlignmentGeometry.bottomLeft,
                child: GetBuilder<AddApplicationController>(
                  builder: (c) {
                    return TextButton(
                      onPressed: c.canContinue ? details.onStepContinue : null,
                      child: const Text('Continue'),
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class ChooseAccountView extends StatelessWidget {
  const ChooseAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: Repository.ndk.accounts.accounts.keys.map((pubkey) {
        return Obx(() {
          Widget? trailing;
          void Function()? onTap;

          final isSelected =
              AddApplicationController.to.selectedPubkey.value == pubkey;
          if (isSelected) {
            trailing = Icon(
              Icons.check_circle,
              color: Theme.of(context).colorScheme.primary,
            );
          } else {
            onTap = () {
              AddApplicationController.to.selectedPubkey.value = pubkey;
            };
          }

          return ListTile(
            leading: NPicture(ndk: Repository.ndk, pubkey: pubkey),
            title: NName(ndk: Repository.ndk, pubkey: pubkey),
            trailing: trailing,
            onTap: onTap,
          );
        });
      }).toList(),
    );
  }
}

class ConnectAnAppView extends StatelessWidget {
  const ConnectAnAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BorderAreaView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Connect with Nostr connect URL",
                style: Get.textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              TextField(
                controller:
                    AddApplicationController.to.nostrConnectFieldController,
                decoration: InputDecoration(
                  hintText: "nostrconnect://",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        BorderAreaView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Connect with Bunker URL", style: Get.textTheme.titleMedium),
              SizedBox(height: 8),
              GetBuilder<AddApplicationController>(
                builder: (c) {
                  return SelectableText(c.bunkerUrl?.url ?? "");
                },
              ),
              SizedBox(height: 12),
              OutlinedButton(onPressed: () {}, child: Text("Copy Bunker URL")),
            ],
          ),
        ),
      ],
    );
  }
}

class AddThisAppView extends StatelessWidget {
  const AddThisAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("App name", style: Get.textTheme.titleMedium),
        TextField(),
        SizedBox(height: 16),
        Text("Requested permissions", style: Get.textTheme.titleMedium),
      ],
    );
  }
}
