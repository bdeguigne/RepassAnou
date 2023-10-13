import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
import 'package:repasse_anou/failures/failure.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class DressingService {
  DressingService(
    this.supabase,
    this.logger,
    this.userController,
  );
  final s.SupabaseClient supabase;
  final Logger logger;
  final UserController userController;

  Future<Either<Failure, List<DressingCategory>>>
      getDressingCategories() async {
    try {
      final response =
          await supabase.dressingCategoriesTable.select<s.PostgrestList>();
      final List<DressingCategory> dressingCategories = response
          .map((Map<String, dynamic> json) => DressingCategory.fromJson(json))
          .toList();
      return right(dressingCategories);
    } catch (e) {
      logger.e(e);
      return left(const Failure(
          'Une erreur est survenue lors de la récupération des catégories de vêtements'));
    }
  }

  Future<Either<Failure, List<DressingColor>>> getDressingColors() async {
    try {
      final response =
          await supabase.dressingColorsTable.select<s.PostgrestList>();
      final List<DressingColor> dressingColors = response
          .map((Map<String, dynamic> json) => DressingColor.fromJson(json))
          .toList();
      return right(dressingColors);
    } catch (e) {
      logger.e(e);
      return left(const Failure(
          'Une erreur est survenue lors de la récupération des couleurs de vêtements'));
    }
  }

  Future<Either<Failure, List<DressingMaterial>>> getDressingMaterials() async {
    try {
      final response =
          await supabase.dressingMaterialsTable.select<s.PostgrestList>();
      final List<DressingMaterial> dressingMaterials = response
          .map((Map<String, dynamic> json) => DressingMaterial.fromJson(json))
          .toList();
      return right(dressingMaterials);
    } catch (e) {
      logger.e(e);
      return left(const Failure(
          'Une erreur est survenue lors de la récupération des matières de vêtements'));
    }
  }

  Future<Either<Failure, List<UserDressing>>> getUsersDressings() async {
    try {
      if (userController.loggedUser == null) {
        return left(const Failure('Impossible de récupérer l\'utilisateur'));
      }

      final response = await supabase.usersDressingsTable
          .select<s.PostgrestList>(
              'id, users(*), title, dressing_categories(*), dressing_materials(*), dressing_colors(*), belongs_to, notes')
          .eq('user_id', userController.loggedUser!.id);

      final userDressings =
          response.map((data) => UserDressing.fromJson(data)).toList();
      return right(userDressings);
    } catch (e) {
      logger.e(e);
      return left(const Failure(
          'Une erreur est survenue lors de la récupération du vêtement'));
    }
  }

  Future<Either<Failure, Unit>> saveDressingItem(
    String title,
    DressingCategory category,
    DressingMaterial material,
    DressingColor color,
    String? belongsTo,
    String? notes,
  ) async {
    try {
      if (userController.loggedUser == null) {
        return left(const Failure('Impossible de récupérer l\'utilisateur'));
      }

      final userDressingDto = UserDressing(
        user: userController.loggedUser!,
        title: title,
        dressingCategory: category,
        dressingMaterial: material,
        dressingColor: color,
        belongsTo: belongsTo,
        notes: notes,
      ).toDto();

      await supabase.usersDressingsTable.insert(userDressingDto.toJson());

      return right(unit);
    } catch (e) {
      logger.e(e);
      return left(
        const Failure(
            'Une erreur est survenue lors de la sauvegarde du vêtement'),
      );
    }
  }
}

final Provider<DressingService> dressingServiceProvider =
    Provider<DressingService>((ref) {
  return DressingService(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
    ref.read(userControllerProvider.notifier),
  );
});
