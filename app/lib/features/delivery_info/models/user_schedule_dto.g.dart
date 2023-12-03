// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserScheduleImpl _$$UserScheduleImplFromJson(Map<String, dynamic> json) =>
    _$UserScheduleImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      collectingDate: DateTime.parse(json['collecting_date'] as String),
      collectingSchedule: json['collecting_schedule'] as String,
      deliveryDate: DateTime.parse(json['delivery_date'] as String),
      deliverySchedule: json['delivery_schedule'] as String,
    );

Map<String, dynamic> _$$UserScheduleImplToJson(_$UserScheduleImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'collecting_date': instance.collectingDate.toIso8601String(),
      'collecting_schedule': instance.collectingSchedule,
      'delivery_date': instance.deliveryDate.toIso8601String(),
      'delivery_schedule': instance.deliverySchedule,
    };
