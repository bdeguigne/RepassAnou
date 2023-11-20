import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_address.freezed.dart';
part 'user_address.g.dart';

enum AddressSource {
  database,
  geolocation,
}

@freezed
abstract class UserAddress with _$UserAddress {
  const factory UserAddress({
    @JsonKey(includeToJson: false) String? id,
    required String address,
    @JsonKey(name: 'address_info') String? addressInfo,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'company_name') String? companyName,
    required String entitled,
    required bool selected,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default(AddressSource.database)
    AddressSource source,
  }) = _UserAddress;

  factory UserAddress.geolocation(String address) {
    return UserAddress(
      address: address,
      entitled: '',
      selected: false,
      source: AddressSource.geolocation,
    );
  }

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
}
