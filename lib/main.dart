import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndk/ndk.dart';
import 'package:peridot/config.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:nostr_widgets/l10n/app_localizations.dart' as nostr_widgets;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ndk = Ndk.defaultConfig();
  Get.put(ndk);

  final repository = Repository();
  await repository.loadApp();
  Get.put(repository);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      localizationsDelegates: [nostr_widgets.AppLocalizations.delegate],
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
    );
  }
}
