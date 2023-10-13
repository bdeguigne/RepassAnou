// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: _$JsonConverterFromJson<String, EmailAddress>(
          json['email'], const EmailAddressConverter().fromJson),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      hasReadDressingMessage:
          json['has_read_dressing_message'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': _$JsonConverterToJson<String, EmailAddress>(
          instance.email, const EmailAddressConverter().toJson),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'has_read_dressing_message': instance.hasReadDressingMessage,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
