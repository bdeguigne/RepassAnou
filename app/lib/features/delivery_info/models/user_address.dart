import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_address.freezed.dart';
part 'user_address.g.dart';

@freezed
abstract class UserAddress with _$UserAddress {
  const factory UserAddress({
    @JsonKey(includeToJson: false) String? id,
    required String address,
    @JsonKey(name: 'address_info') String? addressInfo,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'company_name') String? companyName,
    required String entitled,
  }) = _UserAddress;

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
}
