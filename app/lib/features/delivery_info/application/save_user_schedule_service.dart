import 'package:repasse_anou/features/delivery_info/data/users_schedules_repository.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_user_schedule_service.g.dart';

@riverpod
class SaveUserScheduleSerivce extends _$SaveUserScheduleSerivce {
  @override
  FutureOr<void> build() {}

  Future<bool> saveUserSchedule({
    required DateTime selectedRemovalDay,
    required DateTime selectedDeliveryDay,
    required String collectingTimeSlot,
    required String deliveryTimeSlot,
  }) async {
    state = const AsyncLoading();
    final UsersSchedulesRepository usersSchedulesRepository =
        ref.read(usersSchedulesRepositoryProvider);

    state = await ref.guardAndNotifyOnError(
      () => usersSchedulesRepository.saveUserSchedule(
        selectedRemovalDay: selectedRemovalDay,
        selectedDeliveryDay: selectedDeliveryDay,
        collectingTimeSlot: collectingTimeSlot,
        deliveryTimeSlot: deliveryTimeSlot,
      ),
      successMessage: 'Votre planification a été enregistrée avec succès',
    );

    return state.hasError == false;
  }
}
