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
  List<DressingMaterial> get dressingMaterials =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'dressing_colors')
  DressingColor get dressingColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'users_dressings_belongs_to')
  UserDressingBelongsTo get belongsTo => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_path')
  String get imagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool get isFavorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'dressing_materials')
      List<DressingMaterial> dressingMaterials,
      @JsonKey(name: 'dressing_colors') DressingColor dressingColor,
      @JsonKey(name: 'users_dressings_belongs_to')
      UserDressingBelongsTo belongsTo,
      String? notes,
      @JsonKey(name: 'image_path') String imagePath,
      @JsonKey(name: 'is_favorite') bool isFavorite,
      @JsonKey(name: 'created_at') DateTime createdAt});

  $UserCopyWith<$Res> get user;
  $DressingCategoryCopyWith<$Res> get dressingCategory;
  $DressingColorCopyWith<$Res> get dressingColor;
  $UserDressingBelongsToCopyWith<$Res> get belongsTo;
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
    Object? dressingMaterials = null,
    Object? dressingColor = null,
    Object? belongsTo = null,
    Object? notes = freezed,
    Object? imagePath = null,
    Object? isFavorite = null,
    Object? createdAt = null,
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
      dressingMaterials: null == dressingMaterials
          ? _value.dressingMaterials
          : dressingMaterials // ignore: cast_nullable_to_non_nullable
              as List<DressingMaterial>,
      dressingColor: null == dressingColor
          ? _value.dressingColor
          : dressingColor // ignore: cast_nullable_to_non_nullable
              as DressingColor,
      belongsTo: null == belongsTo
          ? _value.belongsTo
          : belongsTo // ignore: cast_nullable_to_non_nullable
              as UserDressingBelongsTo,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
  $DressingColorCopyWith<$Res> get dressingColor {
    return $DressingColorCopyWith<$Res>(_value.dressingColor, (value) {
      return _then(_value.copyWith(dressingColor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDressingBelongsToCopyWith<$Res> get belongsTo {
    return $UserDressingBelongsToCopyWith<$Res>(_value.belongsTo, (value) {
      return _then(_value.copyWith(belongsTo: value) as $Val);
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
      @JsonKey(name: 'dressing_materials')
      List<DressingMaterial> dressingMaterials,
      @JsonKey(name: 'dressing_colors') DressingColor dressingColor,
      @JsonKey(name: 'users_dressings_belongs_to')
      UserDressingBelongsTo belongsTo,
      String? notes,
      @JsonKey(name: 'image_path') String imagePath,
      @JsonKey(name: 'is_favorite') bool isFavorite,
      @JsonKey(name: 'created_at') DateTime createdAt});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $DressingCategoryCopyWith<$Res> get dressingCategory;
  @override
  $DressingColorCopyWith<$Res> get dressingColor;
  @override
  $UserDressingBelongsToCopyWith<$Res> get belongsTo;
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
    Object? dressingMaterials = null,
    Object? dressingColor = null,
    Object? belongsTo = null,
    Object? notes = freezed,
    Object? imagePath = null,
    Object? isFavorite = null,
    Object? createdAt = null,
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
      dressingMaterials: null == dressingMaterials
          ? _value._dressingMaterials
          : dressingMaterials // ignore: cast_nullable_to_non_nullable
              as List<DressingMaterial>,
      dressingColor: null == dressingColor
          ? _value.dressingColor
          : dressingColor // ignore: cast_nullable_to_non_nullable
              as DressingColor,
      belongsTo: null == belongsTo
          ? _value.belongsTo
          : belongsTo // ignore: cast_nullable_to_non_nullable
              as UserDressingBelongsTo,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      @JsonKey(name: 'dressing_materials')
      final List<DressingMaterial> dressingMaterials = const [],
      @JsonKey(name: 'dressing_colors') required this.dressingColor,
      @JsonKey(name: 'users_dressings_belongs_to') required this.belongsTo,
      this.notes,
      @JsonKey(name: 'image_path') required this.imagePath,
      @JsonKey(name: 'is_favorite') this.isFavorite = false,
      @JsonKey(name: 'created_at') required this.createdAt})
      : _dressingMaterials = dressingMaterials,
        super._();

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
  final List<DressingMaterial> _dressingMaterials;
  @override
  @JsonKey(name: 'dressing_materials')
  List<DressingMaterial> get dressingMaterials {
    if (_dressingMaterials is EqualUnmodifiableListView)
      return _dressingMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dressingMaterials);
  }

  @override
  @JsonKey(name: 'dressing_colors')
  final DressingColor dressingColor;
  @override
  @JsonKey(name: 'users_dressings_belongs_to')
  final UserDressingBelongsTo belongsTo;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'image_path')
  final String imagePath;
  @override
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'UserDressing(id: $id, user: $user, title: $title, dressingCategory: $dressingCategory, dressingMaterials: $dressingMaterials, dressingColor: $dressingColor, belongsTo: $belongsTo, notes: $notes, imagePath: $imagePath, isFavorite: $isFavorite, createdAt: $createdAt)';
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
            const DeepCollectionEquality()
                .equals(other._dressingMaterials, _dressingMaterials) &&
            (identical(other.dressingColor, dressingColor) ||
                other.dressingColor == dressingColor) &&
            (identical(other.belongsTo, belongsTo) ||
                other.belongsTo == belongsTo) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      title,
      dressingCategory,
      const DeepCollectionEquality().hash(_dressingMaterials),
      dressingColor,
      belongsTo,
      notes,
      imagePath,
      isFavorite,
      createdAt);

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
          final List<DressingMaterial> dressingMaterials,
          @JsonKey(name: 'dressing_colors')
          required final DressingColor dressingColor,
          @JsonKey(name: 'users_dressings_belongs_to')
          required final UserDressingBelongsTo belongsTo,
          final String? notes,
          @JsonKey(name: 'image_path') required final String imagePath,
          @JsonKey(name: 'is_favorite') final bool isFavorite,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$UserDressingImpl;
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
  List<DressingMaterial> get dressingMaterials;
  @override
  @JsonKey(name: 'dressing_colors')
  DressingColor get dressingColor;
  @override
  @JsonKey(name: 'users_dressings_belongs_to')
  UserDressingBelongsTo get belongsTo;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'image_path')
  String get imagePath;
  @override
  @JsonKey(name: 'is_favorite')
  bool get isFavorite;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserDressingImplCopyWith<_$UserDressingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
