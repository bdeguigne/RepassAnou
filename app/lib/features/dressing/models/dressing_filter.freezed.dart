// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dressing_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DressingFilter {
  DressingCategory? get category => throw _privateConstructorUsedError;
  List<DressingMaterial>? get material => throw _privateConstructorUsedError;
  DressingColor? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DressingFilterCopyWith<DressingFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DressingFilterCopyWith<$Res> {
  factory $DressingFilterCopyWith(
          DressingFilter value, $Res Function(DressingFilter) then) =
      _$DressingFilterCopyWithImpl<$Res, DressingFilter>;
  @useResult
  $Res call(
      {DressingCategory? category,
      List<DressingMaterial>? material,
      DressingColor? color});

  $DressingCategoryCopyWith<$Res>? get category;
  $DressingColorCopyWith<$Res>? get color;
}

/// @nodoc
class _$DressingFilterCopyWithImpl<$Res, $Val extends DressingFilter>
    implements $DressingFilterCopyWith<$Res> {
  _$DressingFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? material = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as DressingCategory?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as List<DressingMaterial>?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as DressingColor?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DressingCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $DressingCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DressingColorCopyWith<$Res>? get color {
    if (_value.color == null) {
      return null;
    }

    return $DressingColorCopyWith<$Res>(_value.color!, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DressingFilterImplCopyWith<$Res>
    implements $DressingFilterCopyWith<$Res> {
  factory _$$DressingFilterImplCopyWith(_$DressingFilterImpl value,
          $Res Function(_$DressingFilterImpl) then) =
      __$$DressingFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DressingCategory? category,
      List<DressingMaterial>? material,
      DressingColor? color});

  @override
  $DressingCategoryCopyWith<$Res>? get category;
  @override
  $DressingColorCopyWith<$Res>? get color;
}

/// @nodoc
class __$$DressingFilterImplCopyWithImpl<$Res>
    extends _$DressingFilterCopyWithImpl<$Res, _$DressingFilterImpl>
    implements _$$DressingFilterImplCopyWith<$Res> {
  __$$DressingFilterImplCopyWithImpl(
      _$DressingFilterImpl _value, $Res Function(_$DressingFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? material = freezed,
    Object? color = freezed,
  }) {
    return _then(_$DressingFilterImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as DressingCategory?,
      material: freezed == material
          ? _value._material
          : material // ignore: cast_nullable_to_non_nullable
              as List<DressingMaterial>?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as DressingColor?,
    ));
  }
}

/// @nodoc

class _$DressingFilterImpl
    with DiagnosticableTreeMixin
    implements _DressingFilter {
  const _$DressingFilterImpl(
      {this.category, final List<DressingMaterial>? material, this.color})
      : _material = material;

  @override
  final DressingCategory? category;
  final List<DressingMaterial>? _material;
  @override
  List<DressingMaterial>? get material {
    final value = _material;
    if (value == null) return null;
    if (_material is EqualUnmodifiableListView) return _material;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DressingColor? color;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DressingFilter(category: $category, material: $material, color: $color)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DressingFilter'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('material', material))
      ..add(DiagnosticsProperty('color', color));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DressingFilterImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._material, _material) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category,
      const DeepCollectionEquality().hash(_material), color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DressingFilterImplCopyWith<_$DressingFilterImpl> get copyWith =>
      __$$DressingFilterImplCopyWithImpl<_$DressingFilterImpl>(
          this, _$identity);
}

abstract class _DressingFilter implements DressingFilter {
  const factory _DressingFilter(
      {final DressingCategory? category,
      final List<DressingMaterial>? material,
      final DressingColor? color}) = _$DressingFilterImpl;

  @override
  DressingCategory? get category;
  @override
  List<DressingMaterial>? get material;
  @override
  DressingColor? get color;
  @override
  @JsonKey(ignore: true)
  _$$DressingFilterImplCopyWith<_$DressingFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
