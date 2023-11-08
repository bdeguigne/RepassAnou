import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_belong_to.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_belong_to_dto.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class DressingBelongsToRepository {
  DressingBelongsToRepository(
    this.supabase,
    this.logger,
    this.userController,
  );

  final s.SupabaseClient supabase;
  final Logger logger;
  final UserController userController;

  Future<UserDressingBelongsTo?> addDressingBelongsToName({
    required String name,
    String? userDressingBelongToId,
  }) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      if (userDressingBelongToId == null) {
        final data = await supabase.usersDressingsBelongsToTable
            .insert(UserDressingBelongsToDto(
              name: name,
              userId: userController.loggedUser!.id,
            ).toJson())
            .select<s.PostgrestMap>('id, name')
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
