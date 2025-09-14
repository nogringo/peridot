import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_privkey/add_privkey_controller.dart';

class AddPrivkeyPage extends StatelessWidget {
  const AddPrivkeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPrivkeyController>(
      init: AddPrivkeyController(),
      builder: (c) {
        final l10n = AppLocalizations.of(context)!;
        return Scaffold(
          appBar: AppBar(title: Text(l10n.addPrivateKey)),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              Text(
                "Nsec, ncryptsec or hex",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              TextField(
                controller: AddPrivkeyController.to.privkeyFieldController,
                onChanged: AddPrivkeyController.to.onPrivkeyFieldChanged,
              ),
              Obx(() {
                if (!AddPrivkeyController.to.isNcryptsec.value) {
                  return Container();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      "Ncryptsec password",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    TextField(
                      controller: AddPrivkeyController
                          .to
                          .ncryptsecPasswordFieldController,
                      decoration: InputDecoration(hintText: l10n.yourPassword),
                    ),
                  ],
                );
              }),
              SizedBox(height: kToolbarHeight),
            ],
          ),
        );
      },
    );
  }
}
