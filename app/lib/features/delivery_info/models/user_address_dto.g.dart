// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAddressDtoImpl _$$UserAddressDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserAddressDtoImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      address: json['address'] as String,
      addressInfo: json['address_info'] as String?,
      deliveryInstructions: json['delivery_instructions'] as String?,
      companyName: json['company_name'] as String?,
      entitled: json['entitled'] as String,
      selected: json['selected'] as bool,
    );

Map<String, dynamic> _$$UserAddressDtoImplToJson(
        _$UserAddressDtoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'address': instance.address,
      'address_info': instance.addressInfo,
      'delivery_instructions': instance.deliveryInstructions,
      'company_name': instance.companyName,
      'entitled': instance.entitled,
      'selected': instance.selected,
    };
