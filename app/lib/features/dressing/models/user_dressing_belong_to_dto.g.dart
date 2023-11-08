// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dressing_belong_to_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDressingBelongsToDtoImpl _$$UserDressingBelongsToDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDressingBelongsToDtoImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$$UserDressingBelongsToDtoImplToJson(
        _$UserDressingBelongsToDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'user_id': instance.userId,
    };
