import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:peridot/config.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/services/notification_service.dart';
import 'package:nostr_widgets/l10n/app_localizations.dart' as nostr_widgets;
import 'package:toastification/toastification.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ndk = Ndk.defaultConfig();
  Get.put(ndk);

  final repository = Repository();
  await repository.loadApp();
  Get.put(repository);

  final notificationService = await NotificationService().init();
  Get.put(notificationService);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        title: appTitle,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          nostr_widgets.AppLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        darkTheme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            brightness: Brightness.dark,
          ),
        ),
        themeMode: ThemeMode.system,
        initialRoute: AppRoutes.applications,
        getPages: AppRoutes.pages,
      ),
    );
  }
}
