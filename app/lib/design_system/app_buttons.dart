import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/app_loading.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';

enum AppButtonType { elevated, outlined, text }

class AppButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final ButtonStyle buttonStyle;
  final TextStyle? textStyle;
  final AppButtonType type;
  final Widget? icon;
  final bool isLoading;
  final bool expanded;

  const AppButton._({
    this.text,
    required this.onPressed,
    required this.buttonStyle,
    required this.textStyle,
    this.isLoading = false,
    this.type = AppButtonType.elevated,
    this.icon,
    this.expanded = false,
  });

  factory AppButton.primary({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool expanded = false,
  }) {
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
      isLoading: isLoading,
      expanded: expanded,
    );
  }

  factory AppButton.secondary({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
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
      isLoading: isLoading,
    );
  }

  factory AppButton.tertiary({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffEEEEEE),
        elevation: 0,
      ),
      textStyle: appTheme.textTheme.bodyMedium?.copyWith(
        color: const Color(0xFF1D272F),
        fontWeight: FontWeight.w400,
      ),
      isLoading: isLoading,
    );
  }

  factory AppButton.outlinedIcon({
    required Widget icon,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
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
      isLoading: isLoading,
    );
  }

  factory AppButton.text({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      buttonStyle: TextButton.styleFrom(),
      textStyle: appTheme.textTheme.labelLarge?.copyWith(
        color: const Color(0xFF1D272F),
      ),
      type: AppButtonType.text,
      isLoading: isLoading,
    );
  }

  factory AppButton.promoCode({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: br(7)),
      ),
      textStyle: appTheme.textTheme.headlineLarge?.copyWith(
        color: Colors.white,
        fontSize: sp(11),
      ),
      isLoading: isLoading,
    );
  }

  Widget _buildContentWithAnimatedLoading(
      Widget content, bool loading, Color? loadingColor,
      {bool small = false}) {
    return AnimatedCrossFade(
      layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              key: bottomChildKey,
              child: bottomChild,
            ),
            Positioned(
              key: topChildKey,
              child: topChild,
            ),
          ],
        );
      },
      crossFadeState:
          loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
      firstChild: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: small ? 16 : 24,
          height: small ? 16 : 24,
          child: AppLoading(
            color: loadingColor,
          ),
        ),
      ),
      secondChild: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (type == AppButtonType.elevated) {
      return SizedBox(
        width: expanded ? double.infinity : null,
        height: expanded ? 64 : null,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: onPressed,
          child: _buildContentWithAnimatedLoading(
            Text(
              text!,
              style: textStyle,
            ),
            isLoading,
            Colors.white,
          ),
        ),
      );
    }
    if (type == AppButtonType.outlined) {
      return OutlinedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: _buildContentWithAnimatedLoading(
          icon!,
          isLoading,
          null,
        ),
      );
    }
    if (type == AppButtonType.text) {
      return TextButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: _buildContentWithAnimatedLoading(
          Text(
            text!,
            style: textStyle,
          ),
          isLoading,
          null,
          small: true,
        ),
      );
    }
    return Container();
  }
}
