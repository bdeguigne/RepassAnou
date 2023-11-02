import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/theme.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE5E5E5),
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 5,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.close,
              color: grey,
              size: 14,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              label,
              style: appTheme.textTheme.labelMedium?.copyWith(
                color: const Color(0xFF33302E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
