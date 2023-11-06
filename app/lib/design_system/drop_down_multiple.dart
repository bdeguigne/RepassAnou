import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/app_checkbox.dart';
import 'package:repasse_anou/design_system/chip.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

class DropDownMultiple extends StatefulWidget {
  const DropDownMultiple({super.key});

  @override
  State<DropDownMultiple> createState() => _DropDownMultipleState();
}

class _DropDownMultipleState extends State<DropDownMultiple> {
  final List<DressingMaterial> items = [
    DressingMaterial(id: 1, label: 'Item 1'),
    DressingMaterial(id: 2, label: 'Item 2'),
    DressingMaterial(id: 3, label: 'Item 3'),
    DressingMaterial(id: 4, label: 'Item 4'),
  ];

  final List<DressingMaterial> selectedItems = [];

  Widget buildSelectedItemMultiple(List<String?> values) {
    print('VALLLUUUUUUEEESS $values');
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
                            .where((element) => element.label == value)
                            .firstOrNull;

                        print('LABELLLLLLLLL $label');
                        // if (label != null) {
                        //   selectedMultipleLabels.value = List.from(
                        //       selectedMultipleLabels.value
                        //         ..remove(label.label));
                        //   selectedMultipleValue.value = List.from(
                        //       selectedMultipleValue.value..remove(label.value));
                        //   onChangedMultiple?.call(selectedMultipleValue.value);
                        // }
                      },
                    ),
                  )
                : Container(),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<DressingMaterial?>(
        isExpanded: true,
        hint: Text(
          'Select Items',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem<DressingMaterial?>(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: RowSpacing(
                    spacing: 8,
                    children: [
                      AppCheckbox(
                        value: isSelected,
                        onChanged: null,
                      ),
                      // const Icon(
                      //   Icons.check,
                      //   size: 14,
                      //   color: grey,
                      // ),
                      Text(
                        item.label,
                        style: bodyMedium.copyWith(
                          color: const Color(0xff6E7590),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: selectedItems.isEmpty ? null : selectedItems.last,
        onChanged: (value) {},
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return buildSelectedItemMultiple(
                selectedItems.map((e) => e.label).toList(),
              );
            },
          ).toList();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(left: 16, right: 8),
          height: 40,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
