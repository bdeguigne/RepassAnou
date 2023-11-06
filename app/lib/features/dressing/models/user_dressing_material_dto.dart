import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dressing_material_dto.freezed.dart';
part 'user_dressing_material_dto.g.dart';

@freezed
abstract class UserDressingMaterialDto with _$UserDressingMaterialDto {
  const factory UserDressingMaterialDto({
    @JsonKey(name: 'user_dressing_id') required String userDressingId,
    @JsonKey(name: 'dressing_material_id') required int dressingMaterialId,
  }) = _UserDressingMaterialDto;

  factory UserDressingMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$UserDressingMaterialDtoFromJson(json);
}
