// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() cannotCreateUserData,
    required TResult Function() notConnected,
    required TResult Function() notFound,
    required TResult Function() unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? cannotCreateUserData,
    TResult? Function()? notConnected,
    TResult? Function()? notFound,
    TResult? Function()? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? cannotCreateUserData,
    TResult Function()? notConnected,
    TResult Function()? notFound,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorMessage value) error,
    required TResult Function(CannotCreateUserData value) cannotCreateUserData,
    required TResult Function(NotConnected value) notConnected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorMessage value)? error,
    TResult? Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult? Function(NotConnected value)? notConnected,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorMessage value)? error,
    TResult Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult Function(NotConnected value)? notConnected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res, AuthFailure>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res, $Val extends AuthFailure>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorMessageImplCopyWith<$Res> {
  factory _$$ErrorMessageImplCopyWith(
          _$ErrorMessageImpl value, $Res Function(_$ErrorMessageImpl) then) =
      __$$ErrorMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorMessageImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$ErrorMessageImpl>
    implements _$$ErrorMessageImplCopyWith<$Res> {
  __$$ErrorMessageImplCopyWithImpl(
      _$ErrorMessageImpl _value, $Res Function(_$ErrorMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorMessageImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorMessageImpl implements ErrorMessage {
  const _$ErrorMessageImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorMessageImplCopyWith<_$ErrorMessageImpl> get copyWith =>
      __$$ErrorMessageImplCopyWithImpl<_$ErrorMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() cannotCreateUserData,
    required TResult Function() notConnected,
    required TResult Function() notFound,
    required TResult Function() unexpected,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? cannotCreateUserData,
    TResult? Function()? notConnected,
    TResult? Function()? notFound,
    TResult? Function()? unexpected,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? cannotCreateUserData,
    TResult Function()? notConnected,
    TResult Function()? notFound,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorMessage value) error,
    required TResult Function(CannotCreateUserData value) cannotCreateUserData,
    required TResult Function(NotConnected value) notConnected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unexpected value) unexpected,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorMessage value)? error,
    TResult? Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult? Function(NotConnected value)? notConnected,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unexpected value)? unexpected,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorMessage value)? error,
    TResult Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult Function(NotConnected value)? notConnected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorMessage implements AuthFailure {
  const factory ErrorMessage(final String message) = _$ErrorMessageImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorMessageImplCopyWith<_$ErrorMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CannotCreateUserDataImplCopyWith<$Res> {
  factory _$$CannotCreateUserDataImplCopyWith(_$CannotCreateUserDataImpl value,
          $Res Function(_$CannotCreateUserDataImpl) then) =
      __$$CannotCreateUserDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CannotCreateUserDataImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$CannotCreateUserDataImpl>
    implements _$$CannotCreateUserDataImplCopyWith<$Res> {
  __$$CannotCreateUserDataImplCopyWithImpl(_$CannotCreateUserDataImpl _value,
      $Res Function(_$CannotCreateUserDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CannotCreateUserDataImpl implements CannotCreateUserData {
  const _$CannotCreateUserDataImpl();

  @override
  String toString() {
    return 'AuthFailure.cannotCreateUserData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CannotCreateUserDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() cannotCreateUserData,
    required TResult Function() notConnected,
    required TResult Function() notFound,
    required TResult Function() unexpected,
  }) {
    return cannotCreateUserData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? cannotCreateUserData,
    TResult? Function()? notConnected,
    TResult? Function()? notFound,
    TResult? Function()? unexpected,
  }) {
    return cannotCreateUserData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? cannotCreateUserData,
    TResult Function()? notConnected,
    TResult Function()? notFound,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (cannotCreateUserData != null) {
      return cannotCreateUserData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorMessage value) error,
    required TResult Function(CannotCreateUserData value) cannotCreateUserData,
    required TResult Function(NotConnected value) notConnected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unexpected value) unexpected,
  }) {
    return cannotCreateUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorMessage value)? error,
    TResult? Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult? Function(NotConnected value)? notConnected,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unexpected value)? unexpected,
  }) {
    return cannotCreateUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorMessage value)? error,
    TResult Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult Function(NotConnected value)? notConnected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (cannotCreateUserData != null) {
      return cannotCreateUserData(this);
    }
    return orElse();
  }
}

abstract class CannotCreateUserData implements AuthFailure {
  const factory CannotCreateUserData() = _$CannotCreateUserDataImpl;
}

/// @nodoc
abstract class _$$NotConnectedImplCopyWith<$Res> {
  factory _$$NotConnectedImplCopyWith(
          _$NotConnectedImpl value, $Res Function(_$NotConnectedImpl) then) =
      __$$NotConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotConnectedImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$NotConnectedImpl>
    implements _$$NotConnectedImplCopyWith<$Res> {
  __$$NotConnectedImplCopyWithImpl(
      _$NotConnectedImpl _value, $Res Function(_$NotConnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotConnectedImpl implements NotConnected {
  const _$NotConnectedImpl();

  @override
  String toString() {
    return 'AuthFailure.notConnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() cannotCreateUserData,
    required TResult Function() notConnected,
    required TResult Function() notFound,
    required TResult Function() unexpected,
  }) {
    return notConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? cannotCreateUserData,
    TResult? Function()? notConnected,
    TResult? Function()? notFound,
    TResult? Function()? unexpected,
  }) {
    return notConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? cannotCreateUserData,
    TResult Function()? notConnected,
    TResult Function()? notFound,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorMessage value) error,
    required TResult Function(CannotCreateUserData value) cannotCreateUserData,
    required TResult Function(NotConnected value) notConnected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unexpected value) unexpected,
  }) {
    return notConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorMessage value)? error,
    TResult? Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult? Function(NotConnected value)? notConnected,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unexpected value)? unexpected,
  }) {
    return notConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorMessage value)? error,
    TResult Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult Function(NotConnected value)? notConnected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected(this);
    }
    return orElse();
  }
}

abstract class NotConnected implements AuthFailure {
  const factory NotConnected() = _$NotConnectedImpl;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotFoundImpl implements NotFound {
  const _$NotFoundImpl();

  @override
  String toString() {
    return 'AuthFailure.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() cannotCreateUserData,
    required TResult Function() notConnected,
    required TResult Function() notFound,
    required TResult Function() unexpected,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? cannotCreateUserData,
    TResult? Function()? notConnected,
    TResult? Function()? notFound,
    TResult? Function()? unexpected,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? cannotCreateUserData,
    TResult Function()? notConnected,
    TResult Function()? notFound,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorMessage value) error,
    required TResult Function(CannotCreateUserData value) cannotCreateUserData,
    required TResult Function(NotConnected value) notConnected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unexpected value) unexpected,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorMessage value)? error,
    TResult? Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult? Function(NotConnected value)? notConnected,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unexpected value)? unexpected,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorMessage value)? error,
    TResult Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult Function(NotConnected value)? notConnected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound implements AuthFailure {
  const factory NotFound() = _$NotFoundImpl;
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<$Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl value, $Res Function(_$UnexpectedImpl) then) =
      __$$UnexpectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$UnexpectedImpl>
    implements _$$UnexpectedImplCopyWith<$Res> {
  __$$UnexpectedImplCopyWithImpl(
      _$UnexpectedImpl _value, $Res Function(_$UnexpectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnexpectedImpl implements Unexpected {
  const _$UnexpectedImpl();

  @override
  String toString() {
    return 'AuthFailure.unexpected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() cannotCreateUserData,
    required TResult Function() notConnected,
    required TResult Function() notFound,
    required TResult Function() unexpected,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? cannotCreateUserData,
    TResult? Function()? notConnected,
    TResult? Function()? notFound,
    TResult? Function()? unexpected,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? cannotCreateUserData,
    TResult Function()? notConnected,
    TResult Function()? notFound,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorMessage value) error,
    required TResult Function(CannotCreateUserData value) cannotCreateUserData,
    required TResult Function(NotConnected value) notConnected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorMessage value)? error,
    TResult? Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult? Function(NotConnected value)? notConnected,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorMessage value)? error,
    TResult Function(CannotCreateUserData value)? cannotCreateUserData,
    TResult Function(NotConnected value)? notConnected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected implements AuthFailure {
  const factory Unexpected() = _$UnexpectedImpl;
}
