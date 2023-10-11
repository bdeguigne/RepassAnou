import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repasse_anou/shared/models/dressing_category/dressing_category.dart';
import 'package:repasse_anou/shared/models/dressing_material/dressing_material.dart';
import 'package:repasse_anou/shared/models/user/user.dart';

part 'user_dressing.freezed.dart';
part 'user_dressing.g.dart';

@freezed
class UserDressing with _$UserDressing {
  factory UserDressing({
    required int id,
    required User user,
    required String title,
    required DressingCategory dressingCategory,
    required DressingMaterial dressingMaterial,
    required String belongsTo,
    required String notes,
  }) = _UserDressing;

  factory UserDressing.fromJson(Map<String, dynamic> json) =>
      _$UserDressingFromJson(json);
}
