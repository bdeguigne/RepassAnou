// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserScheduleImpl _$$UserScheduleImplFromJson(Map<String, dynamic> json) =>
    _$UserScheduleImpl(
      id: json['id'] as String?,
      collectingDate: DateTime.parse(json['collecting_date'] as String),
      collectingSchedule: PlanificationTimeSlot.fromJson(
          json['collecting_schedule'] as Map<String, dynamic>),
      deliveryDate: DateTime.parse(json['delivery_date'] as String),
      deliverySchedule: PlanificationTimeSlot.fromJson(
          json['delivery_schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserScheduleImplToJson(_$UserScheduleImpl instance) =>
    <String, dynamic>{
      'collecting_date': instance.collectingDate.toIso8601String(),
      'collecting_schedule': instance.collectingSchedule,
      'delivery_date': instance.deliveryDate.toIso8601String(),
      'delivery_schedule': instance.deliverySchedule,
    };
