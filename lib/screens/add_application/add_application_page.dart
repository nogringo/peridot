import 'package:flutter/material.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_application/add_application_controller.dart';
import 'package:peridot/screens/add_application/app_configuration_view.dart';
import 'package:peridot/screens/add_application/choose_account_view.dart';
import 'package:peridot/screens/add_application/connect_an_app_view.dart';

class AddApplicationPage extends StatefulWidget {
  const AddApplicationPage({super.key});

  @override
  State<AddApplicationPage> createState() => _AddApplicationPageState();
}

class _AddApplicationPageState extends State<AddApplicationPage> {
  final c = AddApplicationController();

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.addAnApp)),
      body: ListenableBuilder(
        listenable: c,
        builder: (context, _) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 500;
              return Stepper(
                type: isWide ? StepperType.horizontal : StepperType.vertical,
                currentStep: c.currentStep,
                steps: [
                  Step(
                    isActive: c.currentStep == 0,
                    title: isWide
                        ? Text(l10n.chooseTheAccount)
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(l10n.chooseTheAccount),
                              Builder(
                                builder: (context) {
                                  if (c.currentStep == 0) {
                                    return Container();
                                  }

                                  return NPicture(
                                    ndkFlutter: Repository.ndkFlutter,
                                    pubkey: c.selectedPubkey,
                                    circleAvatarRadius: 14,
                                  );
                                },
                              ),
                            ],
                          ),
                    content: ChooseAccountView(controller: c),
                  ),
                  Step(
                    isActive: c.currentStep == 1,
                    title: Text(l10n.connectAnApp),
                    content: ConnectAnAppView(controller: c),
                  ),
                  Step(
                    isActive: c.currentStep == 2,
                    title: Text(l10n.appConfiguration),
                    content: AppConfigurationView(controller: c),
                  ),
                ],
                controlsBuilder: (_, _) => Container(),
              );
            },
          );
        },
      ),
    );
  }
}
