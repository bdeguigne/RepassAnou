// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/delivery_info/models/planification_time_slot.dart';
import 'package:repasse_anou/features/delivery_info/models/user_schedule_dto.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

part 'users_schedules_repository.g.dart';

class UsersSchedulesRepository {
  UsersSchedulesRepository({
    required this.logger,
    required this.supabase,
    required this.userController,
  });

  final Logger logger;
  final s.SupabaseClient supabase;
  final UserController userController;

  Future<List<PlanificationTimeSlot>> getPlanificationTimeSlots() async {
    try {
      final response = await supabase.planificationTimeSlotsTable
          .select<s.PostgrestList>('value, label');

      return response
          .map((data) => PlanificationTimeSlot.fromJson(data))
          .toList();
    } catch (e) {
      logger.e(e.toString());
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération des créneaux de planification');
    }
  }

  Future<void> saveUserSchedule({
    required DateTime selectedRemovalDay,
    required DateTime selectedDeliveryDay,
    required String collectingTimeSlot,
    required String deliveryTimeSlot,
  }) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      // find by user id if exists update else insert
      final response = await supabase.usersSchedulesTable
          .select<s.PostgrestList>('id')
          .eq('user_id', userController.loggedUser!.id);

      if (response.isNotEmpty) {
        await supabase.usersSchedulesTable
            .update(
              UserScheduleDto(
                userId: userController.loggedUser!.id,
                collectingDate: selectedRemovalDay,
                collectingSchedule: collectingTimeSlot,
                deliveryDate: selectedDeliveryDay,
                deliverySchedule: deliveryTimeSlot,
              ).toJson(),
            )
            .eq('id', response.first['id']);
        return;
      }

      await supabase.usersSchedulesTable.insert(
        UserScheduleDto(
          userId: userController.loggedUser!.id,
          collectingDate: selectedRemovalDay,
          collectingSchedule: collectingTimeSlot,
          deliveryDate: selectedDeliveryDay,
          deliverySchedule: deliveryTimeSlot,
        ).toJson(),
      );
    } catch (e) {
      logger.e(e.toString());
      throw Exception(
          'Une erreur est survenue lors de la sauvegarde de la planification');
    }
  }
}

@riverpod
Future<List<PlanificationTimeSlot>> planificationTimeSlots(
    PlanificationTimeSlotsRef ref) async {
  return ref.notifyOnError(
    () =>
        ref.read(usersSchedulesRepositoryProvider).getPlanificationTimeSlots(),
  );
}

final usersSchedulesRepositoryProvider =
    Provider<UsersSchedulesRepository>((ref) {
  return UsersSchedulesRepository(
    logger: ref.read(loggerProvider),
    supabase: ref.read(supabaseClientProvider),
    userController: ref.read(userControllerProvider.notifier),
  );
});
