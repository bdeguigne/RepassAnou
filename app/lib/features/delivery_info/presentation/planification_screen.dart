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
import 'package:repasse_anou/features/delivery_info/application/save_user_schedule_service.dart';
import 'package:repasse_anou/features/delivery_info/data/users_schedules_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/planification_time_slot.dart';
import 'package:repasse_anou/features/delivery_info/models/user_schedule.dart';
import 'package:repasse_anou/features/delivery_info/presentation/planification_screen_loading.dart';
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
    final AsyncValue<void> saveUserScheduleState =
        ref.watch(saveUserScheduleSerivceProvider);
    final AsyncValue<UserSchedule?> storedUserSchedule =
        ref.watch(userScheduleProvider);
    final List<DateTime> days = generateWeekDays();
    final showError = useState<bool>(false);

    void onSaveSchedule({
      DateTime? selectedCollectingDay,
      DateTime? selectedDeliveryDay,
      String? selectedCollectingTimeSlot,
      String? selectedDeliveryTimeSlot,
    }) {
      if (selectedCollectingDay == null ||
          selectedDeliveryDay == null ||
          selectedCollectingTimeSlot == null ||
          selectedDeliveryTimeSlot == null) {
        return;
      }

      ref.read(saveUserScheduleSerivceProvider.notifier).saveUserSchedule(
            selectedRemovalDay: selectedCollectingDay,
            selectedDeliveryDay: selectedDeliveryDay,
            collectingTimeSlot: selectedCollectingTimeSlot,
            deliveryTimeSlot: selectedDeliveryTimeSlot,
          );
    }

    Widget buildPlanificationForm(
      List<PlanificationTimeSlot> planificationSlots,
      ValueNotifier<PlanificationTimeSlot?> selectedCollectingTimeSlot,
      ValueNotifier<PlanificationTimeSlot?> selectedDeliveryTimeSlot,
      ValueNotifier<DateTime?> selectedCollectingDay,
      ValueNotifier<DateTime?> selectedDeliveryDay,
    ) {
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
            showError:
                showError.value == true && selectedCollectingDay.value == null,
          ),
          Padding(
            padding: pwh(20, 20),
            child: ColumnSpacing(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                ...planificationSlots
                    .map(
                      (slot) => AppRadioListTile<PlanificationTimeSlot>(
                        value: slot,
                        onChanged: (timeSlot) =>
                            selectedCollectingTimeSlot.value = timeSlot,
                        title: slot.label,
                        groupValue: selectedCollectingTimeSlot.value,
                        showError: showError.value == true &&
                            selectedCollectingTimeSlot.value == null,
                      ),
                    )
                    .toList(),
                if (showError.value == true &&
                    selectedCollectingTimeSlot.value == null)
                  Text(
                    'Veuillez sélectionner un créneau horaire',
                    style: bodySmall.copyWith(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
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
          buildDaySelectList(
            dates: days,
            selectedDay: selectedDeliveryDay.value,
            onDaySelected: (date) => selectedDeliveryDay.value = date,
            showError:
                showError.value == true && selectedDeliveryDay.value == null,
          ),
          Padding(
            padding: pwh(20, 20),
            child: ColumnSpacing(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                ...planificationSlots
                    .map(
                      (slot) => AppRadioListTile<PlanificationTimeSlot>(
                        value: slot,
                        onChanged: (timeSlot) =>
                            selectedDeliveryTimeSlot.value = timeSlot,
                        title: slot.label,
                        groupValue: selectedDeliveryTimeSlot.value,
                        showError: showError.value == true &&
                            selectedDeliveryTimeSlot.value == null,
                      ),
                    )
                    .toList(),
                if (showError.value == true &&
                    selectedDeliveryTimeSlot.value == null)
                  Text(
                    'Veuillez sélectionner un créneau horaire',
                    style: bodySmall.copyWith(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
    }

    if (planificationTimeSlots.hasError || storedUserSchedule.hasError) {
      return AppLayout.standard(
        child: const Center(child: Text('Une erreur est survenue')),
      );
    }
    if (planificationTimeSlots.isLoading || storedUserSchedule.isLoading) {
      return const PlanificationScreenLoading();
    }

    final selectedCollectingTimeSlot = useState<PlanificationTimeSlot?>(
        storedUserSchedule.value?.collectingSchedule);
    final selectedDeliveryTimeSlot = useState<PlanificationTimeSlot?>(
        storedUserSchedule.value?.deliverySchedule);

    final selectedCollectingDay =
        useState<DateTime?>(storedUserSchedule.value?.collectingDate);
    final selectedDeliveryDay =
        useState<DateTime?>(storedUserSchedule.value?.deliveryDate);

    return AppLayout.withBottomButton(
      bottomButton: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 20.h,
        ),
        child: AppButton.primary(
          expanded: true,
          onPressed: () => onSaveSchedule(
            selectedCollectingDay: selectedCollectingDay.value,
            selectedDeliveryDay: selectedDeliveryDay.value,
            selectedCollectingTimeSlot: selectedCollectingTimeSlot.value?.value,
            selectedDeliveryTimeSlot: selectedDeliveryTimeSlot.value?.value,
          ),
          text: 'Terminer',
          isLoading: saveUserScheduleState.isLoading,
        ),
      ),
      appBar: AppAppBar.title('Planification'),
      child: buildPlanificationForm(
        planificationTimeSlots.value!,
        selectedCollectingTimeSlot,
        selectedDeliveryTimeSlot,
        selectedCollectingDay,
        selectedDeliveryDay,
      ),
    );
  }

  Widget buildDaySelectList({
    required List<DateTime> dates,
    DateTime? selectedDay,
    required void Function(DateTime date) onDaySelected,
    required bool showError,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
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
        ),
        if (showError)
          Padding(
            padding: pw(20),
            child: Text(
              'Veuillez sélectionner une date',
              style: bodySmall.copyWith(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
      ],
    );
  }
}
