import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repasse_anou/utils/value_objects.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    @EmailAddressConverter() EmailAddress? email,
    String? firstName,
    String? lastName,
    @JsonKey(name: 'has_read_dressing_message')
    @Default(false)
    bool hasReadDressingMessage,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
