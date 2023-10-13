// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dressing_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DressingCategory _$DressingCategoryFromJson(Map<String, dynamic> json) {
  return _DressingCategory.fromJson(json);
}

/// @nodoc
mixin _$DressingCategory {
  int get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DressingCategoryCopyWith<DressingCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DressingCategoryCopyWith<$Res> {
  factory $DressingCategoryCopyWith(
          DressingCategory value, $Res Function(DressingCategory) then) =
      _$DressingCategoryCopyWithImpl<$Res, DressingCategory>;
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class _$DressingCategoryCopyWithImpl<$Res, $Val extends DressingCategory>
    implements $DressingCategoryCopyWith<$Res> {
  _$DressingCategoryCopyWithImpl(this._value, this._then);

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
abstract class _$$DressingCategoryImplCopyWith<$Res>
    implements $DressingCategoryCopyWith<$Res> {
  factory _$$DressingCategoryImplCopyWith(_$DressingCategoryImpl value,
          $Res Function(_$DressingCategoryImpl) then) =
      __$$DressingCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class __$$DressingCategoryImplCopyWithImpl<$Res>
    extends _$DressingCategoryCopyWithImpl<$Res, _$DressingCategoryImpl>
    implements _$$DressingCategoryImplCopyWith<$Res> {
  __$$DressingCategoryImplCopyWithImpl(_$DressingCategoryImpl _value,
      $Res Function(_$DressingCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$DressingCategoryImpl(
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
class _$DressingCategoryImpl implements _DressingCategory {
  _$DressingCategoryImpl({required this.id, required this.label});

  factory _$DressingCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DressingCategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String label;

  @override
  String toString() {
    return 'DressingCategory(id: $id, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DressingCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DressingCategoryImplCopyWith<_$DressingCategoryImpl> get copyWith =>
      __$$DressingCategoryImplCopyWithImpl<_$DressingCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DressingCategoryImplToJson(
      this,
    );
  }
}

abstract class _DressingCategory implements DressingCategory {
  factory _DressingCategory(
      {required final int id,
      required final String label}) = _$DressingCategoryImpl;

  factory _DressingCategory.fromJson(Map<String, dynamic> json) =
      _$DressingCategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$DressingCategoryImplCopyWith<_$DressingCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
