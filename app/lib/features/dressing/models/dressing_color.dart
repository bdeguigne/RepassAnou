import 'package:freezed_annotation/freezed_annotation.dart';

part 'dressing_color.freezed.dart';
part 'dressing_color.g.dart';

@freezed
class DressingColor with _$DressingColor {
  factory DressingColor({
    required int id,
    required String label,
  }) = _DressingColor;

  factory DressingColor.fromJson(Map<String, dynamic> json) =>
      _$DressingColorFromJson(json);
}
