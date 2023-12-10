// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAddressDtoImpl _$$UserAddressDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserAddressDtoImpl(
      id: json['id'] as String?,
      label: json['label'] as String,
      userId: json['user_id'] as String,
      street: json['street'] as String,
      postalCode: json['postal_code'] as String,
      city: json['city'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      addressInfo: json['address_info'] as String?,
      deliveryInstructions: json['delivery_instructions'] as String?,
      companyName: json['company_name'] as String?,
      entitled: json['entitled'] as String,
      createdTime: json['created_time'] == null
          ? null
          : DateTime.parse(json['created_time'] as String),
    );

Map<String, dynamic> _$$UserAddressDtoImplToJson(
        _$UserAddressDtoImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'user_id': instance.userId,
      'street': instance.street,
      'postal_code': instance.postalCode,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address_info': instance.addressInfo,
      'delivery_instructions': instance.deliveryInstructions,
      'company_name': instance.companyName,
      'entitled': instance.entitled,
      'created_time': instance.createdTime?.toIso8601String(),
    };
