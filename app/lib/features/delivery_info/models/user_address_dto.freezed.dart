// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_address_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAddressDto _$UserAddressDtoFromJson(Map<String, dynamic> json) {
  return _UserAddressDto.fromJson(json);
}

/// @nodoc
mixin _$UserAddressDto {
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_info')
  String? get addressInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  String get entitled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAddressDtoCopyWith<UserAddressDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAddressDtoCopyWith<$Res> {
  factory $UserAddressDtoCopyWith(
          UserAddressDto value, $Res Function(UserAddressDto) then) =
      _$UserAddressDtoCopyWithImpl<$Res, UserAddressDto>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'user_id') String userId,
      String address,
      @JsonKey(name: 'address_info') String? addressInfo,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'company_name') String? companyName,
      String entitled});
}

/// @nodoc
class _$UserAddressDtoCopyWithImpl<$Res, $Val extends UserAddressDto>
    implements $UserAddressDtoCopyWith<$Res> {
  _$UserAddressDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? address = null,
    Object? addressInfo = freezed,
    Object? deliveryInstructions = freezed,
    Object? companyName = freezed,
    Object? entitled = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAddressDtoImplCopyWith<$Res>
    implements $UserAddressDtoCopyWith<$Res> {
  factory _$$UserAddressDtoImplCopyWith(_$UserAddressDtoImpl value,
          $Res Function(_$UserAddressDtoImpl) then) =
      __$$UserAddressDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'user_id') String userId,
      String address,
      @JsonKey(name: 'address_info') String? addressInfo,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'company_name') String? companyName,
      String entitled});
}

/// @nodoc
class __$$UserAddressDtoImplCopyWithImpl<$Res>
    extends _$UserAddressDtoCopyWithImpl<$Res, _$UserAddressDtoImpl>
    implements _$$UserAddressDtoImplCopyWith<$Res> {
  __$$UserAddressDtoImplCopyWithImpl(
      _$UserAddressDtoImpl _value, $Res Function(_$UserAddressDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? address = null,
    Object? addressInfo = freezed,
    Object? deliveryInstructions = freezed,
    Object? companyName = freezed,
    Object? entitled = null,
  }) {
    return _then(_$UserAddressDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAddressDtoImpl
    with DiagnosticableTreeMixin
    implements _UserAddressDto {
  const _$UserAddressDtoImpl(
      {@JsonKey(includeToJson: false) this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.address,
      @JsonKey(name: 'address_info') this.addressInfo,
      @JsonKey(name: 'delivery_instructions') this.deliveryInstructions,
      @JsonKey(name: 'company_name') this.companyName,
      required this.entitled});

  factory _$UserAddressDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAddressDtoImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String address;
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserAddressDto(id: $id, userId: $userId, address: $address, addressInfo: $addressInfo, deliveryInstructions: $deliveryInstructions, companyName: $companyName, entitled: $entitled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserAddressDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('addressInfo', addressInfo))
      ..add(DiagnosticsProperty('deliveryInstructions', deliveryInstructions))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('entitled', entitled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAddressDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressInfo, addressInfo) ||
                other.addressInfo == addressInfo) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.entitled, entitled) ||
                other.entitled == entitled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, address, addressInfo,
      deliveryInstructions, companyName, entitled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAddressDtoImplCopyWith<_$UserAddressDtoImpl> get copyWith =>
      __$$UserAddressDtoImplCopyWithImpl<_$UserAddressDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAddressDtoImplToJson(
      this,
    );
  }
}

abstract class _UserAddressDto implements UserAddressDto {
  const factory _UserAddressDto(
      {@JsonKey(includeToJson: false) final String? id,
      @JsonKey(name: 'user_id') required final String userId,
      required final String address,
      @JsonKey(name: 'address_info') final String? addressInfo,
      @JsonKey(name: 'delivery_instructions')
      final String? deliveryInstructions,
      @JsonKey(name: 'company_name') final String? companyName,
      required final String entitled}) = _$UserAddressDtoImpl;

  factory _UserAddressDto.fromJson(Map<String, dynamic> json) =
      _$UserAddressDtoImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get address;
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
  @JsonKey(ignore: true)
  _$$UserAddressDtoImplCopyWith<_$UserAddressDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
