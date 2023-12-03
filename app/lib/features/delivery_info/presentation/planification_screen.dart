import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/date_select.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/radio_list_tile.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/delivery_info/data/users_schedules_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/planification_time_slot.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

@RoutePage()
class PlanificationScreen extends HookConsumerWidget {
  const PlanificationScreen({super.key});

  List<DateTime> generateWeekDays() {
    var today = DateTime.now();
    // Trouver le début de la semaine (lundi)
    var startOfWeek = today.subtract(Duration(days: today.weekday - 1));

    List<DateTime> weekDays = [];
    for (int i = 0; i < 10; i++) {
      // Ajouter des jours à la date de début et normaliser (sans heure/minute)
      var date =
          DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day + i);
      weekDays.add(date);
    }

    return weekDays;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<PlanificationTimeSlot>> planificationTimeSlots =
        ref.watch(planificationTimeSlotsProvider);

    final selectedCollectingTimeSlot = useState<PlanificationTimeSlot?>(null);
    final selectedDeliveryTimeSlot = useState<PlanificationTimeSlot?>(null);

    final List<DateTime> days = generateWeekDays();

    final selectedCollectingDay = useState<DateTime?>(null);
    final selectedDeliveryDay = useState<DateTime?>(null);

    void onSaveSchedule() {
      if (selectedCollectingDay.value == null ||
          selectedDeliveryDay.value == null ||
          selectedCollectingTimeSlot.value == null ||
          selectedDeliveryTimeSlot.value == null) {
        return;
      }

      ref.read(usersSchedulesRepositoryProvider).saveUserSchedule(
            selectedRemovalDay: selectedCollectingDay.value!,
            selectedDeliveryDay: selectedDeliveryDay.value!,
            collectingTimeSlot: selectedCollectingTimeSlot.value!.value,
            deliveryTimeSlot: selectedDeliveryTimeSlot.value!.value,
          );
    }

    Widget buildPlanificationForm(
        List<PlanificationTimeSlot> planificationSlots) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sh(10),
          Padding(
            padding: pw(20),
            child: const Text('Récupération de votre linge').headlineMedium,
          ),
          sh(15),
          buildDaySelectList(
            dates: days,
            selectedDay: selectedCollectingDay.value,
            onDaySelected: (date) {
              selectedCollectingDay.value = date;
            },
          ),
          Padding(
            padding: pwh(20, 20),
            child: ColumnSpacing(
              spacing: 10,
              children: planificationSlots
                  .map(
                    (slot) => AppRadioListTile<PlanificationTimeSlot>(
                      value: slot,
                      onChanged: (timeSlot) =>
                          selectedCollectingTimeSlot.value = timeSlot,
                      title: slot.label,
                      groupValue: selectedCollectingTimeSlot.value,
                    ),
                  )
                  .toList(),
            ),
          ),
          sh(10),
          Padding(
            padding: pw(20),
            child: const Text('Livraison de votre linge').headlineMedium,
          ),
          sh(15),
          buildDaySelectList(
            dates: days,
            selectedDay: selectedDeliveryDay.value,
            onDaySelected: (date) => selectedDeliveryDay.value = date,
          ),
          Padding(
            padding: pwh(20, 20),
            child: ColumnSpacing(
              spacing: 10,
              children: planificationSlots
                  .map(
                    (slot) => AppRadioListTile<PlanificationTimeSlot>(
                      value: slot,
                      onChanged: (timeSlot) =>
                          selectedDeliveryTimeSlot.value = timeSlot,
                      title: slot.label,
                      groupValue: selectedDeliveryTimeSlot.value,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    }

    return AppLayout.withBottomButton(
      bottomButton: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 20.h,
        ),
        child: AppButton.primary(
          expanded: true,
          onPressed: () => onSaveSchedule(),
          text: 'Terminer',
        ),
      ),
      appBar: AppAppBar.title('Planification'),
      child: planificationTimeSlots.when(
        data: (planificationTimeSlots) {
          return buildPlanificationForm(planificationTimeSlots);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }

  SizedBox buildDaySelectList({
    required List<DateTime> dates,
    DateTime? selectedDay,
    required void Function(DateTime date) onDaySelected,
  }) {
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
                  value: selectedDay != null ? date == selectedDay : false,
                  onChanged: (value) {
                    if (value) {
                      onDaySelected(date);
                    }
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
