import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/shared/failures/auth_failure.dart';
import 'package:repasse_anou/shared/models/user/user.dart';
import 'package:repasse_anou/shared/utils/supabase_extension.dart';
import 'package:repasse_anou/shared/top_level_providers.dart';
import 'package:repasse_anou/shared/value_objects.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class AuthService {
  AuthService(
    this.supabase,
    this.logger,
  );

  final s.SupabaseClient supabase;
  final Logger logger;

  Future<Either<AuthFailure, User>> getAppUser() async {
    try {
      final s.User? currentUser = supabase.auth.currentUser;
      if (currentUser == null) {
        return left(const AuthFailure.notConnected());
      }

      final s.PostgrestMap data = await supabase.usersTable
          .select<s.PostgrestMap>()
          .eq('id', currentUser.id)
          .single();

      final user = User.fromJson(data);

      return right(user);
    } catch (e) {
      logger.e(e.toString());
      return left(const AuthFailure.unexpected());
    }
  }

  Future<Either<AuthFailure, String?>> signUpWithEmailAndPassword(
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

      return right(authResponse.user?.id);
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
    ref.read(loggerProvider),
  );
});
