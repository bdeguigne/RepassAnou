import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repasse_anou/features/auth/models/user.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_belong_to.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_dto.dart';

part 'user_dressing.freezed.dart';
part 'user_dressing.g.dart';

@freezed
class UserDressing with _$UserDressing {
  const UserDressing._();

  factory UserDressing({
    @JsonKey(includeToJson: false) String? id,
    @JsonKey(name: 'users') required User user,
    required String title,
    @JsonKey(name: 'dressing_categories')
    required DressingCategory dressingCategory,
    @Default([])
    @JsonKey(name: 'dressing_materials')
    List<DressingMaterial> dressingMaterials,
    @JsonKey(name: 'dressing_colors') required DressingColor dressingColor,
    @JsonKey(name: 'users_dressings_belongs_to')
    required UserDressingBelongsTo belongsTo,
    String? notes,
    @JsonKey(name: 'image_path') required String imagePath,
    @JsonKey(name: 'is_favorite') @Default(false) bool isFavorite,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserDressing;

  factory UserDressing.fromJson(Map<String, dynamic> json) =>
      _$UserDressingFromJson(json);

  // factory UserDressing.fromDto(
  //   UserDressingDto dto,
  //   User user,
  //   DressingCategory dressingCategory,
  //   DressingMaterial dressingMaterial,

  // ) =>
  //     UserDressing(
  //       id: dto.id,
  //       user: user,
  //       title: dto.title,
  //       dressingCategory: dressingCategory,
  //       dressingMaterial: dressingMaterial,
  //       belongsTo: dto.belongsTo,
  //       notes: dto.notes,
  //     );

  UserDressingDto toDto() => UserDressingDto(
        userId: user.id,
        title: title,
        dressingCategoryId: dressingCategory.id,
        dressingColorId: dressingColor.id,
        notes: notes,
        imagePath: imagePath,
        isFavorite: isFavorite,
        usersDressingBelongsToId: belongsTo.id,
        createdAt: createdAt,
      );
}
