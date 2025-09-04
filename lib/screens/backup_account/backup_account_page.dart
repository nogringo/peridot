import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nostr_widgets/nostr_widgets.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/backup_account/backup_account_controller.dart';

class BackupAccountPage extends StatelessWidget {
  const BackupAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pubkey = Get.parameters["pubkey"];

    if (pubkey == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Backup account")),
        body: Center(
          child: Text("No account selected", style: Get.textTheme.titleLarge),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Backup this account")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: NPicture(ndk: Repository.ndk, pubkey: pubkey),
            title: NName(ndk: Repository.ndk, pubkey: pubkey),
          ),
          SizedBox(height: 16),
          SecureBackupView(),
          SizedBox(height: 16),
          UnsecureBackupView(),
          SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}

class SecureBackupView extends StatelessWidget {
  const SecureBackupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: Chip(
              label: Text("Recommanded"),
              shape: StadiumBorder(),
              avatar: Icon(Icons.favorite),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Backup this account securly with a password",
            style: Get.textTheme.titleMedium,
          ),
          GetBuilder<BackupAccountController>(
            init: BackupAccountController(),
            builder: (c) {
              return TextField(
                controller: c.passwordFieldController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
                onChanged: c.onPasswordFieldChanged,
              );
            },
          ),
          SizedBox(height: 16),
          Obx(() {
            return FilledButton(
              onPressed: BackupAccountController.to.canEncrypt.value
                  ? () => BackupAccountController.to.copySecureBackup()
                  : null,
              child: Text("Copy encrypted version"),
            );
          }),
        ],
      ),
    );
  }
}

class UnsecureBackupView extends StatelessWidget {
  const UnsecureBackupView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red,
        brightness: Theme.of(context).brightness,
      ),
    );
    return Theme(
      data: themeData,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: themeData.dividerColor, width: 1.5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: Chip(
                label: Text("Unrecommanded"),
                shape: StadiumBorder(),
                avatar: Icon(Icons.warning_rounded),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Backup this account unsecurly without a password",
              style: Get.textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            FilledButton(
              onPressed: () => BackupAccountController.to.copyUnsecureBackup(),
              child: Text("Copy unencrypted version"),
            ),
          ],
        ),
      ),
    );
  }
}
