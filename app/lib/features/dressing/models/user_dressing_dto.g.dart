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
      dressingColorId: json['dressing_color_id'] as int,
      usersDressingBelongsToId: json['user_dressing_belongs_to_id'] as String,
      notes: json['notes'] as String?,
      imagePath: json['image_path'] as String,
      isFavorite: json['is_favorite'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserDressingDtoImplToJson(
        _$UserDressingDtoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'title': instance.title,
      'dressing_category_id': instance.dressingCategoryId,
      'dressing_color_id': instance.dressingColorId,
      'user_dressing_belongs_to_id': instance.usersDressingBelongsToId,
      'notes': instance.notes,
      'image_path': instance.imagePath,
      'is_favorite': instance.isFavorite,
      'created_at': instance.createdAt.toIso8601String(),
    };
