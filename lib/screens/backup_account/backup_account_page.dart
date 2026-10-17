import 'package:flutter/material.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/backup_account/backup_account_controller.dart';
import 'package:peridot/widgets/border_area_view.dart';
import 'package:peridot/widgets/responsive_list_view.dart';

class BackupAccountPage extends StatefulWidget {
  final String pubkey;

  const BackupAccountPage({super.key, required this.pubkey});

  @override
  State<BackupAccountPage> createState() => _BackupAccountPageState();
}

class _BackupAccountPageState extends State<BackupAccountPage> {
  late final controller = BackupAccountController(widget.pubkey);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pubkey = widget.pubkey;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.backupThisAccount)),
      body: ResponsiveListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: NPicture(
              ndkFlutter: Repository.ndkFlutter,
              pubkey: pubkey,
            ),
            title: NName(ndkFlutter: Repository.ndkFlutter, pubkey: pubkey),
          ),
          SizedBox(height: 16),
          SecureBackupView(controller: controller),
          SizedBox(height: 16),
          UnsecureBackupView(controller: controller),
          SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}

class SecureBackupView extends StatelessWidget {
  final BackupAccountController controller;

  const SecureBackupView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BorderAreaView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: Chip(
              label: Text(l10n.recommended),
              shape: StadiumBorder(),
              avatar: Icon(Icons.favorite),
            ),
          ),
          SizedBox(height: 8),
          Text(
            l10n.backupSecurelyWithPassword,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextField(
            controller: controller.passwordFieldController,
            obscureText: true,
            decoration: InputDecoration(hintText: l10n.password),
            onChanged: controller.onPasswordFieldChanged,
          ),
          SizedBox(height: 16),
          ListenableBuilder(
            listenable: controller,
            builder: (context, _) {
              return FilledButton(
                onPressed: controller.canEncrypt
                    ? () => controller.copySecureBackup(context)
                    : null,
                child: Text(l10n.copyEncryptedVersion),
              );
            },
          ),
        ],
      ),
    );
  }
}

class UnsecureBackupView extends StatelessWidget {
  final BackupAccountController controller;

  const UnsecureBackupView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final themeData = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red,
        brightness: Theme.of(context).brightness,
      ),
    );
    return Theme(
      data: themeData,
      child: BorderAreaView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: Chip(
                label: Text(l10n.notRecommended),
                shape: StadiumBorder(),
                avatar: Icon(Icons.warning_rounded),
              ),
            ),
            SizedBox(height: 8),
            Text(
              l10n.backupInsecurelyWithoutPassword,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            FilledButton(
              onPressed: () => controller.copyUnsecureBackup(context),
              child: Text(l10n.copyUnencryptedVersion),
            ),
          ],
        ),
      ),
    );
  }
}
