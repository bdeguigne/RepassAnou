import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:repasse_anou/design_system/app_checkbox.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/chip.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_belong_to.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

class AppDropdownMenuItem<T> {
  const AppDropdownMenuItem({
    required this.value,
    required this.label,
    this.right = false,
    this.type,
  });

  final T? value;
  final String label;
  final bool right;
  final DropDownInputWidget? type;
}

enum DropDownInputWidget { addNewMember, input }

enum DropDownType {
  simple,
  multiple,
  input,
}

class DropDown<T> extends HookWidget {
  final void Function(T?)? onChanged;
  final void Function(List<T?>)? onChangedMultiple;
  final List<AppDropdownMenuItem<T>>? items;
  final String? hint;
  final String? Function(T?)? validator;
  final T? value;
  final DropDownType type;
  final List<String> initialValues;

  const DropDown._({
    this.onChanged,
    this.onChangedMultiple,
    required this.items,
    required this.value,
    this.type = DropDownType.simple,
    this.hint,
    this.validator,
    this.initialValues = const [],
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
    List<String> initialValues = const [],
    String? Function(T?)? validator,
  }) {
    return DropDown<T>._(
      onChangedMultiple: onChanged,
      items: items,
      value: null,
      hint: hint,
      validator: validator,
      type: DropDownType.multiple,
      initialValues: initialValues,
    );
  }

  factory DropDown.input({
    void Function(List<T?>)? onChanged,
    List<AppDropdownMenuItem<T>>? items,
    String? hint,
    String? Function(T?)? validator,
  }) {
    return DropDown<T>._(
      onChangedMultiple: onChanged,
      items: items,
      value: null,
      hint: hint,
      validator: validator,
      type: DropDownType.input,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState<T?>(value);
    final selectedMultipleValue =
        useState<List<T?>>(value != null ? [value] : []);
    final selectedMultipleLabels = useState<List<String?>>([]);
    final isMenuOpen = useState<bool>(false);
    final itemsWithTextInput = useState<List<AppDropdownMenuItem<T>>>([]);
    final showInput = useState<bool>(false);
    final textEditingController = useTextEditingController();

    void handleInitialDataForMultipleSelect() {
      final labels =
          items?.where((element) => initialValues.contains(element.label));

      if (labels != null) {
        selectedMultipleLabels.value = List.from(selectedMultipleLabels.value
          ..addAll(
            labels.map((e) => e.label),
          ));

        selectedMultipleValue.value = labels.map((e) => e.value).toList();
      }
    }

    useEffect(() {
      handleInitialDataForMultipleSelect();

      if (type == DropDownType.input && items != null) {
        itemsWithTextInput.value.addAll(
          [
            const AppDropdownMenuItem(
              value: null,
              label: '+ Ajouter un membre',
              right: true,
              type: DropDownInputWidget.addNewMember,
            ),
            ...items!,
          ],
        );
      }
      return null;
    }, []);

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

    Widget buildItemSimple(String label) {
      return Text(
        label,
        style: bodyMedium.copyWith(
          color: const Color(0xff6E7590),
        ),
      );
    }

    Widget buildItemMultiple(T? value, String label) {
      return StatefulBuilder(
        builder: (context, menuSetState) {
          final isSelected = selectedMultipleValue.value.contains(value);
          return InkWell(
            onTap: () {
              //Make an new instance of the list (List.from) to trigger the change

              selectedMultipleValue.value = isSelected
                  ? List.from(selectedMultipleValue.value..remove(value))
                  : List.from(selectedMultipleValue.value..add(value));

              final label =
                  items?.where((element) => element.value == value).firstOrNull;

              selectedMultipleLabels.value = selectedMultipleLabels.value
                      .contains(label?.label)
                  ? List.from(
                      selectedMultipleLabels.value..remove(label?.label))
                  : List.from(selectedMultipleLabels.value..add(label?.label));

              //This rebuilds the dropdownMenu Widget to update the check mark
              menuSetState(() {});

              onChangedMultiple?.call(selectedMultipleValue.value);
            },
            child: RowSpacing(
              spacing: 8,
              children: [
                AppCheckbox(
                  value: isSelected,
                  onChanged: null,
                ),
                Text(
                  label,
                  style: bodyMedium.copyWith(
                    color: const Color(0xff6E7590),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget buildItem(AppDropdownMenuItem<T> item) {
      switch (type) {
        case DropDownType.simple:
          return buildItemSimple(item.label);
        case DropDownType.multiple:
          return buildItemMultiple(item.value, item.label);
        case DropDownType.input:
          if (item.type == DropDownInputWidget.addNewMember) {
            return StatefulBuilder(
              builder: (context, menuSetState) => TextButton(
                onPressed: () {
                  // showInput.value = true;
                  itemsWithTextInput.value = List.from([
                    const AppDropdownMenuItem(
                      value: UserDressingBelongsTo(
                        id: 'test',
                        name: 'test',
                      ),
                      label: 'OKOKOKO',
                    )
                  ]);
                  menuSetState(() {});
                },
                child: Text(
                  item.label,
                  style: appTheme.textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff6E7590),
                  ),
                ),
              ),
            );
          } else {
            return buildItemSimple(item.label);
          }
      }
    }

    Widget buildSelectedItem(AppDropdownMenuItem<T> item) {
      switch (type) {
        case DropDownType.simple:
          return buildSelectedItemSimple(item.label);
        case DropDownType.multiple:
          return buildSelectedItemMultiple(selectedMultipleLabels.value);
        case DropDownType.input:
          return buildSelectedItemSimple(item.label);
      }
    }

    Widget buildDropdown(bool isOpen) {
      return DropdownButton2<T>(
        isExpanded: true,
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
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
        value: type == DropDownType.multiple
            ? selectedMultipleValue.value.isEmpty
                ? null
                : selectedMultipleValue.value.last
            : selectedValue.value,
        onChanged: (value) {
          if ((type != DropDownType.multiple)) {
            selectedValue.value = value;
            onChanged?.call(value);
          }
        },
        items: type == DropDownType.input
            ? showInput.value == true
                ? [
                    DropdownMenuItem<T>(
                      value: null,
                      child: AppTextField(
                        controller: textEditingController,
                        hint: 'Nom du nouveau membre',
                      ),
                    )
                  ]
                : itemsWithTextInput.value
                    .map(
                      (item) => DropdownMenuItem<T>(
                        value: item.value,
                        alignment: item.right
                            ? AlignmentDirectional.centerEnd
                            : AlignmentDirectional.centerStart,
                        child: buildItem(item),
                      ),
                    )
                    .toList()
            : items
                ?.map(
                  (item) => DropdownMenuItem<T>(
                    value: item.value,
                    //disable default onTap to avoid closing menu when selecting an item on multiple dropdown
                    enabled: type != DropDownType.multiple,
                    child: buildItem(item),
                  ),
                )
                .toList(),
        selectedItemBuilder: items != null
            ? (context) {
                return items!.map((item) {
                  return buildSelectedItem(item);
                }).toList();
              }
            : null,
        dropdownStyleData: const DropdownStyleData(
          direction: DropdownDirection.left,
          maxHeight: 200,
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
