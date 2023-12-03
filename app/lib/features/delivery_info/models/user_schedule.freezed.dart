// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSchedule _$UserScheduleFromJson(Map<String, dynamic> json) {
  return _UserSchedule.fromJson(json);
}

/// @nodoc
mixin _$UserSchedule {
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'collecting_date')
  DateTime get collectingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'collecting_schedule')
  PlanificationTimeSlot get collectingSchedule =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  DateTime get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_schedule')
  PlanificationTimeSlot get deliverySchedule =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserScheduleCopyWith<UserSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserScheduleCopyWith<$Res> {
  factory $UserScheduleCopyWith(
          UserSchedule value, $Res Function(UserSchedule) then) =
      _$UserScheduleCopyWithImpl<$Res, UserSchedule>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'collecting_date') DateTime collectingDate,
      @JsonKey(name: 'collecting_schedule')
      PlanificationTimeSlot collectingSchedule,
      @JsonKey(name: 'delivery_date') DateTime deliveryDate,
      @JsonKey(name: 'delivery_schedule')
      PlanificationTimeSlot deliverySchedule});

  $PlanificationTimeSlotCopyWith<$Res> get collectingSchedule;
  $PlanificationTimeSlotCopyWith<$Res> get deliverySchedule;
}

/// @nodoc
class _$UserScheduleCopyWithImpl<$Res, $Val extends UserSchedule>
    implements $UserScheduleCopyWith<$Res> {
  _$UserScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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
      collectingDate: null == collectingDate
          ? _value.collectingDate
          : collectingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      collectingSchedule: null == collectingSchedule
          ? _value.collectingSchedule
          : collectingSchedule // ignore: cast_nullable_to_non_nullable
              as PlanificationTimeSlot,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliverySchedule: null == deliverySchedule
          ? _value.deliverySchedule
          : deliverySchedule // ignore: cast_nullable_to_non_nullable
              as PlanificationTimeSlot,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlanificationTimeSlotCopyWith<$Res> get collectingSchedule {
    return $PlanificationTimeSlotCopyWith<$Res>(_value.collectingSchedule,
        (value) {
      return _then(_value.copyWith(collectingSchedule: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlanificationTimeSlotCopyWith<$Res> get deliverySchedule {
    return $PlanificationTimeSlotCopyWith<$Res>(_value.deliverySchedule,
        (value) {
      return _then(_value.copyWith(deliverySchedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserScheduleImplCopyWith<$Res>
    implements $UserScheduleCopyWith<$Res> {
  factory _$$UserScheduleImplCopyWith(
          _$UserScheduleImpl value, $Res Function(_$UserScheduleImpl) then) =
      __$$UserScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      @JsonKey(name: 'collecting_date') DateTime collectingDate,
      @JsonKey(name: 'collecting_schedule')
      PlanificationTimeSlot collectingSchedule,
      @JsonKey(name: 'delivery_date') DateTime deliveryDate,
      @JsonKey(name: 'delivery_schedule')
      PlanificationTimeSlot deliverySchedule});

  @override
  $PlanificationTimeSlotCopyWith<$Res> get collectingSchedule;
  @override
  $PlanificationTimeSlotCopyWith<$Res> get deliverySchedule;
}

/// @nodoc
class __$$UserScheduleImplCopyWithImpl<$Res>
    extends _$UserScheduleCopyWithImpl<$Res, _$UserScheduleImpl>
    implements _$$UserScheduleImplCopyWith<$Res> {
  __$$UserScheduleImplCopyWithImpl(
      _$UserScheduleImpl _value, $Res Function(_$UserScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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
      collectingDate: null == collectingDate
          ? _value.collectingDate
          : collectingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      collectingSchedule: null == collectingSchedule
          ? _value.collectingSchedule
          : collectingSchedule // ignore: cast_nullable_to_non_nullable
              as PlanificationTimeSlot,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliverySchedule: null == deliverySchedule
          ? _value.deliverySchedule
          : deliverySchedule // ignore: cast_nullable_to_non_nullable
              as PlanificationTimeSlot,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserScheduleImpl implements _UserSchedule {
  const _$UserScheduleImpl(
      {@JsonKey(includeToJson: false) this.id,
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
  @JsonKey(name: 'collecting_date')
  final DateTime collectingDate;
  @override
  @JsonKey(name: 'collecting_schedule')
  final PlanificationTimeSlot collectingSchedule;
  @override
  @JsonKey(name: 'delivery_date')
  final DateTime deliveryDate;
  @override
  @JsonKey(name: 'delivery_schedule')
  final PlanificationTimeSlot deliverySchedule;

  @override
  String toString() {
    return 'UserSchedule(id: $id, collectingDate: $collectingDate, collectingSchedule: $collectingSchedule, deliveryDate: $deliveryDate, deliverySchedule: $deliverySchedule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
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
  int get hashCode => Object.hash(runtimeType, id, collectingDate,
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

abstract class _UserSchedule implements UserSchedule {
  const factory _UserSchedule(
      {@JsonKey(includeToJson: false) final String? id,
      @JsonKey(name: 'collecting_date') required final DateTime collectingDate,
      @JsonKey(name: 'collecting_schedule')
      required final PlanificationTimeSlot collectingSchedule,
      @JsonKey(name: 'delivery_date') required final DateTime deliveryDate,
      @JsonKey(name: 'delivery_schedule')
      required final PlanificationTimeSlot
          deliverySchedule}) = _$UserScheduleImpl;

  factory _UserSchedule.fromJson(Map<String, dynamic> json) =
      _$UserScheduleImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'collecting_date')
  DateTime get collectingDate;
  @override
  @JsonKey(name: 'collecting_schedule')
  PlanificationTimeSlot get collectingSchedule;
  @override
  @JsonKey(name: 'delivery_date')
  DateTime get deliveryDate;
  @override
  @JsonKey(name: 'delivery_schedule')
  PlanificationTimeSlot get deliverySchedule;
  @override
  @JsonKey(ignore: true)
  _$$UserScheduleImplCopyWith<_$UserScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
