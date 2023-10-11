// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dressing_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DressingItemImpl _$$DressingItemImplFromJson(Map<String, dynamic> json) =>
    _$DressingItemImpl(
      id: json['id'] as String,
      category: json['category'] as String,
      material: json['material'] as String,
      test: json['test'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$DressingItemImplToJson(_$DressingItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'material': instance.material,
      'test': instance.test,
      'price': instance.price,
      'image_url': instance.imageUrl,
    };
