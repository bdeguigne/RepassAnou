// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dressing_belong_to.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDressingBelongsTo _$UserDressingBelongsToFromJson(
    Map<String, dynamic> json) {
  return _UserDressingBelongsTo.fromJson(json);
}

/// @nodoc
mixin _$UserDressingBelongsTo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDressingBelongsToCopyWith<UserDressingBelongsTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDressingBelongsToCopyWith<$Res> {
  factory $UserDressingBelongsToCopyWith(UserDressingBelongsTo value,
          $Res Function(UserDressingBelongsTo) then) =
      _$UserDressingBelongsToCopyWithImpl<$Res, UserDressingBelongsTo>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$UserDressingBelongsToCopyWithImpl<$Res,
        $Val extends UserDressingBelongsTo>
    implements $UserDressingBelongsToCopyWith<$Res> {
  _$UserDressingBelongsToCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDressingBelongsToImplCopyWith<$Res>
    implements $UserDressingBelongsToCopyWith<$Res> {
  factory _$$UserDressingBelongsToImplCopyWith(
          _$UserDressingBelongsToImpl value,
          $Res Function(_$UserDressingBelongsToImpl) then) =
      __$$UserDressingBelongsToImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$UserDressingBelongsToImplCopyWithImpl<$Res>
    extends _$UserDressingBelongsToCopyWithImpl<$Res,
        _$UserDressingBelongsToImpl>
    implements _$$UserDressingBelongsToImplCopyWith<$Res> {
  __$$UserDressingBelongsToImplCopyWithImpl(_$UserDressingBelongsToImpl _value,
      $Res Function(_$UserDressingBelongsToImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$UserDressingBelongsToImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDressingBelongsToImpl
    with DiagnosticableTreeMixin
    implements _UserDressingBelongsTo {
  const _$UserDressingBelongsToImpl({required this.id, required this.name});

  factory _$UserDressingBelongsToImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDressingBelongsToImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDressingBelongsTo(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDressingBelongsTo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDressingBelongsToImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDressingBelongsToImplCopyWith<_$UserDressingBelongsToImpl>
      get copyWith => __$$UserDressingBelongsToImplCopyWithImpl<
          _$UserDressingBelongsToImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDressingBelongsToImplToJson(
      this,
    );
  }
}

abstract class _UserDressingBelongsTo implements UserDressingBelongsTo {
  const factory _UserDressingBelongsTo(
      {required final String id,
      required final String name}) = _$UserDressingBelongsToImpl;

  factory _UserDressingBelongsTo.fromJson(Map<String, dynamic> json) =
      _$UserDressingBelongsToImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UserDressingBelongsToImplCopyWith<_$UserDressingBelongsToImpl>
      get copyWith => throw _privateConstructorUsedError;
}
