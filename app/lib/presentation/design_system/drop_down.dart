import 'package:flutter/material.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';

class DropDown<T> extends StatelessWidget {
  const DropDown({
    required this.onChanged,
    required this.items,
    this.hint,
    this.validator,
    super.key,
  });

  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final String? hint;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.black,
      ),
      validator: validator,
      dropdownColor: const Color(0xffECF1F6),
      borderRadius: BorderRadius.circular(10),
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
      onChanged: onChanged,
      items: items,
    );
  }
}
