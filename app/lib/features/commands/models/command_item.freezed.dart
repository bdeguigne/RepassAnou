// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommandItem _$CommandItemFromJson(Map<String, dynamic> json) {
  return _CommandItem.fromJson(json);
}

/// @nodoc
mixin _$CommandItem {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommandItemCopyWith<CommandItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandItemCopyWith<$Res> {
  factory $CommandItemCopyWith(
          CommandItem value, $Res Function(CommandItem) then) =
      _$CommandItemCopyWithImpl<$Res, CommandItem>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      double price,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class _$CommandItemCopyWithImpl<$Res, $Val extends CommandItem>
    implements $CommandItemCopyWith<$Res> {
  _$CommandItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CommandItemImplCopyWith<$Res>
    implements $CommandItemCopyWith<$Res> {
  factory _$$CommandItemImplCopyWith(
          _$CommandItemImpl value, $Res Function(_$CommandItemImpl) then) =
      __$$CommandItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      double price,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class __$$CommandItemImplCopyWithImpl<$Res>
    extends _$CommandItemCopyWithImpl<$Res, _$CommandItemImpl>
    implements _$$CommandItemImplCopyWith<$Res> {
  __$$CommandItemImplCopyWithImpl(
      _$CommandItemImpl _value, $Res Function(_$CommandItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
  }) {
    return _then(_$CommandItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
class _$CommandItemImpl implements _CommandItem {
  const _$CommandItemImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      @JsonKey(name: 'image_url') required this.imageUrl});

  factory _$CommandItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommandItemImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final double price;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  String toString() {
    return 'CommandItem(id: $id, title: $title, description: $description, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, price, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandItemImplCopyWith<_$CommandItemImpl> get copyWith =>
      __$$CommandItemImplCopyWithImpl<_$CommandItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommandItemImplToJson(
      this,
    );
  }
}

abstract class _CommandItem implements CommandItem {
  const factory _CommandItem(
          {required final int id,
          required final String title,
          required final String description,
          required final double price,
          @JsonKey(name: 'image_url') required final String imageUrl}) =
      _$CommandItemImpl;

  factory _CommandItem.fromJson(Map<String, dynamic> json) =
      _$CommandItemImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  double get price;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$CommandItemImplCopyWith<_$CommandItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
