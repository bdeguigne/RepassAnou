import 'package:flutter/material.dart';

class AppInkWell extends StatelessWidget {
  const AppInkWell({
    required this.child,
    super.key,
    this.onTap,
    this.onLongPress,
    this.radius,
    this.transparent = false,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BorderRadius? radius;
  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: transparent ? Colors.transparent : null,
              highlightColor: transparent ? Colors.transparent : null,
              onTap: onTap,
              onLongPress: onLongPress,
              borderRadius: radius ?? BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
