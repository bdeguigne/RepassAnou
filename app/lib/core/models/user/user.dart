import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repasse_anou/core/value_objects.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    EmailAddress? email,
    String? firstName,
    String? lastName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  //from document

  //to Document
}
