import 'package:flutter/material.dart';

class DressingColor extends StatelessWidget {
  const DressingColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      margin: const EdgeInsets.all(10),
      decoration: const ShapeDecoration(
        shape: OvalBorder(),
        color: Colors.black,
      ),
    );
  }
}
