import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/data/user_service.dart';
import 'package:repasse_anou/shared/failures/auth_failure.dart';
import 'package:repasse_anou/shared/models/user/user.dart';
import 'package:repasse_anou/shared/top_level_providers.dart';
import 'package:repasse_anou/shared/value_objects.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class AuthService {
  AuthService(
    this.supabase,
    this.userService,
    this.logger,
  );

  final s.SupabaseClient supabase;
  final UserService userService;
  final Logger logger;

  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword(
      EmailAddress email,
      Password password,
      String firstName,
      String lastName) async {
    try {
      final String emailStr = email.getOrCrash();
      final String passwordStr = password.getOrCrash();

      final authResponse = await supabase.auth.signUp(
        email: emailStr,
        password: passwordStr,
      );

      if (authResponse.user?.id != null) {
        final req = await userService.addUser(User(
          id: authResponse.user!.id,
          email: email,
          firstName: firstName,
          lastName: lastName,
        ));

        return req.fold(
          (failure) {
            logger.e(failure.message);
            return left(const AuthFailure.cannotCreateUserData());
          },
          (r) => right(unit),
        );
      }

      return right(unit);
    } on s.AuthException catch (error) {
      logger.e(error.message);
      return left(AuthFailure.error(error.message));
    } catch (error) {
      logger.e(error.toString());
      return left(const AuthFailure.unexpected());
    }
  }

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      EmailAddress email, Password password) async {
    try {
      final String emailStr = email.getOrCrash();
      final String passwordStr = password.getOrCrash();

      await supabase.auth.signInWithPassword(
        email: emailStr,
        password: passwordStr,
      );
      return right(unit);
    } on s.AuthException catch (error) {
      logger.e(error.message);
      return left(AuthFailure.error(error.message));
    } catch (error) {
      logger.e(error.toString());
      return left(const AuthFailure.unexpected());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await supabase.auth.signOut();
      return right(unit);
    } catch (error) {
      logger.e(error.toString());
      return left(const AuthFailure.unexpected());
    }
  }
}

final Provider<AuthService> authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.read(supabaseClientProvider),
    ref.read(userServiceProvider),
    ref.read(loggerProvider),
  );
});
