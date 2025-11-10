import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/layouts/home_large_layout.dart';
import 'package:peridot/screens/home/layouts/home_small_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController()..init());

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;
        if (isWide) {
          return HomeLargeLayout();
        }
        return HomeSmallLayout();
      },
    );
  }
}
