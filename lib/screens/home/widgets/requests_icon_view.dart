import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/home/home_controller.dart';

class RequestsIconView extends StatelessWidget {
  const RequestsIconView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Repository>(
      builder: (_) {
        return GetBuilder<HomeController>(
          builder: (c) {
            final child = Icon(Icons.inbox);

            if (c.pendingRequests.isEmpty) return child;

            return Badge(
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: Text(c.pendingRequests.length.toString()),
              child: child,
            );
          },
        );
      },
    );
  }
}
