import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
    this.cartQuentity,
    this.onTap,
  });

  final int? cartQuentity;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: SizedBox(
            width: 14,
            height: 14,
            child: AppIcons.bag,
          ),
          onPressed: () => onTap?.call(),
        ),
        if (cartQuentity != null && cartQuentity! > 0)
          Positioned(
            right: -5,
            top: -5,
            child: ClipOval(
              child: Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    cartQuentity.toString(),
                    style: headlineLarge.copyWith(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: sp(7),
                    ),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
