// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dressing_material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DressingMaterial _$DressingMaterialFromJson(Map<String, dynamic> json) {
  return _DressingMaterial.fromJson(json);
}

/// @nodoc
mixin _$DressingMaterial {
  int get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DressingMaterialCopyWith<DressingMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DressingMaterialCopyWith<$Res> {
  factory $DressingMaterialCopyWith(
          DressingMaterial value, $Res Function(DressingMaterial) then) =
      _$DressingMaterialCopyWithImpl<$Res, DressingMaterial>;
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class _$DressingMaterialCopyWithImpl<$Res, $Val extends DressingMaterial>
    implements $DressingMaterialCopyWith<$Res> {
  _$DressingMaterialCopyWithImpl(this._value, this._then);

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
abstract class _$$DressingMaterialImplCopyWith<$Res>
    implements $DressingMaterialCopyWith<$Res> {
  factory _$$DressingMaterialImplCopyWith(_$DressingMaterialImpl value,
          $Res Function(_$DressingMaterialImpl) then) =
      __$$DressingMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class __$$DressingMaterialImplCopyWithImpl<$Res>
    extends _$DressingMaterialCopyWithImpl<$Res, _$DressingMaterialImpl>
    implements _$$DressingMaterialImplCopyWith<$Res> {
  __$$DressingMaterialImplCopyWithImpl(_$DressingMaterialImpl _value,
      $Res Function(_$DressingMaterialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$DressingMaterialImpl(
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
class _$DressingMaterialImpl implements _DressingMaterial {
  _$DressingMaterialImpl({required this.id, required this.label});

  factory _$DressingMaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$DressingMaterialImplFromJson(json);

  @override
  final int id;
  @override
  final String label;

  @override
  String toString() {
    return 'DressingMaterial(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DressingMaterialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DressingMaterialImplCopyWith<_$DressingMaterialImpl> get copyWith =>
      __$$DressingMaterialImplCopyWithImpl<_$DressingMaterialImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DressingMaterialImplToJson(
      this,
    );
  }
}

abstract class _DressingMaterial implements DressingMaterial {
  factory _DressingMaterial(
      {required final int id,
      required final String label}) = _$DressingMaterialImpl;

  factory _DressingMaterial.fromJson(Map<String, dynamic> json) =
      _$DressingMaterialImpl.fromJson;

  @override
  int get id;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$DressingMaterialImplCopyWith<_$DressingMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
