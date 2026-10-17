import 'package:flutter/material.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/layouts/home_large_layout.dart';
import 'package:peridot/screens/home/layouts/home_small_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController()..init();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;
        if (isWide) {
          return HomeLargeLayout(controller: controller);
        }
        return HomeSmallLayout(controller: controller);
      },
    );
  }
}
