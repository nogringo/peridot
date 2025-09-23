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
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.createOne,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8),
                    FilledButton(
                      onPressed: c.createAccount,
                      child: Text(l10n.create),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            l10n.or,
                            style: TextStyle(
                              color: Get.theme.colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      l10n.importOne,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller:
                          AddPrivkeyController.to.privkeyFieldController,
                      decoration: InputDecoration(
                        labelText: l10n.nsecNcryptsecOrHex,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
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
                            l10n.ncryptsecPassword,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          TextField(
                            controller: AddPrivkeyController
                                .to
                                .ncryptsecPasswordFieldController,
                            decoration: InputDecoration(
                              hintText: l10n.yourPassword,
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 8),
                    FilledButton(
                      onPressed: AddPrivkeyController.to.importPrivateKey,
                      child: Text(l10n.importKey),
                    ),
                    SizedBox(height: kToolbarHeight),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
