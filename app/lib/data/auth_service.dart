import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/core/failures/auth_failure.dart';
import 'package:repasse_anou/core/top_level_providers.dart';
import 'package:repasse_anou/core/value_objects.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class AuthService {
  AuthService({required this.supabase});

  final s.SupabaseClient supabase;

  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword(
      EmailAddress email, Password password) async {
    try {
      final String emailStr = email.getOrCrash();
      final String passwordStr = password.getOrCrash();

      await supabase.auth.signUp(
        email: emailStr,
        password: passwordStr,
      );
      return right(unit);
    } on s.AuthException catch (error) {
      return left(AuthFailure.error(error.message));
    } catch (error) {
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
      return left(AuthFailure.error(error.message));
    } catch (error) {
      return left(const AuthFailure.unexpected());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await supabase.auth.signOut();
      return right(unit);
    } catch (error) {
      return left(const AuthFailure.unexpected());
    }
  }
}

final Provider<AuthService> authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    supabase: ref.read(supabaseClientProvider),
  );
});
