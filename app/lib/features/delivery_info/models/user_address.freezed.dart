// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) {
  return _UserAddress.fromJson(json);
}

/// @nodoc
mixin _$UserAddress {
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String get postalCode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_info')
  String? get addressInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  String get entitled => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  AddressSource get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAddressCopyWith<UserAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAddressCopyWith<$Res> {
  factory $UserAddressCopyWith(
          UserAddress value, $Res Function(UserAddress) then) =
      _$UserAddressCopyWithImpl<$Res, UserAddress>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      String label,
      String street,
      @JsonKey(name: 'postal_code') String postalCode,
      String city,
      double latitude,
      double longitude,
      @JsonKey(name: 'address_info') String? addressInfo,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'company_name') String? companyName,
      String entitled,
      @JsonKey(includeToJson: false, includeFromJson: false)
      AddressSource source});
}

/// @nodoc
class _$UserAddressCopyWithImpl<$Res, $Val extends UserAddress>
    implements $UserAddressCopyWith<$Res> {
  _$UserAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = null,
    Object? street = null,
    Object? postalCode = null,
    Object? city = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? addressInfo = freezed,
    Object? deliveryInstructions = freezed,
    Object? companyName = freezed,
    Object? entitled = null,
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressInfo: freezed == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryInstructions: freezed == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      entitled: null == entitled
          ? _value.entitled
          : entitled // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AddressSource,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAddressImplCopyWith<$Res>
    implements $UserAddressCopyWith<$Res> {
  factory _$$UserAddressImplCopyWith(
          _$UserAddressImpl value, $Res Function(_$UserAddressImpl) then) =
      __$$UserAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      String label,
      String street,
      @JsonKey(name: 'postal_code') String postalCode,
      String city,
      double latitude,
      double longitude,
      @JsonKey(name: 'address_info') String? addressInfo,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'company_name') String? companyName,
      String entitled,
      @JsonKey(includeToJson: false, includeFromJson: false)
      AddressSource source});
}

/// @nodoc
class __$$UserAddressImplCopyWithImpl<$Res>
    extends _$UserAddressCopyWithImpl<$Res, _$UserAddressImpl>
    implements _$$UserAddressImplCopyWith<$Res> {
  __$$UserAddressImplCopyWithImpl(
      _$UserAddressImpl _value, $Res Function(_$UserAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = null,
    Object? street = null,
    Object? postalCode = null,
    Object? city = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? addressInfo = freezed,
    Object? deliveryInstructions = freezed,
    Object? companyName = freezed,
    Object? entitled = null,
    Object? source = null,
  }) {
    return _then(_$UserAddressImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressInfo: freezed == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryInstructions: freezed == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      entitled: null == entitled
          ? _value.entitled
          : entitled // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AddressSource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAddressImpl extends _UserAddress with DiagnosticableTreeMixin {
  const _$UserAddressImpl(
      {@JsonKey(includeToJson: false) this.id,
      required this.label,
      required this.street,
      @JsonKey(name: 'postal_code') required this.postalCode,
      required this.city,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'address_info') this.addressInfo,
      @JsonKey(name: 'delivery_instructions') this.deliveryInstructions,
      @JsonKey(name: 'company_name') this.companyName,
      required this.entitled,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.source = AddressSource.database})
      : super._();

  factory _$UserAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAddressImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  final String label;
  @override
  final String street;
  @override
  @JsonKey(name: 'postal_code')
  final String postalCode;
  @override
  final String city;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'address_info')
  final String? addressInfo;
  @override
  @JsonKey(name: 'delivery_instructions')
  final String? deliveryInstructions;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  final String entitled;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final AddressSource source;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserAddress(id: $id, label: $label, street: $street, postalCode: $postalCode, city: $city, latitude: $latitude, longitude: $longitude, addressInfo: $addressInfo, deliveryInstructions: $deliveryInstructions, companyName: $companyName, entitled: $entitled, source: $source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserAddress'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('street', street))
      ..add(DiagnosticsProperty('postalCode', postalCode))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('addressInfo', addressInfo))
      ..add(DiagnosticsProperty('deliveryInstructions', deliveryInstructions))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('entitled', entitled))
      ..add(DiagnosticsProperty('source', source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.addressInfo, addressInfo) ||
                other.addressInfo == addressInfo) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.entitled, entitled) ||
                other.entitled == entitled) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      street,
      postalCode,
      city,
      latitude,
      longitude,
      addressInfo,
      deliveryInstructions,
      companyName,
      entitled,
      source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAddressImplCopyWith<_$UserAddressImpl> get copyWith =>
      __$$UserAddressImplCopyWithImpl<_$UserAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAddressImplToJson(
      this,
    );
  }
}

abstract class _UserAddress extends UserAddress {
  const factory _UserAddress(
      {@JsonKey(includeToJson: false) final String? id,
      required final String label,
      required final String street,
      @JsonKey(name: 'postal_code') required final String postalCode,
      required final String city,
      required final double latitude,
      required final double longitude,
      @JsonKey(name: 'address_info') final String? addressInfo,
      @JsonKey(name: 'delivery_instructions')
      final String? deliveryInstructions,
      @JsonKey(name: 'company_name') final String? companyName,
      required final String entitled,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final AddressSource source}) = _$UserAddressImpl;
  const _UserAddress._() : super._();

  factory _UserAddress.fromJson(Map<String, dynamic> json) =
      _$UserAddressImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  String get label;
  @override
  String get street;
  @override
  @JsonKey(name: 'postal_code')
  String get postalCode;
  @override
  String get city;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'address_info')
  String? get addressInfo;
  @override
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  String get entitled;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  AddressSource get source;
  @override
  @JsonKey(ignore: true)
  _$$UserAddressImplCopyWith<_$UserAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
