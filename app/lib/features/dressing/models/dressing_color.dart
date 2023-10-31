import 'package:freezed_annotation/freezed_annotation.dart';

part 'dressing_color.freezed.dart';
part 'dressing_color.g.dart';

class DressingColorLabels {
  static String black = 'Noir';
  static String white = 'Blanc';
  static String color = 'Couleur';
}

@freezed
class DressingColor with _$DressingColor {
  factory DressingColor({
    required int id,
    required String label,
  }) = _DressingColor;

  factory DressingColor.fromJson(Map<String, dynamic> json) =>
      _$DressingColorFromJson(json);
}
