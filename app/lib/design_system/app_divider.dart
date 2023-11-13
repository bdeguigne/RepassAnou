import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/theme.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.middleText,
  });

  final String? middleText;

  Divider get _divider => const Divider(
        color: Color(0xFFF2F4F5),
        thickness: 1,
        height: 2,
      );

  @override
  Widget build(BuildContext context) {
    return middleText == null
        ? _divider
        : Row(
            children: [
              Expanded(child: _divider),
              const SizedBox(width: 16),
              Text(
                middleText!,
                style: labelMedium.copyWith(
                  color: const Color(0xFF090A0A),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(child: _divider)
            ],
          );
  }
}
