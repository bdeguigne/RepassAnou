import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/features/auth/models/user.dart';
import 'package:repasse_anou/failures/auth_failure.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:repasse_anou/utils/value_objects.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class AuthRepository {
  AuthRepository(
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

  Future<void> signInWithEmailAndPassword(
      EmailAddress email, Password password) async {
    try {
      final String emailStr = email.getOrCrash();
      final String passwordStr = password.getOrCrash();

      await supabase.auth.signInWithPassword(
        email: emailStr,
        password: passwordStr,
      );
    } on s.AuthException catch (error) {
      logger.e(error.message);
      throw AuthFailure.error(error.message);
    } catch (error) {
      logger.e(error.toString());
      throw const AuthFailure.unexpected();
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

final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
  );
});
