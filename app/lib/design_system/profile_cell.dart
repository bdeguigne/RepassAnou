import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';

class ProfileCell extends ConsumerWidget {
  const ProfileCell({
    super.key,
    required this.label,
    required this.icon,
    required this.route,
  });
  final String label;
  final Widget icon;
  final PageRouteInfo? route;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppInkWell(
      onTap: () {
        if (route != null) {
          ref.read(navigationControllerProvider).push(route!);
        }
      },
      radius: BorderRadius.zero,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.lightGrey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: icon,
                  ),
                  sw(20),
                  Text(
                    label,
                    style: appTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
