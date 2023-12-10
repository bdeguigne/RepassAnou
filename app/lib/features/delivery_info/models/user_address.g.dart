// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAddressImpl _$$UserAddressImplFromJson(Map<String, dynamic> json) =>
    _$UserAddressImpl(
      id: json['id'] as String?,
      label: json['label'] as String,
      street: json['street'] as String,
      postalCode: json['postal_code'] as String,
      city: json['city'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      addressInfo: json['address_info'] as String?,
      deliveryInstructions: json['delivery_instructions'] as String?,
      companyName: json['company_name'] as String?,
      entitled: json['entitled'] as String,
    );

Map<String, dynamic> _$$UserAddressImplToJson(_$UserAddressImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'street': instance.street,
      'postal_code': instance.postalCode,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address_info': instance.addressInfo,
      'delivery_instructions': instance.deliveryInstructions,
      'company_name': instance.companyName,
      'entitled': instance.entitled,
    };
