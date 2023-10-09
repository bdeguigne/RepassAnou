import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';

@RoutePage()
class DressingScreen extends StatelessWidget {
  const DressingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('Dressing').headlineMedium,
    );
  }
}
