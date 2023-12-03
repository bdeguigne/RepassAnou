import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repasse_anou/features/delivery_info/models/planification_time_slot.dart';

part 'user_schedule.freezed.dart';
part 'user_schedule.g.dart';

@freezed
abstract class UserSchedule with _$UserSchedule {
  const factory UserSchedule({
    @JsonKey(includeToJson: false) String? id,
    @JsonKey(name: 'collecting_date') required DateTime collectingDate,
    @JsonKey(name: 'collecting_schedule')
    required PlanificationTimeSlot collectingSchedule,
    @JsonKey(name: 'delivery_date') required DateTime deliveryDate,
    @JsonKey(name: 'delivery_schedule')
    required PlanificationTimeSlot deliverySchedule,
  }) = _UserSchedule;

  factory UserSchedule.fromJson(Map<String, dynamic> json) =>
      _$UserScheduleFromJson(json);
}
