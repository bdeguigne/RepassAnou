import 'package:flutter/material.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, this.hint});

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        cursorHeight: 16,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint ?? '',
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: hintText,
            fontFamily: 'Nunito',
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 183, 196, 235), // Couleur de bordure
              width: 1, // Largeur de bordure
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 183, 196, 235), // Couleur de bordure
              width: 1, // Largeur de bordure
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 157, 168, 199), // Couleur de bordure
              width: 1, // Largeur de bordure
            ),
          ),
        ),
      ),
    );
  }
}
