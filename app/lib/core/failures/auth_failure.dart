import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.error(String message) = ErrorMessage;
  const factory AuthFailure.unexpected() = Unexpected;
}

extension AuthFailureExtension on AuthFailure {
  String get message {
    return when(
      error: (message) => message,
      unexpected: () => 'Une erreur inattendue est survenue',
    );
  }
}