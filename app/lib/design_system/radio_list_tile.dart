import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';

class AppRadioListTile<T> extends StatelessWidget {
  const AppRadioListTile({
    super.key,
    required this.title,
    required this.onChanged,
    required this.value,
    required this.groupValue,
    this.showError = false,
  });

  final T value;
  final T? groupValue;
  final String title;
  final void Function(T?)? onChanged;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        borderRadius: br(15),
        border: Border.all(
          color: showError == true
              ? error
              : value == groupValue
                  ? Colors.black
                  : navBarUnselectedItemColor,
          width: 1,
        ),
      ),
      child: Theme(
        data: appTheme.copyWith(
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all(navBarUnselectedItemColor),
          ),
        ),
        child: RadioListTile<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          splashRadius: 15.r,
          activeColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: br(15),
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            title,
            style: headlineLarge.copyWith(
              fontSize: sp(13),
            ),
          ),
          contentPadding: EdgeInsets.only(
            left: 20.w,
            right: 13.w,
          ),
        ),
      ),
    );
  }
}
