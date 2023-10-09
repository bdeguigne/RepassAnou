import 'package:freezed_annotation/freezed_annotation.dart';

part 'command_item.freezed.dart';
part 'command_item.g.dart';

@freezed
class CommandItem with _$CommandItem {
  const factory CommandItem({
    required int id,
    required String title,
    required String description,
    required double price,
  }) = _CommandItem;

  factory CommandItem.fromJson(Map<String, dynamic> json) =>
      _$CommandItemFromJson(json);
}
