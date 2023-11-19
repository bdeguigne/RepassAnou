// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAddressImpl _$$UserAddressImplFromJson(Map<String, dynamic> json) =>
    _$UserAddressImpl(
      id: json['id'] as String?,
      address: json['address'] as String,
      addressInfo: json['address_info'] as String?,
      deliveryInstructions: json['delivery_instructions'] as String?,
      companyName: json['company_name'] as String?,
      entitled: json['entitled'] as String,
    );

Map<String, dynamic> _$$UserAddressImplToJson(_$UserAddressImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address_info': instance.addressInfo,
      'delivery_instructions': instance.deliveryInstructions,
      'company_name': instance.companyName,
      'entitled': instance.entitled,
    };
