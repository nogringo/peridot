import 'package:flutter/material.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/screens/add_privkey/add_privkey_controller.dart';

class AddPrivkeyPage extends StatefulWidget {
  const AddPrivkeyPage({super.key});

  @override
  State<AddPrivkeyPage> createState() => _AddPrivkeyPageState();
}

class _AddPrivkeyPageState extends State<AddPrivkeyPage> {
  final c = AddPrivkeyController();

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: c,
      builder: (context, _) {
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
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.5),
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
                      controller: c.privkeyFieldController,
                      obscureText: !c.isPrivkeyVisible,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        labelText: l10n.nsecNcryptsecOrHex,
                        errorText: c.privkeyError,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        suffixIcon: IconButton(
                          onPressed: c.togglePrivkeyVisibility,
                          tooltip: c.isPrivkeyVisible
                              ? l10n.hidePrivateKey
                              : l10n.showPrivateKey,
                          icon: Icon(
                            c.isPrivkeyVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      onChanged: c.onPrivkeyFieldChanged,
                    ),
                    if (c.isNcryptsec)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            l10n.ncryptsecPassword,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          TextField(
                            controller: c.ncryptsecPasswordFieldController,
                            obscureText: !c.isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: l10n.yourPassword,
                              errorText: c.passwordError,
                              suffixIcon: IconButton(
                                onPressed: c.togglePasswordVisibility,
                                tooltip: c.isPasswordVisible
                                    ? l10n.hidePassword
                                    : l10n.showPassword,
                                icon: Icon(
                                  c.isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            onChanged: c.onPasswordFieldChanged,
                          ),
                        ],
                      ),
                    SizedBox(height: 8),
                    FilledButton(
                      onPressed: () => c.importPrivateKey(context),
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
