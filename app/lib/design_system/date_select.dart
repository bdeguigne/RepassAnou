import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/utils/date_formatter.dart';

class DateSelect extends StatelessWidget {
  const DateSelect({
    super.key,
    required this.date,
    this.value = false,
    this.onChanged,
  });

  final DateTime date;
  final bool value;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      radius: br(10),
      onTap: () => onChanged?.call(!value),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: value ? Colors.black : greyButton,
          borderRadius: br(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: headlineLarge.copyWith(
                color: value ? Colors.white : Colors.black,
              ),
            ),
            // day as letter (ex: M for Monday)
            Text(
              formaterWeekDay(date),
              style: bodyMedium.copyWith(
                color: value ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
