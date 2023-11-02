import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:repasse_anou/design_system/chip.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

class AppDropdownMenuItem<T> {
  const AppDropdownMenuItem({
    required this.value,
    required this.label,
  });

  final T value;
  final String label;
}

class DropDown<T> extends HookWidget {
  final void Function(T?)? onChanged;
  final void Function(List<T?>)? onChangedMultiple;
  final List<AppDropdownMenuItem<T>>? items;
  final String? hint;
  final String? Function(T?)? validator;
  final T? value;
  final bool multiple;

  const DropDown._({
    this.onChanged,
    this.onChangedMultiple,
    required this.items,
    required this.value,
    this.multiple = false,
    this.hint,
    this.validator,
    super.key,
  });

  factory DropDown.simple({
    void Function(T?)? onChanged,
    List<AppDropdownMenuItem<T>>? items,
    String? hint,
    T? value,
    String? Function(T?)? validator,
  }) {
    return DropDown<T>._(
      onChanged: onChanged,
      items: items,
      value: value,
      hint: hint,
      validator: validator,
    );
  }

  factory DropDown.multiple({
    void Function(List<T?>)? onChanged,
    List<AppDropdownMenuItem<T>>? items,
    String? hint,
    T? value,
    String? Function(T?)? validator,
  }) {
    return DropDown<T>._(
      onChangedMultiple: onChanged,
      items: items,
      value: value,
      hint: hint,
      validator: validator,
      multiple: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState<T?>(value);
    final selectedMultipleValue = useState<List<T?>>([value]);
    final selectedMultipleLabels = useState<List<String?>>([]);
    final isMenuOpen = useState<bool>(false);

    useEffect(() {
      final label =
          items?.where((element) => element.value == value).firstOrNull;
      if (label != null) {
        selectedMultipleLabels.value.add(label.label);
      }
      return null;
    }, [value]);

    Widget buildSelectedItemSimple(String value) {
      return Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
        child: Text(value).bodyLarge,
      );
    }

    Widget buildSelectedItemMultiple(List<String?> values) {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        scrollDirection: Axis.horizontal,
        children: values
            .map(
              (value) => value != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: AppChip(
                        label: value,
                        onPressed: () {
                          final label = items
                              ?.where((element) => element.label == value)
                              .firstOrNull;
                          if (label != null) {
                            selectedMultipleLabels.value = List.from(
                                selectedMultipleLabels.value
                                  ..remove(label.label));
                            selectedMultipleValue.value = List.from(
                                selectedMultipleValue.value
                                  ..remove(label.value));
                            onChangedMultiple
                                ?.call(selectedMultipleValue.value);
                          }
                        },
                      ),
                    )
                  : Container(),
            )
            .toList(),
      );
    }

    Widget buildDropdown(bool isOpen) {
      return DropdownButton2<T>(
        isExpanded: true,
        menuItemStyleData: const MenuItemStyleData(),
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
          ),
        ),
        onMenuStateChange: (isOpen) {
          isMenuOpen.value = isOpen;
        },
        value: multiple
            ? selectedMultipleLabels.value.isEmpty
                ? null
                : selectedValue.value
            : selectedValue.value,
        onChanged: (value) {
          if (multiple) {
            final label =
                items?.where((element) => element.value == value).firstOrNull;

            if (selectedMultipleLabels.value.contains(label?.label)) {
              selectedMultipleLabels.value.remove(label?.label);
            } else {
              selectedMultipleLabels.value.add(label?.label);
            }

            if (selectedMultipleValue.value.contains(value)) {
              selectedMultipleValue.value.remove(value);
            } else {
              selectedMultipleValue.value.add(value);
            }
            onChangedMultiple?.call(selectedMultipleValue.value);
          } else {
            selectedValue.value = value;
            onChanged?.call(value);
          }
        },
        items: items
            ?.map(
              (category) => DropdownMenuItem<T>(
                value: category.value,
                child: selectedMultipleLabels.value.contains(category.label) &&
                        multiple
                    ? RowSpacing(
                        spacing: 8,
                        children: [
                          const Icon(
                            Icons.check,
                            size: 14,
                            color: grey,
                          ),
                          Text(
                            category.label,
                            style: bodyMedium.copyWith(
                              color: const Color(0xff6E7590),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        category.label,
                        style: bodyMedium.copyWith(
                          color: const Color(0xff6E7590),
                        ),
                      ),
              ),
            )
            .toList(),
        selectedItemBuilder: items != null
            ? (context) {
                // add post frame callback to wait for the layout to be rendered
                return items!.map((item) {
                  return multiple
                      ? selectedMultipleLabels.value.isNotEmpty
                          ? buildSelectedItemMultiple(selectedMultipleLabels
                              .value
                              .map((e) => e)
                              .toList())
                          : Container()
                      : buildSelectedItemSimple(item.label);
                }).toList();
              }
            : null,
        dropdownStyleData: const DropdownStyleData(
          direction: DropdownDirection.left,
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
