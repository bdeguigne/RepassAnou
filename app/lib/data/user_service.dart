import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/shared/failures/failure.dart';
import 'package:repasse_anou/shared/models/user/user.dart';
import 'package:repasse_anou/shared/top_level_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class UserService {
  UserService(this.supabase, this.logger);

  final s.SupabaseClient supabase;
  final Logger logger;

  Future<Either<Failure, User>> getUserById(String id) async {
    try {
      final data = await supabase
          .from('users')
          .select<Map<String, dynamic>>()
          .eq('id', id)
          .single();
      return right(User.fromJson(data));
    } catch (e) {
      logger.e(e.toString());
      return left(const Failure('Impossible de récupérer l\'utilisateur'));
    }
  }

  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final data = await supabase.from('users').select<s.PostgrestList>();
      return right(
        data.map((userData) => User.fromJson(userData)).toList(),
      );
    } catch (e) {
      logger.e(e.toString());
      return left(const Failure('Impossible de récupérer l\'utilisateur'));
    }
  }

  Future<Either<Failure, Unit>> addUser(User user) async {
    try {
      await supabase.from('users').insert(user.toJson());
      return right(unit);
    } catch (e) {
      logger.e(e.toString());
      return left(const Failure('Impossible de créer l\'utilisateur'));
    }
  }
}

final Provider<UserService> userServiceProvider = Provider<UserService>((ref) {
  return UserService(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
  );
});
