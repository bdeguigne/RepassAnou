// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dressing_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DressingItem _$DressingItemFromJson(Map<String, dynamic> json) {
  return _DressingItem.fromJson(json);
}

/// @nodoc
mixin _$DressingItem {
  String get id => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get material => throw _privateConstructorUsedError;
  String get test => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DressingItemCopyWith<DressingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DressingItemCopyWith<$Res> {
  factory $DressingItemCopyWith(
          DressingItem value, $Res Function(DressingItem) then) =
      _$DressingItemCopyWithImpl<$Res, DressingItem>;
  @useResult
  $Res call(
      {String id,
      String category,
      String material,
      String test,
      double price,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class _$DressingItemCopyWithImpl<$Res, $Val extends DressingItem>
    implements $DressingItemCopyWith<$Res> {
  _$DressingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? material = null,
    Object? test = null,
    Object? price = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String,
      test: null == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DressingItemImplCopyWith<$Res>
    implements $DressingItemCopyWith<$Res> {
  factory _$$DressingItemImplCopyWith(
          _$DressingItemImpl value, $Res Function(_$DressingItemImpl) then) =
      __$$DressingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String category,
      String material,
      String test,
      double price,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class __$$DressingItemImplCopyWithImpl<$Res>
    extends _$DressingItemCopyWithImpl<$Res, _$DressingItemImpl>
    implements _$$DressingItemImplCopyWith<$Res> {
  __$$DressingItemImplCopyWithImpl(
      _$DressingItemImpl _value, $Res Function(_$DressingItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? material = null,
    Object? test = null,
    Object? price = null,
    Object? imageUrl = null,
  }) {
    return _then(_$DressingItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String,
      test: null == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DressingItemImpl implements _DressingItem {
  const _$DressingItemImpl(
      {required this.id,
      required this.category,
      required this.material,
      required this.test,
      required this.price,
      @JsonKey(name: 'image_url') required this.imageUrl});

  factory _$DressingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DressingItemImplFromJson(json);

  @override
  final String id;
  @override
  final String category;
  @override
  final String material;
  @override
  final String test;
  @override
  final double price;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  String toString() {
    return 'DressingItem(id: $id, category: $category, material: $material, test: $test, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DressingItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.test, test) || other.test == test) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, category, material, test, price, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DressingItemImplCopyWith<_$DressingItemImpl> get copyWith =>
      __$$DressingItemImplCopyWithImpl<_$DressingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DressingItemImplToJson(
      this,
    );
  }
}

abstract class _DressingItem implements DressingItem {
  const factory _DressingItem(
          {required final String id,
          required final String category,
          required final String material,
          required final String test,
          required final double price,
          @JsonKey(name: 'image_url') required final String imageUrl}) =
      _$DressingItemImpl;

  factory _DressingItem.fromJson(Map<String, dynamic> json) =
      _$DressingItemImpl.fromJson;

  @override
  String get id;
  @override
  String get category;
  @override
  String get material;
  @override
  String get test;
  @override
  double get price;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$DressingItemImplCopyWith<_$DressingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
