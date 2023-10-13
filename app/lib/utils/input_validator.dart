import 'package:repasse_anou/failures/value_failures.dart';
import 'package:repasse_anou/utils/value_objects.dart';

class InputValidator {
  static String? email(EmailAddress email) => email.value.fold(
        (ValueFailure<String> failure) => failure.maybeMap(
          invalidEmail: (_) => 'Adresse e-mail invalide',
          orElse: () => null,
        ),
        (String success) => null,
      );
  static String? password(Password password) => password.value.fold(
        (ValueFailure<String> failure) => failure.maybeMap(
          invalidPassword: (_) => 'Mot de passe invalide',
          orElse: () => null,
        ),
        (String success) => null,
      );

  static String? passwordsmustMatch(Password input, Password match) =>
      input != match ? 'Les mots de passe ne correspondent pas' : null;

  static String? notEmpty(String? value) =>
      value == '' ? 'Ce champ doit être renseigné' : null;
}
