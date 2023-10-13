import 'package:freezed_annotation/freezed_annotation.dart';

part 'dressing_category.freezed.dart';
part 'dressing_category.g.dart';

@freezed
class DressingCategory with _$DressingCategory {
  factory DressingCategory({
    required int id,
    required String label,
  }) = _DressingCategory;

  factory DressingCategory.fromJson(Map<String, dynamic> json) =>
      _$DressingCategoryFromJson(json);
}
