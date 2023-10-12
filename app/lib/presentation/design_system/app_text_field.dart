import 'package:flutter/material.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.onChanged,
    this.validator,
  });

  final String? hint;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 40,
      child: TextFormField(
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
          enabledBorder: appOutlineInputBorder,
          border: appOutlineInputBorder,
          focusedBorder: appOutlineInputBorder,
        ),
      ),
    );
  }
}
