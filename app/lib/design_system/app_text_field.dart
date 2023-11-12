import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/theme.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.onChanged,
    this.validator,
    this.controller,
    this.border = true,
    this.focusNode,
    this.textInputAction,
  });

  final String? hint;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool border;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 40,
      child: TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        focusNode: focusNode,
        cursorHeight: 16,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          isDense: true,
          hintText: hint ?? '',
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: hintText,
            fontFamily: 'Nunito',
          ),
          enabledBorder:
              border ? appOutlineInputBorder : appOutlineTransparentInputBorder,
          border:
              border ? appOutlineInputBorder : appOutlineTransparentInputBorder,
          focusedBorder:
              border ? appOutlineInputBorder : appOutlineTransparentInputBorder,
        ),
      ),
    );
  }
}
