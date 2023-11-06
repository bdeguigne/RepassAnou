// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dressing_material_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDressingMaterialDto _$UserDressingMaterialDtoFromJson(
    Map<String, dynamic> json) {
  return _UserDressingMaterialDto.fromJson(json);
}

/// @nodoc
mixin _$UserDressingMaterialDto {
  @JsonKey(name: 'user_dressing_id')
  String get userDressingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dressing_material_id')
  int get dressingMaterialId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDressingMaterialDtoCopyWith<UserDressingMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDressingMaterialDtoCopyWith<$Res> {
  factory $UserDressingMaterialDtoCopyWith(UserDressingMaterialDto value,
          $Res Function(UserDressingMaterialDto) then) =
      _$UserDressingMaterialDtoCopyWithImpl<$Res, UserDressingMaterialDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_dressing_id') String userDressingId,
      @JsonKey(name: 'dressing_material_id') int dressingMaterialId});
}

/// @nodoc
class _$UserDressingMaterialDtoCopyWithImpl<$Res,
        $Val extends UserDressingMaterialDto>
    implements $UserDressingMaterialDtoCopyWith<$Res> {
  _$UserDressingMaterialDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDressingId = null,
    Object? dressingMaterialId = null,
  }) {
    return _then(_value.copyWith(
      userDressingId: null == userDressingId
          ? _value.userDressingId
          : userDressingId // ignore: cast_nullable_to_non_nullable
              as String,
      dressingMaterialId: null == dressingMaterialId
          ? _value.dressingMaterialId
          : dressingMaterialId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDressingMaterialDtoImplCopyWith<$Res>
    implements $UserDressingMaterialDtoCopyWith<$Res> {
  factory _$$UserDressingMaterialDtoImplCopyWith(
          _$UserDressingMaterialDtoImpl value,
          $Res Function(_$UserDressingMaterialDtoImpl) then) =
      __$$UserDressingMaterialDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_dressing_id') String userDressingId,
      @JsonKey(name: 'dressing_material_id') int dressingMaterialId});
}

/// @nodoc
class __$$UserDressingMaterialDtoImplCopyWithImpl<$Res>
    extends _$UserDressingMaterialDtoCopyWithImpl<$Res,
        _$UserDressingMaterialDtoImpl>
    implements _$$UserDressingMaterialDtoImplCopyWith<$Res> {
  __$$UserDressingMaterialDtoImplCopyWithImpl(
      _$UserDressingMaterialDtoImpl _value,
      $Res Function(_$UserDressingMaterialDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDressingId = null,
    Object? dressingMaterialId = null,
  }) {
    return _then(_$UserDressingMaterialDtoImpl(
      userDressingId: null == userDressingId
          ? _value.userDressingId
          : userDressingId // ignore: cast_nullable_to_non_nullable
              as String,
      dressingMaterialId: null == dressingMaterialId
          ? _value.dressingMaterialId
          : dressingMaterialId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDressingMaterialDtoImpl
    with DiagnosticableTreeMixin
    implements _UserDressingMaterialDto {
  const _$UserDressingMaterialDtoImpl(
      {@JsonKey(name: 'user_dressing_id') required this.userDressingId,
      @JsonKey(name: 'dressing_material_id') required this.dressingMaterialId});

  factory _$UserDressingMaterialDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDressingMaterialDtoImplFromJson(json);

  @override
  @JsonKey(name: 'user_dressing_id')
  final String userDressingId;
  @override
  @JsonKey(name: 'dressing_material_id')
  final int dressingMaterialId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDressingMaterialDto(userDressingId: $userDressingId, dressingMaterialId: $dressingMaterialId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDressingMaterialDto'))
      ..add(DiagnosticsProperty('userDressingId', userDressingId))
      ..add(DiagnosticsProperty('dressingMaterialId', dressingMaterialId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDressingMaterialDtoImpl &&
            (identical(other.userDressingId, userDressingId) ||
                other.userDressingId == userDressingId) &&
            (identical(other.dressingMaterialId, dressingMaterialId) ||
                other.dressingMaterialId == dressingMaterialId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userDressingId, dressingMaterialId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDressingMaterialDtoImplCopyWith<_$UserDressingMaterialDtoImpl>
      get copyWith => __$$UserDressingMaterialDtoImplCopyWithImpl<
          _$UserDressingMaterialDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDressingMaterialDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDressingMaterialDto implements UserDressingMaterialDto {
  const factory _UserDressingMaterialDto(
      {@JsonKey(name: 'user_dressing_id') required final String userDressingId,
      @JsonKey(name: 'dressing_material_id')
      required final int dressingMaterialId}) = _$UserDressingMaterialDtoImpl;

  factory _UserDressingMaterialDto.fromJson(Map<String, dynamic> json) =
      _$UserDressingMaterialDtoImpl.fromJson;

  @override
  @JsonKey(name: 'user_dressing_id')
  String get userDressingId;
  @override
  @JsonKey(name: 'dressing_material_id')
  int get dressingMaterialId;
  @override
  @JsonKey(ignore: true)
  _$$UserDressingMaterialDtoImplCopyWith<_$UserDressingMaterialDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
