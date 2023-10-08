import 'package:dartz/dartz.dart';

import 'failures/value_failures.dart';

class ValueValidator {
  static Either<ValueFailure<String>, String> validateEmail(String input) {
    const String emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+""";
    if (RegExp(emailRegex).hasMatch(input)) {
      return right(input);
    } else {
      return left(ValueFailure.invalidEmail(failedValue: input));
    }
  }

  static Either<ValueFailure<String>, String> validatePassword(String input) {
    const String passwordRegex =
        r'''^(?=.*[A-Z])(?=.*\d)(?=.*\W|\/)[A-Za-z\d#$@!%&*?/]{8,}$''';
    if (RegExp(passwordRegex).hasMatch(input)) {
      return right(input);
    } else {
      return left(ValueFailure.invalidPassword(failedValue: input));
    }
  }
}
