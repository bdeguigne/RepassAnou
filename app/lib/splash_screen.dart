import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/layouts.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout.standard(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
