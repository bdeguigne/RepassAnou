import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repasse_anou/presentation/design_system/layouts.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
