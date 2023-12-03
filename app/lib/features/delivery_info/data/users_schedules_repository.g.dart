// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_schedules_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$planificationTimeSlotsHash() =>
    r'9d154eeec7aaef928fd000c6b1d5f831e3bc2298';

/// See also [planificationTimeSlots].
@ProviderFor(planificationTimeSlots)
final planificationTimeSlotsProvider =
    AutoDisposeFutureProvider<List<PlanificationTimeSlot>>.internal(
  planificationTimeSlots,
  name: r'planificationTimeSlotsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$planificationTimeSlotsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlanificationTimeSlotsRef
    = AutoDisposeFutureProviderRef<List<PlanificationTimeSlot>>;
String _$userScheduleHash() => r'0fb3a9d9fc90ddf33d9307ca961f9f32261f128c';

/// See also [userSchedule].
@ProviderFor(userSchedule)
final userScheduleProvider = FutureProvider<UserSchedule?>.internal(
  userSchedule,
  name: r'userScheduleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userScheduleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserScheduleRef = FutureProviderRef<UserSchedule?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
