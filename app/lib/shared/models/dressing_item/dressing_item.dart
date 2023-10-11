import 'package:freezed_annotation/freezed_annotation.dart';

part 'dressing_item.freezed.dart';
part 'dressing_item.g.dart';

@freezed
class DressingItem with _$DressingItem {
  const factory DressingItem({
    required String id,
    required String category,
    required String material,
    required String test,
    required double price,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _DressingItem;

  factory DressingItem.fromJson(Map<String, dynamic> json) =>
      _$DressingItemFromJson(json);
}
