import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repasse_anou/shared/failures/value_failures.dart';
import 'package:repasse_anou/shared/value_validator.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    //                                                      id = identity - same as writing (right) => right
    return value.fold((ValueFailure<T> f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$value';
}

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      ValueValidator.validateEmail(input),
    );
  }

  const EmailAddress._(this.value);

  factory EmailAddress.fromJson(String jsonValue) =>
      EmailAddress._(ValueValidator.validateEmail(jsonValue));

  String toJson() => value.getOrElse(() => '');

  @override
  String toString() => value.getOrElse(() => '');

  factory EmailAddress.empty() => EmailAddress('');
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      ValueValidator.validatePassword(input),
    );
  }

  const Password._(this.value);

  factory Password.fromJson(String jsonValue) =>
      Password._(ValueValidator.validatePassword(jsonValue));

  String toJson() => value.getOrElse(() => 'Mot de passe invalide');

  factory Password.empty() => Password('');
}
