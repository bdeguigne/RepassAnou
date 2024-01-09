// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dressing_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DressingColor _$DressingColorFromJson(Map<String, dynamic> json) {
  return _DressingColor.fromJson(json);
}

/// @nodoc
mixin _$DressingColor {
  int get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DressingColorCopyWith<DressingColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DressingColorCopyWith<$Res> {
  factory $DressingColorCopyWith(
          DressingColor value, $Res Function(DressingColor) then) =
      _$DressingColorCopyWithImpl<$Res, DressingColor>;
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class _$DressingColorCopyWithImpl<$Res, $Val extends DressingColor>
    implements $DressingColorCopyWith<$Res> {
  _$DressingColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DressingColorImplCopyWith<$Res>
    implements $DressingColorCopyWith<$Res> {
  factory _$$DressingColorImplCopyWith(
          _$DressingColorImpl value, $Res Function(_$DressingColorImpl) then) =
      __$$DressingColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class __$$DressingColorImplCopyWithImpl<$Res>
    extends _$DressingColorCopyWithImpl<$Res, _$DressingColorImpl>
    implements _$$DressingColorImplCopyWith<$Res> {
  __$$DressingColorImplCopyWithImpl(
      _$DressingColorImpl _value, $Res Function(_$DressingColorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$DressingColorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DressingColorImpl implements _DressingColor {
  _$DressingColorImpl({required this.id, required this.label});

  factory _$DressingColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DressingColorImplFromJson(json);

  @override
  final int id;
  @override
  final String label;

  @override
  String toString() {
    return 'DressingColor(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DressingColorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DressingColorImplCopyWith<_$DressingColorImpl> get copyWith =>
      __$$DressingColorImplCopyWithImpl<_$DressingColorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DressingColorImplToJson(
      this,
    );
  }
}

abstract class _DressingColor implements DressingColor {
  factory _DressingColor({required final int id, required final String label}) =
      _$DressingColorImpl;

  factory _DressingColor.fromJson(Map<String, dynamic> json) =
      _$DressingColorImpl.fromJson;

  @override
  int get id;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$DressingColorImplCopyWith<_$DressingColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
