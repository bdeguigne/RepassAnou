import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address_dto.dart';

part 'user_address.freezed.dart';
part 'user_address.g.dart';

enum AddressSource {
  database,
  geolocation,
  api,
}

@freezed
abstract class UserAddress with _$UserAddress {
  const UserAddress._();

  const factory UserAddress({
    @JsonKey(includeToJson: false) String? id,
    required String label,
    required String street,
    @JsonKey(name: 'postal_code') required String postalCode,
    required String city,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'address_info') String? addressInfo,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'company_name') String? companyName,
    required String entitled,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default(AddressSource.database)
    AddressSource source,
  }) = _UserAddress;

  static String selectQuery = '''
    id,
    street,
    label,
    postal_code,
    city,
    latitude,
    longitude,
    address_info,
    delivery_instructions,
    company_name,
    entitled
  ''';

  factory UserAddress.geolocation({
    required String street,
    required String postalCode,
    required String city,
    required double latitude,
    required double longitude,
  }) {
    return UserAddress(
      label: street,
      street: street,
      postalCode: postalCode,
      city: city,
      latitude: latitude,
      longitude: longitude,
      entitled: '',
      source: AddressSource.geolocation,
    );
  }

  factory UserAddress.api({
    required String label,
    required String houseNumber,
    required String street,
    required String postalCode,
    required String city,
    required double latitude,
    required double longitude,
  }) {
    return UserAddress(
      label: label,
      street: '$houseNumber $street',
      postalCode: postalCode,
      city: city,
      latitude: latitude,
      longitude: longitude,
      entitled: '',
      source: AddressSource.api,
    );
  }

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  UserAddressDto toDto(String userId) => UserAddressDto(
        userId: userId,
        street: street,
        postalCode: postalCode,
        city: city,
        latitude: latitude,
        longitude: longitude,
        addressInfo: addressInfo,
        deliveryInstructions: deliveryInstructions,
        companyName: companyName,
        entitled: entitled,
        label: label,
        createdTime: DateTime.now(),
      );
}
