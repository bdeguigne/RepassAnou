// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dressing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDressingDto _$UserDressingDtoFromJson(Map<String, dynamic> json) {
  return _UserDressingDto.fromJson(json);
}

/// @nodoc
mixin _$UserDressingDto {
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'dressing_category_id')
  int get dressingCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dressing_material_id')
  int get dressingMaterialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dressing_color_id')
  int get dressingColorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'belongs_to')
  String? get belongsTo => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDressingDtoCopyWith<UserDressingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDressingDtoCopyWith<$Res> {
  factory $UserDressingDtoCopyWith(
          UserDressingDto value, $Res Function(UserDressingDto) then) =
      _$UserDressingDtoCopyWithImpl<$Res, UserDressingDto>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'user_id') String userId,
      String title,
      @JsonKey(name: 'dressing_category_id') int dressingCategoryId,
      @JsonKey(name: 'dressing_material_id') int dressingMaterialId,
      @JsonKey(name: 'dressing_color_id') int dressingColorId,
      @JsonKey(name: 'belongs_to') String? belongsTo,
      String? notes});
}

/// @nodoc
class _$UserDressingDtoCopyWithImpl<$Res, $Val extends UserDressingDto>
    implements $UserDressingDtoCopyWith<$Res> {
  _$UserDressingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? title = null,
    Object? dressingCategoryId = null,
    Object? dressingMaterialId = null,
    Object? dressingColorId = null,
    Object? belongsTo = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dressingCategoryId: null == dressingCategoryId
          ? _value.dressingCategoryId
          : dressingCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      dressingMaterialId: null == dressingMaterialId
          ? _value.dressingMaterialId
          : dressingMaterialId // ignore: cast_nullable_to_non_nullable
              as int,
      dressingColorId: null == dressingColorId
          ? _value.dressingColorId
          : dressingColorId // ignore: cast_nullable_to_non_nullable
              as int,
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
}

/// @nodoc
abstract class _$$UserDressingDtoImplCopyWith<$Res>
    implements $UserDressingDtoCopyWith<$Res> {
  factory _$$UserDressingDtoImplCopyWith(_$UserDressingDtoImpl value,
          $Res Function(_$UserDressingDtoImpl) then) =
      __$$UserDressingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'user_id') String userId,
      String title,
      @JsonKey(name: 'dressing_category_id') int dressingCategoryId,
      @JsonKey(name: 'dressing_material_id') int dressingMaterialId,
      @JsonKey(name: 'dressing_color_id') int dressingColorId,
      @JsonKey(name: 'belongs_to') String? belongsTo,
      String? notes});
}

/// @nodoc
class __$$UserDressingDtoImplCopyWithImpl<$Res>
    extends _$UserDressingDtoCopyWithImpl<$Res, _$UserDressingDtoImpl>
    implements _$$UserDressingDtoImplCopyWith<$Res> {
  __$$UserDressingDtoImplCopyWithImpl(
      _$UserDressingDtoImpl _value, $Res Function(_$UserDressingDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? title = null,
    Object? dressingCategoryId = null,
    Object? dressingMaterialId = null,
    Object? dressingColorId = null,
    Object? belongsTo = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$UserDressingDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dressingCategoryId: null == dressingCategoryId
          ? _value.dressingCategoryId
          : dressingCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      dressingMaterialId: null == dressingMaterialId
          ? _value.dressingMaterialId
          : dressingMaterialId // ignore: cast_nullable_to_non_nullable
              as int,
      dressingColorId: null == dressingColorId
          ? _value.dressingColorId
          : dressingColorId // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$UserDressingDtoImpl implements _UserDressingDto {
  _$UserDressingDtoImpl(
      {@JsonKey(includeToJson: false) this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.title,
      @JsonKey(name: 'dressing_category_id') required this.dressingCategoryId,
      @JsonKey(name: 'dressing_material_id') required this.dressingMaterialId,
      @JsonKey(name: 'dressing_color_id') required this.dressingColorId,
      @JsonKey(name: 'belongs_to') this.belongsTo,
      this.notes});

  factory _$UserDressingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDressingDtoImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String title;
  @override
  @JsonKey(name: 'dressing_category_id')
  final int dressingCategoryId;
  @override
  @JsonKey(name: 'dressing_material_id')
  final int dressingMaterialId;
  @override
  @JsonKey(name: 'dressing_color_id')
  final int dressingColorId;
  @override
  @JsonKey(name: 'belongs_to')
  final String? belongsTo;
  @override
  final String? notes;

  @override
  String toString() {
    return 'UserDressingDto(id: $id, userId: $userId, title: $title, dressingCategoryId: $dressingCategoryId, dressingMaterialId: $dressingMaterialId, dressingColorId: $dressingColorId, belongsTo: $belongsTo, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDressingDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dressingCategoryId, dressingCategoryId) ||
                other.dressingCategoryId == dressingCategoryId) &&
            (identical(other.dressingMaterialId, dressingMaterialId) ||
                other.dressingMaterialId == dressingMaterialId) &&
            (identical(other.dressingColorId, dressingColorId) ||
                other.dressingColorId == dressingColorId) &&
            (identical(other.belongsTo, belongsTo) ||
                other.belongsTo == belongsTo) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      dressingCategoryId,
      dressingMaterialId,
      dressingColorId,
      belongsTo,
      notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDressingDtoImplCopyWith<_$UserDressingDtoImpl> get copyWith =>
      __$$UserDressingDtoImplCopyWithImpl<_$UserDressingDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDressingDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDressingDto implements UserDressingDto {
  factory _UserDressingDto(
      {@JsonKey(includeToJson: false) final String? id,
      @JsonKey(name: 'user_id') required final String userId,
      required final String title,
      @JsonKey(name: 'dressing_category_id')
      required final int dressingCategoryId,
      @JsonKey(name: 'dressing_material_id')
      required final int dressingMaterialId,
      @JsonKey(name: 'dressing_color_id') required final int dressingColorId,
      @JsonKey(name: 'belongs_to') final String? belongsTo,
      final String? notes}) = _$UserDressingDtoImpl;

  factory _UserDressingDto.fromJson(Map<String, dynamic> json) =
      _$UserDressingDtoImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get title;
  @override
  @JsonKey(name: 'dressing_category_id')
  int get dressingCategoryId;
  @override
  @JsonKey(name: 'dressing_material_id')
  int get dressingMaterialId;
  @override
  @JsonKey(name: 'dressing_color_id')
  int get dressingColorId;
  @override
  @JsonKey(name: 'belongs_to')
  String? get belongsTo;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$UserDressingDtoImplCopyWith<_$UserDressingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
