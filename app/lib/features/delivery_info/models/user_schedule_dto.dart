import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_schedule_dto.freezed.dart';
part 'user_schedule_dto.g.dart';

@freezed
abstract class UserScheduleDto with _$UserScheduleDto {
  const factory UserScheduleDto({
    @JsonKey(includeToJson: false) String? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'collecting_date') required DateTime collectingDate,
    @JsonKey(name: 'collecting_schedule') required String collectingSchedule,
    @JsonKey(name: 'delivery_date') required DateTime deliveryDate,
    @JsonKey(name: 'delivery_schedule') required String deliverySchedule,
  }) = _UserSchedule;

  factory UserScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$UserScheduleDtoFromJson(json);
}
