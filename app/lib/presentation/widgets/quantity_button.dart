import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';
import 'package:repasse_anou/presentation/widgets/ink_well.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({
    super.key,
    this.onQuantityChanged,
  });

  final void Function(int quantity)? onQuantityChanged;

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 30,
      decoration: ShapeDecoration(
        color: greyButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppInkWell(
              onTap: () {
                if (_quantity > 0) {
                  setState(() {
                    _quantity -= 1;
                  });
                  widget.onQuantityChanged?.call(_quantity);
                }
              },
              radius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: SizedBox(
                height: double.infinity,
                child: Center(child: const Text('-').displayMedium),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(_quantity.toString()).displayMedium,
          ),
          Expanded(
              child: AppInkWell(
            onTap: () {
              setState(() {
                _quantity += 1;
              });
              widget.onQuantityChanged?.call(_quantity);
            },
            radius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: SizedBox(
              height: double.infinity,
              child: Center(child: const Text('+').displayMedium),
            ),
          )),
        ],
      ),
    );
  }
}
