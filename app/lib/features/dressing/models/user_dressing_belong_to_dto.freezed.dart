// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dressing_belong_to_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDressingBelongsToDto _$UserDressingBelongsToDtoFromJson(
    Map<String, dynamic> json) {
  return _UserDressingBelongsToDto.fromJson(json);
}

/// @nodoc
mixin _$UserDressingBelongsToDto {
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDressingBelongsToDtoCopyWith<UserDressingBelongsToDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDressingBelongsToDtoCopyWith<$Res> {
  factory $UserDressingBelongsToDtoCopyWith(UserDressingBelongsToDto value,
          $Res Function(UserDressingBelongsToDto) then) =
      _$UserDressingBelongsToDtoCopyWithImpl<$Res, UserDressingBelongsToDto>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      String name,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class _$UserDressingBelongsToDtoCopyWithImpl<$Res,
        $Val extends UserDressingBelongsToDto>
    implements $UserDressingBelongsToDtoCopyWith<$Res> {
  _$UserDressingBelongsToDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDressingBelongsToDtoImplCopyWith<$Res>
    implements $UserDressingBelongsToDtoCopyWith<$Res> {
  factory _$$UserDressingBelongsToDtoImplCopyWith(
          _$UserDressingBelongsToDtoImpl value,
          $Res Function(_$UserDressingBelongsToDtoImpl) then) =
      __$$UserDressingBelongsToDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      String name,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class __$$UserDressingBelongsToDtoImplCopyWithImpl<$Res>
    extends _$UserDressingBelongsToDtoCopyWithImpl<$Res,
        _$UserDressingBelongsToDtoImpl>
    implements _$$UserDressingBelongsToDtoImplCopyWith<$Res> {
  __$$UserDressingBelongsToDtoImplCopyWithImpl(
      _$UserDressingBelongsToDtoImpl _value,
      $Res Function(_$UserDressingBelongsToDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? userId = null,
  }) {
    return _then(_$UserDressingBelongsToDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDressingBelongsToDtoImpl
    with DiagnosticableTreeMixin
    implements _UserDressingBelongsToDto {
  const _$UserDressingBelongsToDtoImpl(
      {@JsonKey(includeToJson: false) this.id,
      required this.name,
      @JsonKey(name: 'user_id') required this.userId});

  factory _$UserDressingBelongsToDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDressingBelongsToDtoImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  final String name;
  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDressingBelongsToDto(id: $id, name: $name, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDressingBelongsToDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDressingBelongsToDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDressingBelongsToDtoImplCopyWith<_$UserDressingBelongsToDtoImpl>
      get copyWith => __$$UserDressingBelongsToDtoImplCopyWithImpl<
          _$UserDressingBelongsToDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDressingBelongsToDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDressingBelongsToDto implements UserDressingBelongsToDto {
  const factory _UserDressingBelongsToDto(
          {@JsonKey(includeToJson: false) final String? id,
          required final String name,
          @JsonKey(name: 'user_id') required final String userId}) =
      _$UserDressingBelongsToDtoImpl;

  factory _UserDressingBelongsToDto.fromJson(Map<String, dynamic> json) =
      _$UserDressingBelongsToDtoImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$UserDressingBelongsToDtoImplCopyWith<_$UserDressingBelongsToDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
