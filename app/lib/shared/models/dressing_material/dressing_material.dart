import 'package:freezed_annotation/freezed_annotation.dart';

part 'dressing_material.freezed.dart';
part 'dressing_material.g.dart';

@freezed
class DressingMaterial with _$DressingMaterial {
  factory DressingMaterial({
    required int id,
    required String label,
  }) = _DressingMaterial;

  factory DressingMaterial.fromJson(Map<String, dynamic> json) =>
      _$DressingMaterialFromJson(json);
}
