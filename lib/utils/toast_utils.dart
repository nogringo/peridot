import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:toastification/toastification.dart';

void showCopyToast([BuildContext? context]) {
  context ??= AppRoutes.navigatorKey.currentContext;

  if (context == null) return;

  final theme = Theme.of(context);
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.simple,
    title: Text(AppLocalizations.of(context)!.copied),
    alignment: Alignment.bottomCenter,
    autoCloseDuration: const Duration(seconds: 4),
    borderRadius: BorderRadius.circular(100.0),
    closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
    applyBlurEffect: true,
    backgroundColor: theme.colorScheme.surface,
    foregroundColor: theme.colorScheme.onSurface,
    borderSide: BorderSide(color: theme.dividerColor, width: 2),
  );
  announce(AppLocalizations.of(context)!.copied, context);
}

void showErrorToast(String message, [BuildContext? context]) {
  context ??= AppRoutes.navigatorKey.currentContext;

  if (context == null) return;

  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    title: Text(message),
    alignment: Alignment.bottomCenter,
    autoCloseDuration: const Duration(seconds: 5),
    borderRadius: BorderRadius.circular(12.0),
    closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
    applyBlurEffect: false,
    // flatColored always paints a red.shade50 background, so the text needs a dark red to stay readable.
    foregroundColor: Colors.red.shade900,
    borderSide: const BorderSide(color: Colors.red, width: 2),
  );
  announce(message, context, assertiveness: Assertiveness.assertive);
}

// toastification exposes no live region, so screen readers never read toasts on their own.
void announce(
  String message,
  BuildContext context, {
  Assertiveness assertiveness = Assertiveness.polite,
}) {
  SemanticsService.sendAnnouncement(
    View.of(context),
    message,
    Directionality.of(context),
    assertiveness: assertiveness,
  );
}
