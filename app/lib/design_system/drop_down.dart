import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:repasse_anou/design_system/theme.dart';

class DropDown<T> extends HookWidget {
  const DropDown({
    required this.onChanged,
    required this.items,
    required this.value,
    this.hint,
    this.validator,
    super.key,
  });

  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final String? hint;
  final String? Function(T?)? validator;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState<T?>(null);
    final isMenuOpen = useState<bool>(false);

    Widget buildDropdown(bool isOpen) {
      return DropdownButton2<T>(
        isExpanded: true,
        hint: Text(
          hint ?? '',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: hintText,
            fontFamily: 'Nunito',
          ),
        ),
        iconStyleData: IconStyleData(
          icon: isOpen
              ? const Icon(Icons.keyboard_arrow_up)
              : const Icon(Icons.keyboard_arrow_down),
        ),
        buttonStyleData: ButtonStyleData(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: isOpen
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20))
                : const BorderRadius.all(
                    Radius.circular(20),
                  ),
            border: const Border.fromBorderSide(
              BorderSide(
                color: Color(0xffDCE1EF),
              ),
            ),
            // border: appOutlineInputBorder,
          ),
        ),
        onMenuStateChange: (isOpen) {
          isMenuOpen.value = isOpen;
        },
        value: selectedValue.value,
        onChanged: (value) {
          selectedValue.value = value;
          onChanged?.call(value);
        },
        items: items,
        selectedItemBuilder: items != null
            ? (context) => items!.map((item) {
                  return value != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 8.0),
                          child: Text(value!).bodyLarge,
                        )
                      : Container();
                }).toList()
            : null,
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 250,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 24,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
      );
    }

    return DropdownButtonHideUnderline(
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 250),
        crossFadeState: isMenuOpen.value
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        firstChild: buildDropdown(false),
        secondChild: buildDropdown(true),
      ),
    );
  }
}
