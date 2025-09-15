import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:toastification/toastification.dart';

void showCopyToast([BuildContext? context]) {
  context ??= Get.context;

  if (context == null) return;

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
    backgroundColor: Get.theme.colorScheme.surface,
    foregroundColor: Get.theme.colorScheme.onSurface,
    borderSide: BorderSide(color: Get.theme.dividerColor, width: 2),
  );
}
