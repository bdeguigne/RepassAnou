import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_belong_to.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_belong_to_dto.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

part 'dressing_belongs_to_repository.g.dart';

class DressingBelongsToRepository {
  DressingBelongsToRepository(
    this.supabase,
    this.logger,
    this.userController,
  );

  final s.SupabaseClient supabase;
  final Logger logger;
  final UserController userController;

  Future<List<UserDressingBelongsTo>> getUsersDressingsBelongsTo() async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }
      final response = await supabase.usersDressingsBelongsToTable
          .select()
          .eq('user_id', userController.loggedUser!.id);

      final usersDressingsBelongsTo = response.map((data) {
        return UserDressingBelongsTo.fromJson(data);
      }).toList();
      return usersDressingsBelongsTo;
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération des appartenances de vêtements');
    }
  }

  Future<UserDressingBelongsTo?> addDressingBelongsToName({
    required String name,
    String? userDressingBelongToId,
  }) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      s.PostgrestMap;

      if (userDressingBelongToId == null) {
        final data = await supabase.usersDressingsBelongsToTable
            .insert(UserDressingBelongsToDto(
              name: name,
              userId: userController.loggedUser!.id,
            ).toJson())
            .select('id, name')
            .single();

        return UserDressingBelongsTo.fromJson(data);
      }
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de l\'ajout de l\'appartenance au dressing');
    }
    return null;
  }
}

@riverpod
Future<List<UserDressingBelongsTo>> usersDressingsBelongsTo(
    UsersDressingsBelongsToRef ref) async {
  final dressingRepository = ref.watch(dressingBelongsToRepositoryProvider);
  return ref.notifyOnError(dressingRepository.getUsersDressingsBelongsTo);
}

final Provider<DressingBelongsToRepository>
    dressingBelongsToRepositoryProvider = Provider<DressingBelongsToRepository>(
  (ref) {
    return DressingBelongsToRepository(
      ref.read(supabaseClientProvider),
      ref.read(loggerProvider),
      ref.read(userControllerProvider.notifier),
    );
  },
);
