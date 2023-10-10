import 'package:flutter/material.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    required this.title,
    required this.body,
    super.key,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 14),
              child: Text(title).headlineLarge,
            ),
            const Divider(),
            body,
          ],
        ),
      ),
    );
  }
}
