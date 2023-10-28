// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dressing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDressingImpl _$$UserDressingImplFromJson(Map<String, dynamic> json) =>
    _$UserDressingImpl(
      id: json['id'] as String?,
      user: User.fromJson(json['users'] as Map<String, dynamic>),
      title: json['title'] as String,
      dressingCategory: DressingCategory.fromJson(
          json['dressing_categories'] as Map<String, dynamic>),
      dressingMaterial: DressingMaterial.fromJson(
          json['dressing_materials'] as Map<String, dynamic>),
      dressingColor: DressingColor.fromJson(
          json['dressing_colors'] as Map<String, dynamic>),
      belongsTo: json['belongs_to'] as String?,
      notes: json['notes'] as String?,
      imagePath: json['image_path'] as String,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserDressingImplToJson(_$UserDressingImpl instance) =>
    <String, dynamic>{
      'users': instance.user,
      'title': instance.title,
      'dressing_categories': instance.dressingCategory,
      'dressing_materials': instance.dressingMaterial,
      'dressing_colors': instance.dressingColor,
      'belongs_to': instance.belongsTo,
      'notes': instance.notes,
      'image_path': instance.imagePath,
      'is_favorite': instance.isFavorite,
    };
