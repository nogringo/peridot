import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/home/home_shell.dart';
import 'package:peridot/screens/settings/default_bunker_relays_view.dart';
import 'package:peridot/screens/settings/logged_accounts_view.dart';
import 'package:peridot/screens/settings/system_settings_view.dart';
import 'package:peridot/widgets/responsive_list_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        // The bottom bar is hidden here, this is the way back on small screens.
        leading: isWideLayout(context)
            ? null
            : BackButton(onPressed: () => HomeScope.of(context).showLastTab()),
        title: Text(l10n.settings),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: const [
          LoggedAccountsView(),
          SizedBox(height: 16),
          DefaultBunkerRelaysView(),
          SizedBox(height: 16),
          SystemSettingsView(),
          SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
