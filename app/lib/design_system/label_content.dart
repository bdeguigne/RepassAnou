import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:repasse_anou/design_system/theme.dart';

class LabelContent extends StatelessWidget {
  const LabelContent({
    required this.title,
    required this.child,
    this.titleTextStyle,
    this.spacing = 5,
    super.key,
  });

  final String title;
  final Widget child;
  final TextStyle? titleTextStyle;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: titleTextStyle ??
              bodyMedium.copyWith(color: AppColors.blackVariant),
        ),
        SizedBox(height: spacing),
        child,
      ],
    );
  }
}
