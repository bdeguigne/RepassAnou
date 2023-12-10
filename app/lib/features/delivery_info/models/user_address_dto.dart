import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_address_dto.freezed.dart';
part 'user_address_dto.g.dart';

@freezed
abstract class UserAddressDto with _$UserAddressDto {
  const factory UserAddressDto({
    @JsonKey(includeToJson: false) String? id,
    required String label,
    @JsonKey(name: 'user_id') required String userId,
    required String street,
    @JsonKey(name: 'postal_code') required String postalCode,
    required String city,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'address_info') String? addressInfo,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'company_name') String? companyName,
    required String entitled,
    @JsonKey(name: 'created_time') DateTime? createdTime,
  }) = _UserAddressDto;

  factory UserAddressDto.fromJson(Map<String, dynamic> json) =>
      _$UserAddressDtoFromJson(json);
}
