import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/theme.dart';

enum AppTextFieldType { outlined, filled }

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

  const AppTextField._({
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
    required this.type,
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
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
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: type == AppTextFieldType.filled
                ? const Color(0xff9CA4AB)
                : hintText,
            fontFamily: 'Nunito',
          ),
          enabledBorder:
              border ? appOutlineInputBorder : appOutlineTransparentInputBorder,
          border:
              border ? appOutlineInputBorder : appOutlineTransparentInputBorder,
          focusedBorder:
              border ? appOutlineInputBorder : appOutlineTransparentInputBorder,
        ),
        keyboardType: keyboardType,
        autocorrect: autocorrect,
        obscureText: obscureText,
      ),
    );
  }
}
