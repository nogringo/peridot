import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final hasAccounts = Repository.to.usersPubkeys.isNotEmpty;

    if (!hasAccounts && route != AppRoutes.addPrivkey) {
      return RouteSettings(name: AppRoutes.addPrivkey);
    }

    if (hasAccounts && route == AppRoutes.addPrivkey) {
      return RouteSettings(name: AppRoutes.applications);
    }

    return null;
  }
}
