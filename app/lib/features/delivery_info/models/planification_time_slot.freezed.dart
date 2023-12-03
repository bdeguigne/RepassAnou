// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planification_time_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlanificationTimeSlot _$PlanificationTimeSlotFromJson(
    Map<String, dynamic> json) {
  return _PlanificationTimeSlot.fromJson(json);
}

/// @nodoc
mixin _$PlanificationTimeSlot {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanificationTimeSlotCopyWith<PlanificationTimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanificationTimeSlotCopyWith<$Res> {
  factory $PlanificationTimeSlotCopyWith(PlanificationTimeSlot value,
          $Res Function(PlanificationTimeSlot) then) =
      _$PlanificationTimeSlotCopyWithImpl<$Res, PlanificationTimeSlot>;
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class _$PlanificationTimeSlotCopyWithImpl<$Res,
        $Val extends PlanificationTimeSlot>
    implements $PlanificationTimeSlotCopyWith<$Res> {
  _$PlanificationTimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanificationTimeSlotImplCopyWith<$Res>
    implements $PlanificationTimeSlotCopyWith<$Res> {
  factory _$$PlanificationTimeSlotImplCopyWith(
          _$PlanificationTimeSlotImpl value,
          $Res Function(_$PlanificationTimeSlotImpl) then) =
      __$$PlanificationTimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class __$$PlanificationTimeSlotImplCopyWithImpl<$Res>
    extends _$PlanificationTimeSlotCopyWithImpl<$Res,
        _$PlanificationTimeSlotImpl>
    implements _$$PlanificationTimeSlotImplCopyWith<$Res> {
  __$$PlanificationTimeSlotImplCopyWithImpl(_$PlanificationTimeSlotImpl _value,
      $Res Function(_$PlanificationTimeSlotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_$PlanificationTimeSlotImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanificationTimeSlotImpl
    with DiagnosticableTreeMixin
    implements _PlanificationTimeSlot {
  const _$PlanificationTimeSlotImpl({required this.value, required this.label});

  factory _$PlanificationTimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanificationTimeSlotImplFromJson(json);

  @override
  final String value;
  @override
  final String label;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlanificationTimeSlot(value: $value, label: $label)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlanificationTimeSlot'))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('label', label));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanificationTimeSlotImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanificationTimeSlotImplCopyWith<_$PlanificationTimeSlotImpl>
      get copyWith => __$$PlanificationTimeSlotImplCopyWithImpl<
          _$PlanificationTimeSlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanificationTimeSlotImplToJson(
      this,
    );
  }
}

abstract class _PlanificationTimeSlot implements PlanificationTimeSlot {
  const factory _PlanificationTimeSlot(
      {required final String value,
      required final String label}) = _$PlanificationTimeSlotImpl;

  factory _PlanificationTimeSlot.fromJson(Map<String, dynamic> json) =
      _$PlanificationTimeSlotImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$PlanificationTimeSlotImplCopyWith<_$PlanificationTimeSlotImpl>
      get copyWith => throw _privateConstructorUsedError;
}
