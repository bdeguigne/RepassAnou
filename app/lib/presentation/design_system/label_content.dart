import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';

class LabelContent extends StatelessWidget {
  const LabelContent({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: bodyMedium.copyWith(color: blackVariant),
        ),
        const SizedBox(height: 5),
        child,
      ],
    );
  }
}
