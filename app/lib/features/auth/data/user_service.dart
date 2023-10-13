import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/auth/models/user.dart';
import 'package:repasse_anou/failures/failure.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class UserService {
  UserService(
    this.supabase,
    this.logger,
    this.userController,
  );

  final s.SupabaseClient supabase;
  final Logger logger;
  final UserController userController;

  Future<Either<Failure, User>> getUserById(String id) async {
    try {
      final data = await supabase.usersTable
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
      final data = await supabase.usersTable.select<s.PostgrestList>();
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
      await supabase.usersTable.insert(user.toJson());
      return right(unit);
    } catch (e) {
      logger.e(e.toString());
      return left(const Failure('Impossible de créer l\'utilisateur'));
    }
  }

  Future<Either<Failure, Unit>> setDressingMessageReadForUser() async {
    try {
      if (userController.loggedUser == null) {
        return left(const Failure('Impossible de récupérer l\'utilisateur'));
      }

      final updatedUser =
          userController.loggedUser!.copyWith(hasReadDressingMessage: true);

      await supabase.usersTable
          .update(updatedUser.toJson())
          .eq('id', updatedUser.id);

      userController.updateUser(updatedUser);

      logger.i('Message dressing lu');

      return right(unit);
    } catch (e) {
      logger.e(e.toString());
      return left(const Failure('Impossible de mettre à jour le dressing'));
    }
  }
}

final Provider<UserService> userServiceProvider = Provider<UserService>((ref) {
  return UserService(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
    ref.read(userControllerProvider.notifier),
  );
});
