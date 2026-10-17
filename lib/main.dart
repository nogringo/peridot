import 'package:flutter/material.dart';
import 'package:ndk/ndk.dart';
import 'package:ndk_flutter/ndk_flutter.dart';
import 'package:nostr_bunker/nostr_bunker.dart';
import 'package:peridot/config.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/settings/controllers/settings_controller.dart';
import 'package:peridot/services/notification_service.dart';
import 'package:peridot/theme.dart';
import 'package:ndk_flutter/l10n/app_localizations.dart' as ndk_flutter;
import 'package:toastification/toastification.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ndk = Ndk(
    NdkConfig(
      cache: MemCacheManager(),
      eventVerifier: NdkEventVerifier(),
      eventSignerFactory: const NdkEventSignerFactory(),
    ),
  );
  Repository.ndk = ndk;
  Repository.ndkFlutter = NdkFlutter(ndk: ndk);

  final bunker = Bunker(
    ndk: ndk,
    defaultBunkerRelays: const [
      'wss://relay.nmail.li',
      'wss://relay.primal.net',
    ],
  );
  Repository.bunker = bunker;

  final repository = Repository();
  await repository.loadApp();
  Repository.to = repository;

  NotificationService.to = await NotificationService().init();

  SettingsController.to = SettingsController();
  await SettingsController.to.checkAutoStartStatus();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        title: appTitle,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          ndk_flutter.AppLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: appTheme(Brightness.light),
        darkTheme: appTheme(Brightness.dark),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
