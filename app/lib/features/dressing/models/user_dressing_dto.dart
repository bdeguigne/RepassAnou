import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dressing_dto.freezed.dart';
part 'user_dressing_dto.g.dart';

@freezed
class UserDressingDto with _$UserDressingDto {
  factory UserDressingDto({
    @JsonKey(includeToJson: false) String? id,
    @JsonKey(name: 'user_id') required String userId,
    required String title,
    @JsonKey(name: 'dressing_category_id') required int dressingCategoryId,
    // @JsonKey(name: 'dressing_material_id') required int dressingMaterialId,
    @JsonKey(name: 'dressing_color_id') required int dressingColorId,
    @JsonKey(name: 'user_dressing_belongs_to_id')
    required String usersDressingBelongsToId,
    String? notes,
    @JsonKey(name: 'image_path') required String imagePath,
    @JsonKey(name: 'is_favorite') @Default(false) bool isFavorite,
     @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserDressingDto;

  factory UserDressingDto.fromJson(Map<String, dynamic> json) =>
      _$UserDressingDtoFromJson(json);
}
