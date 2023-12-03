// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserScheduleDto _$UserScheduleDtoFromJson(Map<String, dynamic> json) {
  return _UserSchedule.fromJson(json);
}

/// @nodoc
mixin _$UserScheduleDto {
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'collecting_date')
  DateTime get collectingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'collecting_schedule')
  String get collectingSchedule => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  DateTime get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_schedule')
  String get deliverySchedule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserScheduleDtoCopyWith<UserScheduleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserScheduleDtoCopyWith<$Res> {
  factory $UserScheduleDtoCopyWith(
          UserScheduleDto value, $Res Function(UserScheduleDto) then) =
      _$UserScheduleDtoCopyWithImpl<$Res, UserScheduleDto>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'collecting_date') DateTime collectingDate,
      @JsonKey(name: 'collecting_schedule') String collectingSchedule,
      @JsonKey(name: 'delivery_date') DateTime deliveryDate,
      @JsonKey(name: 'delivery_schedule') String deliverySchedule});
}

/// @nodoc
class _$UserScheduleDtoCopyWithImpl<$Res, $Val extends UserScheduleDto>
    implements $UserScheduleDtoCopyWith<$Res> {
  _$UserScheduleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? collectingDate = null,
    Object? collectingSchedule = null,
    Object? deliveryDate = null,
    Object? deliverySchedule = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      collectingDate: null == collectingDate
          ? _value.collectingDate
          : collectingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      collectingSchedule: null == collectingSchedule
          ? _value.collectingSchedule
          : collectingSchedule // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliverySchedule: null == deliverySchedule
          ? _value.deliverySchedule
          : deliverySchedule // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserScheduleImplCopyWith<$Res>
    implements $UserScheduleDtoCopyWith<$Res> {
  factory _$$UserScheduleImplCopyWith(
          _$UserScheduleImpl value, $Res Function(_$UserScheduleImpl) then) =
      __$$UserScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'collecting_date') DateTime collectingDate,
      @JsonKey(name: 'collecting_schedule') String collectingSchedule,
      @JsonKey(name: 'delivery_date') DateTime deliveryDate,
      @JsonKey(name: 'delivery_schedule') String deliverySchedule});
}

/// @nodoc
class __$$UserScheduleImplCopyWithImpl<$Res>
    extends _$UserScheduleDtoCopyWithImpl<$Res, _$UserScheduleImpl>
    implements _$$UserScheduleImplCopyWith<$Res> {
  __$$UserScheduleImplCopyWithImpl(
      _$UserScheduleImpl _value, $Res Function(_$UserScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? collectingDate = null,
    Object? collectingSchedule = null,
    Object? deliveryDate = null,
    Object? deliverySchedule = null,
  }) {
    return _then(_$UserScheduleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      collectingDate: null == collectingDate
          ? _value.collectingDate
          : collectingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      collectingSchedule: null == collectingSchedule
          ? _value.collectingSchedule
          : collectingSchedule // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliverySchedule: null == deliverySchedule
          ? _value.deliverySchedule
          : deliverySchedule // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserScheduleImpl implements _UserSchedule {
  const _$UserScheduleImpl(
      {@JsonKey(includeToJson: false) this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'collecting_date') required this.collectingDate,
      @JsonKey(name: 'collecting_schedule') required this.collectingSchedule,
      @JsonKey(name: 'delivery_date') required this.deliveryDate,
      @JsonKey(name: 'delivery_schedule') required this.deliverySchedule});

  factory _$UserScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserScheduleImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'collecting_date')
  final DateTime collectingDate;
  @override
  @JsonKey(name: 'collecting_schedule')
  final String collectingSchedule;
  @override
  @JsonKey(name: 'delivery_date')
  final DateTime deliveryDate;
  @override
  @JsonKey(name: 'delivery_schedule')
  final String deliverySchedule;

  @override
  String toString() {
    return 'UserScheduleDto(id: $id, userId: $userId, collectingDate: $collectingDate, collectingSchedule: $collectingSchedule, deliveryDate: $deliveryDate, deliverySchedule: $deliverySchedule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.collectingDate, collectingDate) ||
                other.collectingDate == collectingDate) &&
            (identical(other.collectingSchedule, collectingSchedule) ||
                other.collectingSchedule == collectingSchedule) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.deliverySchedule, deliverySchedule) ||
                other.deliverySchedule == deliverySchedule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, collectingDate,
      collectingSchedule, deliveryDate, deliverySchedule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserScheduleImplCopyWith<_$UserScheduleImpl> get copyWith =>
      __$$UserScheduleImplCopyWithImpl<_$UserScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserScheduleImplToJson(
      this,
    );
  }
}

abstract class _UserSchedule implements UserScheduleDto {
  const factory _UserSchedule(
      {@JsonKey(includeToJson: false) final String? id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'collecting_date') required final DateTime collectingDate,
      @JsonKey(name: 'collecting_schedule')
      required final String collectingSchedule,
      @JsonKey(name: 'delivery_date') required final DateTime deliveryDate,
      @JsonKey(name: 'delivery_schedule')
      required final String deliverySchedule}) = _$UserScheduleImpl;

  factory _UserSchedule.fromJson(Map<String, dynamic> json) =
      _$UserScheduleImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'collecting_date')
  DateTime get collectingDate;
  @override
  @JsonKey(name: 'collecting_schedule')
  String get collectingSchedule;
  @override
  @JsonKey(name: 'delivery_date')
  DateTime get deliveryDate;
  @override
  @JsonKey(name: 'delivery_schedule')
  String get deliverySchedule;
  @override
  @JsonKey(ignore: true)
  _$$UserScheduleImplCopyWith<_$UserScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
