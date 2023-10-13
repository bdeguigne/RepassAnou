// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dressing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDressingDtoImpl _$$UserDressingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDressingDtoImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      dressingCategoryId: json['dressing_category_id'] as int,
      dressingMaterialId: json['dressing_material_id'] as int,
      dressingColorId: json['dressing_color_id'] as int,
      belongsTo: json['belongs_to'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$UserDressingDtoImplToJson(
        _$UserDressingDtoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'title': instance.title,
      'dressing_category_id': instance.dressingCategoryId,
      'dressing_material_id': instance.dressingMaterialId,
      'dressing_color_id': instance.dressingColorId,
      'belongs_to': instance.belongsTo,
      'notes': instance.notes,
    };
