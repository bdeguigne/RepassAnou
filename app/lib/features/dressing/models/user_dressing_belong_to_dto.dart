import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dressing_belong_to_dto.freezed.dart';
part 'user_dressing_belong_to_dto.g.dart';

@freezed
abstract class UserDressingBelongsToDto with _$UserDressingBelongsToDto {
  const factory UserDressingBelongsToDto({
    @JsonKey(includeToJson: false) String? id,
    required String name,
    @JsonKey(name: 'user_id') required String userId,
  }) = _UserDressingBelongsToDto;

  factory UserDressingBelongsToDto.fromJson(Map<String, dynamic> json) =>
      _$UserDressingBelongsToDtoFromJson(json);
}
