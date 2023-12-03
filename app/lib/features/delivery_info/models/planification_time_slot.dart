import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'planification_time_slot.freezed.dart';
part 'planification_time_slot.g.dart';

@freezed
abstract class PlanificationTimeSlot with _$PlanificationTimeSlot {
  const factory PlanificationTimeSlot({
    required String value,
    required String label,
    @JsonKey(name: 'label_short') required String labelShort,
  }) = _PlanificationTimeSlot;

  factory PlanificationTimeSlot.fromJson(Map<String, dynamic> json) =>
      _$PlanificationTimeSlotFromJson(json);
}
