import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/app_loading.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

enum AppTextFieldType { outlined, filled, button }

class AppTextField extends StatelessWidget {
  final String? hint;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final InputBorder? border;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final bool obscureText;
  final AppTextFieldType type;
  final VoidCallback? onTap;
  final String? value;
  final String? errorMessage;
  final Widget? prefixIcon;
  final bool isSearchLoading;
  final Widget? suffix;

  const AppTextField._({
    required this.type,
    this.hint,
    this.onChanged,
    this.validator,
    this.controller,
    this.border,
    this.focusNode,
    this.textInputAction,
    this.keyboardType,
    this.autocorrect = true,
    this.obscureText = false,
    this.onTap,
    this.value,
    this.errorMessage,
    this.prefixIcon,
    this.isSearchLoading = false,
    this.suffix,
  });

  factory AppTextField.outlined({
    String? hint,
    void Function(String value)? onChanged,
    String? Function(String?)? validator,
    TextEditingController? controller,
    InputBorder border = appOutlineInputBorder,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    bool autocorrect = true,
    bool obscureText = false,
    Widget? prexifIcon,
    bool isSearchLoading = false,
    Widget? suffix,
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
      prefixIcon: prexifIcon,
      isSearchLoading: isSearchLoading,
      suffix: suffix,
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
    Widget? prefixIcon,
    void Function(String? value)? onSearchFieldChanged,
    bool isSearchLoading = false,
    InputBorder? border = appOutlineTransparentInputBorder,
    Widget? suffix,
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
      type: AppTextFieldType.filled,
      prefixIcon: prefixIcon,
      isSearchLoading: isSearchLoading,
      suffix: suffix,
    );
  }

  factory AppTextField.button({
    String? hint,
    String? value,
    VoidCallback? onTap,
    String? errorMessage,
  }) {
    return AppTextField._(
      hint: hint,
      border: appOutlineTransparentInputBorder,
      onTap: onTap,
      value: value,
      type: AppTextFieldType.button,
      errorMessage: errorMessage,
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
              : AppColors.hintText,
      fontFamily: 'Nunito',
    );

    return type == AppTextFieldType.button
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppInkWell(
                onTap: onTap,
                child: Container(
                  // height: 40,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: ShapeDecoration(
                    color: AppColors.lightGrey,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: (type == AppTextFieldType.button &&
                                errorMessage != null)
                            ? AppColors.error
                            : AppColors.lightGrey,
                      ),
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
              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    errorMessage ?? '',
                    style: const TextStyle(
                        color: AppColors.error,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                )
            ],
          )
        : TextFormField(
            textInputAction: textInputAction,
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              fillColor: AppColors.lightGrey,
              filled: type == AppTextFieldType.filled,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              isDense: true,
              hintText: hint ?? '',
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: prefixIcon,
                    )
                  : null,
              suffixIconConstraints: isSearchLoading
                  ? const BoxConstraints(minWidth: 12, minHeight: 12)
                  : null,
              suffixIcon: isSearchLoading
                  ? const SizedBox(
                      width: 26,
                      height: 18,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: AppLoading(),
                      ),
                    )
                  : suffix,
              hintStyle: hintStyle,
              enabledBorder: border,
              border: border,
              focusedBorder: border,
            ),
            keyboardType: keyboardType,
            autocorrect: autocorrect,
            obscureText: obscureText,
          );
  }
}
