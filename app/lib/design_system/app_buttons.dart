import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/theme.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final TextStyle? textStyle;

  const AppButton._({
    required this.text,
    required this.onPressed,
    required this.buttonStyle,
    required this.textStyle,
  });

  factory AppButton.primary(
      {required String text, required VoidCallback onPressed}) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      textStyle: appTheme.textTheme.headlineLarge?.copyWith(
        color: Colors.white,
      ),
    );
  }

  factory AppButton.secondary(
      {required String text, required VoidCallback onPressed}) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffFED8CD),
        elevation: 0,
      ),
      textStyle: appTheme.textTheme.labelLarge?.copyWith(
        color: const Color(0xFF1D272F),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
