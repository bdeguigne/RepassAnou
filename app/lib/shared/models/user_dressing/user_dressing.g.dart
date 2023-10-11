// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dressing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDressingImpl _$$UserDressingImplFromJson(Map<String, dynamic> json) =>
    _$UserDressingImpl(
      id: json['id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      dressingCategory: DressingCategory.fromJson(
          json['dressingCategory'] as Map<String, dynamic>),
      dressingMaterial: DressingMaterial.fromJson(
          json['dressingMaterial'] as Map<String, dynamic>),
      belongsTo: json['belongsTo'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$UserDressingImplToJson(_$UserDressingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'title': instance.title,
      'dressingCategory': instance.dressingCategory,
      'dressingMaterial': instance.dressingMaterial,
      'belongsTo': instance.belongsTo,
      'notes': instance.notes,
    };
