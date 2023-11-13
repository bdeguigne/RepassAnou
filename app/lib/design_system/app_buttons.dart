import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/theme.dart';

enum AppButtonType { elevated, outlined, text }

class AppButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final TextStyle? textStyle;
  final AppButtonType type;
  final Widget? icon;

  const AppButton._({
    this.text,
    required this.onPressed,
    required this.buttonStyle,
    required this.textStyle,
    this.type = AppButtonType.elevated,
    this.icon,
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

  factory AppButton.outlinedIcon(
      {required Widget icon, required VoidCallback onPressed}) {
    return AppButton._(
      onPressed: onPressed,
      buttonStyle: ButtonStyle(
        //border radius
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),

        side: MaterialStateProperty.all(
          const BorderSide(
            color: Color(0xFFF2F4F5),
            width: 1,
          ),
        ),
      ),
      textStyle: appTheme.textTheme.labelLarge?.copyWith(
        color: const Color(0xFF1D272F),
      ),
      type: AppButtonType.outlined,
      icon: icon,
    );
  }

  factory AppButton.text(
      {required String text, required VoidCallback onPressed}) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      buttonStyle: TextButton.styleFrom(),
      textStyle: appTheme.textTheme.labelLarge?.copyWith(
        color: const Color(0xFF1D272F),
      ),
      type: AppButtonType.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (type == AppButtonType.elevated) {
      return ElevatedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(
          text!,
          style: textStyle,
        ),
      );
    }
    if (type == AppButtonType.outlined) {
      return OutlinedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: icon,
      );
    }
    if (type == AppButtonType.text) {
      return TextButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(
          text!,
          style: textStyle,
        ),
      );
    }
    return Container();
  }
}
