// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommandItemImpl _$$CommandItemImplFromJson(Map<String, dynamic> json) =>
    _$CommandItemImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$CommandItemImplToJson(_$CommandItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
    };
