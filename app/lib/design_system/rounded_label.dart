import 'package:flutter/widgets.dart';
import 'package:repasse_anou/design_system/theme.dart';

class RoundedLabel extends StatelessWidget {
  const RoundedLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Text(
        label,
        style: appTheme.textTheme.labelMedium?.copyWith(
          color: const Color(0xFF33302E),
        ),
      ),
    );
  }
}
