import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/date_select.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/radio_list_tile.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

enum RemovalTimeSlotValue {
  none,
  morning,
  afternoon,
  evening,
}

enum DeliveryTimeSlotValue {
  none,
  morning,
  afternoon,
  evening,
}

@RoutePage()
class PlanificationScreen extends HookWidget {
  const PlanificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedRemovalTimeSlot =
        useState<RemovalTimeSlotValue>(RemovalTimeSlotValue.none);
    final selectedDeliveryTimeSlot =
        useState<DeliveryTimeSlotValue>(DeliveryTimeSlotValue.none);

    return AppLayout.withBottomButton(
      bottomButton: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 20.h,
        ),
        child: AppButton.primary(
          expanded: true,
          onPressed: () {},
          text: 'Terminer',
        ),
      ),
      appBar: AppAppBar.title('Planification'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sh(10),
          Padding(
            padding: pw(20),
            child: const Text('Récupération de votre linge').headlineMedium,
          ),
          sh(15),
          buildDaySelectList([
            DateTime.now(),
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
            DateTime.now().add(const Duration(days: 5)),
          ]),
          Padding(
            padding: pwh(20, 20),
            child: ColumnSpacing(
              spacing: 10,
              children: [
                AppRadioListTile<RemovalTimeSlotValue>(
                  value: RemovalTimeSlotValue.morning,
                  onChanged: (timeSlot) => selectedRemovalTimeSlot.value =
                      timeSlot ?? RemovalTimeSlotValue.none,
                  title: 'Entre 8h et 12h',
                  groupValue: selectedRemovalTimeSlot.value,
                ),
                AppRadioListTile<RemovalTimeSlotValue>(
                  value: RemovalTimeSlotValue.afternoon,
                  onChanged: (timeSlot) => selectedRemovalTimeSlot.value =
                      timeSlot ?? RemovalTimeSlotValue.none,
                  title: 'Entre 14h et 17h',
                  groupValue: selectedRemovalTimeSlot.value,
                ),
                AppRadioListTile<RemovalTimeSlotValue>(
                  value: RemovalTimeSlotValue.evening,
                  onChanged: (timeSlot) => selectedRemovalTimeSlot.value =
                      timeSlot ?? RemovalTimeSlotValue.none,
                  title: 'Entre 17h et 20h',
                  groupValue: selectedRemovalTimeSlot.value,
                ),
              ],
            ),
          ),
          sh(10),
          Padding(
            padding: pw(20),
            child: const Text('Livraison de votre linge').headlineMedium,
          ),
          sh(15),
          buildDaySelectList([
            DateTime.now(),
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
            DateTime.now().add(const Duration(days: 5)),
          ]),
          Padding(
            padding: pwh(20, 20),
            child: ColumnSpacing(
              spacing: 10,
              children: [
                AppRadioListTile<DeliveryTimeSlotValue>(
                  value: DeliveryTimeSlotValue.morning,
                  onChanged: (timeSlot) => selectedDeliveryTimeSlot.value =
                      timeSlot ?? DeliveryTimeSlotValue.none,
                  title: 'Entre 8h et 12h',
                  groupValue: selectedDeliveryTimeSlot.value,
                ),
                AppRadioListTile<DeliveryTimeSlotValue>(
                  value: DeliveryTimeSlotValue.afternoon,
                  onChanged: (timeSlot) => selectedDeliveryTimeSlot.value =
                      timeSlot ?? DeliveryTimeSlotValue.none,
                  title: 'Entre 14h et 17h',
                  groupValue: selectedDeliveryTimeSlot.value,
                ),
                AppRadioListTile<DeliveryTimeSlotValue>(
                  value: DeliveryTimeSlotValue.evening,
                  onChanged: (timeSlot) => selectedDeliveryTimeSlot.value =
                      timeSlot ?? DeliveryTimeSlotValue.none,
                  title: 'Entre 17h et 20h',
                  groupValue: selectedDeliveryTimeSlot.value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildDaySelectList(List<DateTime> dates) {
    return SizedBox(
      height: 50.h,
      child: ListView(
        padding: pw(20),
        scrollDirection: Axis.horizontal,
        children: dates
            .map(
              (date) => Padding(
                padding: EdgeInsets.only(right: 27.w),
                child: DateSelect(
                  date: date,
                  // set value to true for the first date
                  value: dates.indexOf(date) == 0,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
