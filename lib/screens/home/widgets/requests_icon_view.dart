import 'package:flutter/material.dart';
import 'package:peridot/controllers/repository.dart';
import 'package:peridot/screens/home/home_controller.dart';

class RequestsIconView extends StatelessWidget {
  final HomeController controller;

  const RequestsIconView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Repository.to,
      builder: (context, _) {
        return ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            final c = controller;
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
