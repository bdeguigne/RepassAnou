import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dressing_belong_to.freezed.dart';
part 'user_dressing_belong_to.g.dart';

@freezed
abstract class UserDressingBelongsTo with _$UserDressingBelongsTo {
  const factory UserDressingBelongsTo({
    required String id,
    required String name,
  }) = _UserDressingBelongsTo;

  factory UserDressingBelongsTo.fromJson(Map<String, dynamic> json) =>
      _$UserDressingBelongsToFromJson(json);
}
