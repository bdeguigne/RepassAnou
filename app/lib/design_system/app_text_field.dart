import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

enum AppTextFieldType { outlined, filled, button }

class AppTextField extends StatelessWidget {
  final String? hint;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool border;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final bool obscureText;
  final AppTextFieldType type;
  final VoidCallback? onTap;
  final String? value;

  const AppTextField._({
    required this.type,
    this.hint,
    this.onChanged,
    this.validator,
    this.controller,
    this.border = true,
    this.focusNode,
    this.textInputAction,
    this.keyboardType,
    this.autocorrect = true,
    this.obscureText = false,
    this.onTap,
    this.value,
  });

  factory AppTextField.outlined({
    String? hint,
    void Function(String value)? onChanged,
    String? Function(String?)? validator,
    TextEditingController? controller,
    bool border = true,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    bool autocorrect = true,
    bool obscureText = false,
  }) {
    return AppTextField._(
      hint: hint,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      border: border,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      autocorrect: autocorrect,
      obscureText: obscureText,
      type: AppTextFieldType.outlined,
    );
  }

  factory AppTextField.filled({
    String? hint,
    void Function(String value)? onChanged,
    String? Function(String?)? validator,
    TextEditingController? controller,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    bool autocorrect = true,
    bool obscureText = false,
  }) {
    return AppTextField._(
      hint: hint,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      border: false,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      autocorrect: autocorrect,
      obscureText: obscureText,
      type: AppTextFieldType.filled,
    );
  }

  factory AppTextField.button({
    String? hint,
    String? value,
    VoidCallback? onTap,
  }) {
    return AppTextField._(
      hint: hint,
      border: false,
      onTap: onTap,
      value: value,
      type: AppTextFieldType.button,
    );
  }

  @override
  Widget build(BuildContext context) {
    final hintStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color:
          (type == AppTextFieldType.filled || type == AppTextFieldType.button)
              ? const Color(0xff9CA4AB)
              : hintText,
      fontFamily: 'Nunito',
    );

    return type == AppTextFieldType.button
        ? AppInkWell(
            onTap: () {},
            child: Container(
              // height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: ShapeDecoration(
                color: const Color(0xffECF1F6),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFECF1F6)),
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              width: const SizedBox.expand().width,
              child: RowSpacing(
                spacing: 10,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: AppIcons.circleGrey,
                  ),
                  value != null
                      ? Text(value!).bodyMedium
                      : Text(
                          hint ?? '',
                          style: hintStyle,
                        ),
                ],
              ),
            ),
          )
        : TextFormField(
            textInputAction: textInputAction,
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              fillColor: const Color(0xffECF1F6),
              filled: type == AppTextFieldType.filled,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              isDense: true,
              hintText: hint ?? '',
              hintStyle: hintStyle,
              enabledBorder: border
                  ? appOutlineInputBorder
                  : appOutlineTransparentInputBorder,
              border: border
                  ? appOutlineInputBorder
                  : appOutlineTransparentInputBorder,
              focusedBorder: border
                  ? appOutlineInputBorder
                  : appOutlineTransparentInputBorder,
            ),
            keyboardType: keyboardType,
            autocorrect: autocorrect,
            obscureText: obscureText,
          );
  }
}
