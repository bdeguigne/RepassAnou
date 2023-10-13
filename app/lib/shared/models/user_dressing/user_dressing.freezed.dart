// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dressing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDressing _$UserDressingFromJson(Map<String, dynamic> json) {
  return _UserDressing.fromJson(json);
}

/// @nodoc
mixin _$UserDressing {
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'users')
  User get user => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'dressing_categories')
  DressingCategory get dressingCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'dressing_materials')
  DressingMaterial get dressingMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'dressing_colors')
  DressingColor get dressingColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'belongs_to')
  String? get belongsTo => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDressingCopyWith<UserDressing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDressingCopyWith<$Res> {
  factory $UserDressingCopyWith(
          UserDressing value, $Res Function(UserDressing) then) =
      _$UserDressingCopyWithImpl<$Res, UserDressing>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'users') User user,
      String title,
      @JsonKey(name: 'dressing_categories') DressingCategory dressingCategory,
      @JsonKey(name: 'dressing_materials') DressingMaterial dressingMaterial,
      @JsonKey(name: 'dressing_colors') DressingColor dressingColor,
      @JsonKey(name: 'belongs_to') String? belongsTo,
      String? notes});

  $UserCopyWith<$Res> get user;
  $DressingCategoryCopyWith<$Res> get dressingCategory;
  $DressingMaterialCopyWith<$Res> get dressingMaterial;
  $DressingColorCopyWith<$Res> get dressingColor;
}

/// @nodoc
class _$UserDressingCopyWithImpl<$Res, $Val extends UserDressing>
    implements $UserDressingCopyWith<$Res> {
  _$UserDressingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? title = null,
    Object? dressingCategory = null,
    Object? dressingMaterial = null,
    Object? dressingColor = null,
    Object? belongsTo = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dressingCategory: null == dressingCategory
          ? _value.dressingCategory
          : dressingCategory // ignore: cast_nullable_to_non_nullable
              as DressingCategory,
      dressingMaterial: null == dressingMaterial
          ? _value.dressingMaterial
          : dressingMaterial // ignore: cast_nullable_to_non_nullable
              as DressingMaterial,
      dressingColor: null == dressingColor
          ? _value.dressingColor
          : dressingColor // ignore: cast_nullable_to_non_nullable
              as DressingColor,
      belongsTo: freezed == belongsTo
          ? _value.belongsTo
          : belongsTo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DressingCategoryCopyWith<$Res> get dressingCategory {
    return $DressingCategoryCopyWith<$Res>(_value.dressingCategory, (value) {
      return _then(_value.copyWith(dressingCategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DressingMaterialCopyWith<$Res> get dressingMaterial {
    return $DressingMaterialCopyWith<$Res>(_value.dressingMaterial, (value) {
      return _then(_value.copyWith(dressingMaterial: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DressingColorCopyWith<$Res> get dressingColor {
    return $DressingColorCopyWith<$Res>(_value.dressingColor, (value) {
      return _then(_value.copyWith(dressingColor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDressingImplCopyWith<$Res>
    implements $UserDressingCopyWith<$Res> {
  factory _$$UserDressingImplCopyWith(
          _$UserDressingImpl value, $Res Function(_$UserDressingImpl) then) =
      __$$UserDressingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'users') User user,
      String title,
      @JsonKey(name: 'dressing_categories') DressingCategory dressingCategory,
      @JsonKey(name: 'dressing_materials') DressingMaterial dressingMaterial,
      @JsonKey(name: 'dressing_colors') DressingColor dressingColor,
      @JsonKey(name: 'belongs_to') String? belongsTo,
      String? notes});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $DressingCategoryCopyWith<$Res> get dressingCategory;
  @override
  $DressingMaterialCopyWith<$Res> get dressingMaterial;
  @override
  $DressingColorCopyWith<$Res> get dressingColor;
}

/// @nodoc
class __$$UserDressingImplCopyWithImpl<$Res>
    extends _$UserDressingCopyWithImpl<$Res, _$UserDressingImpl>
    implements _$$UserDressingImplCopyWith<$Res> {
  __$$UserDressingImplCopyWithImpl(
      _$UserDressingImpl _value, $Res Function(_$UserDressingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? title = null,
    Object? dressingCategory = null,
    Object? dressingMaterial = null,
    Object? dressingColor = null,
    Object? belongsTo = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$UserDressingImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dressingCategory: null == dressingCategory
          ? _value.dressingCategory
          : dressingCategory // ignore: cast_nullable_to_non_nullable
              as DressingCategory,
      dressingMaterial: null == dressingMaterial
          ? _value.dressingMaterial
          : dressingMaterial // ignore: cast_nullable_to_non_nullable
              as DressingMaterial,
      dressingColor: null == dressingColor
          ? _value.dressingColor
          : dressingColor // ignore: cast_nullable_to_non_nullable
              as DressingColor,
      belongsTo: freezed == belongsTo
          ? _value.belongsTo
          : belongsTo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDressingImpl extends _UserDressing {
  _$UserDressingImpl(
      {@JsonKey(includeToJson: false) this.id,
      @JsonKey(name: 'users') required this.user,
      required this.title,
      @JsonKey(name: 'dressing_categories') required this.dressingCategory,
      @JsonKey(name: 'dressing_materials') required this.dressingMaterial,
      @JsonKey(name: 'dressing_colors') required this.dressingColor,
      @JsonKey(name: 'belongs_to') this.belongsTo,
      this.notes})
      : super._();

  factory _$UserDressingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDressingImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: 'users')
  final User user;
  @override
  final String title;
  @override
  @JsonKey(name: 'dressing_categories')
  final DressingCategory dressingCategory;
  @override
  @JsonKey(name: 'dressing_materials')
  final DressingMaterial dressingMaterial;
  @override
  @JsonKey(name: 'dressing_colors')
  final DressingColor dressingColor;
  @override
  @JsonKey(name: 'belongs_to')
  final String? belongsTo;
  @override
  final String? notes;

  @override
  String toString() {
    return 'UserDressing(id: $id, user: $user, title: $title, dressingCategory: $dressingCategory, dressingMaterial: $dressingMaterial, dressingColor: $dressingColor, belongsTo: $belongsTo, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDressingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dressingCategory, dressingCategory) ||
                other.dressingCategory == dressingCategory) &&
            (identical(other.dressingMaterial, dressingMaterial) ||
                other.dressingMaterial == dressingMaterial) &&
            (identical(other.dressingColor, dressingColor) ||
                other.dressingColor == dressingColor) &&
            (identical(other.belongsTo, belongsTo) ||
                other.belongsTo == belongsTo) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, title,
      dressingCategory, dressingMaterial, dressingColor, belongsTo, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDressingImplCopyWith<_$UserDressingImpl> get copyWith =>
      __$$UserDressingImplCopyWithImpl<_$UserDressingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDressingImplToJson(
      this,
    );
  }
}

abstract class _UserDressing extends UserDressing {
  factory _UserDressing(
      {@JsonKey(includeToJson: false) final String? id,
      @JsonKey(name: 'users') required final User user,
      required final String title,
      @JsonKey(name: 'dressing_categories')
      required final DressingCategory dressingCategory,
      @JsonKey(name: 'dressing_materials')
      required final DressingMaterial dressingMaterial,
      @JsonKey(name: 'dressing_colors')
      required final DressingColor dressingColor,
      @JsonKey(name: 'belongs_to') final String? belongsTo,
      final String? notes}) = _$UserDressingImpl;
  _UserDressing._() : super._();

  factory _UserDressing.fromJson(Map<String, dynamic> json) =
      _$UserDressingImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'users')
  User get user;
  @override
  String get title;
  @override
  @JsonKey(name: 'dressing_categories')
  DressingCategory get dressingCategory;
  @override
  @JsonKey(name: 'dressing_materials')
  DressingMaterial get dressingMaterial;
  @override
  @JsonKey(name: 'dressing_colors')
  DressingColor get dressingColor;
  @override
  @JsonKey(name: 'belongs_to')
  String? get belongsTo;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$UserDressingImplCopyWith<_$UserDressingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}