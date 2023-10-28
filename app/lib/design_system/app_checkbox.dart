import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool? value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor: MaterialStateProperty.all<Color>(
          value == false ? Colors.white : Colors.black),
      checkColor: value == false ? Colors.black : Colors.white,
      side: BorderSide(
        color: value == true ? Colors.black : Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: value == true ? Colors.black : Colors.white,
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
