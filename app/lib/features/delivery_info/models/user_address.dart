import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_address.freezed.dart';
part 'user_address.g.dart';

enum AddressSource {
  database,
  geolocation,
  api,
}

@freezed
abstract class UserAddress with _$UserAddress {
  const factory UserAddress({
    @JsonKey(includeToJson: false) String? id,
    required String street,
    @JsonKey(name: 'postal_code') required String postalCode,
    required String city,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'address_info') String? addressInfo,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'company_name') String? companyName,
    required String entitled,
    required bool selected,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default(AddressSource.database)
    AddressSource source,
  }) = _UserAddress;

  factory UserAddress.geolocation({
    required String street,
    required String postalCode,
    required String city,
    required double latitude,
    required double longitude,
  }) {
    return UserAddress(
      street: street,
      postalCode: postalCode,
      city: city,
      latitude: latitude,
      longitude: longitude,
      entitled: '',
      selected: false,
      source: AddressSource.geolocation,
    );
  }

  factory UserAddress.api({
    required String street,
    required String postalCode,
    required String city,
    required double latitude,
    required double longitude,
  }) {
    return UserAddress(
      street: street,
      postalCode: postalCode,
      city: city,
      latitude: latitude,
      longitude: longitude,
      entitled: '',
      selected: false,
      source: AddressSource.api,
    );
  }

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
}
