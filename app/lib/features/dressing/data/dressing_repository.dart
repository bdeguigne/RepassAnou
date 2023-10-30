import 'dart:io';

import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
import 'package:repasse_anou/features/photo/data/image_storage_repository.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

part 'dressing_repository.g.dart';

class DressingRepository {
  DressingRepository(
    this.supabase,
    this.logger,
    this.userController,
    this.imageStorageRepository,
  );
  final s.SupabaseClient supabase;
  final Logger logger;
  final UserController userController;
  final ImageStorageRepository imageStorageRepository;

  Future<List<DressingCategory>> getDressingCategories() async {
    try {
      final response =
          await supabase.dressingCategoriesTable.select<s.PostgrestList>();
      final List<DressingCategory> dressingCategories = response
          .map((Map<String, dynamic> json) => DressingCategory.fromJson(json))
          .toList();

      return dressingCategories;
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération des catégories de vêtements');
    }
  }

  Future<List<DressingColor>> getDressingColors() async {
    try {
      final response =
          await supabase.dressingColorsTable.select<s.PostgrestList>();
      final List<DressingColor> dressingColors = response
          .map((Map<String, dynamic> json) => DressingColor.fromJson(json))
          .toList();
      return dressingColors;
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération des couleurs de vêtements');
    }
  }

  Future<List<DressingMaterial>> getDressingMaterials() async {
    try {
      final response =
          await supabase.dressingMaterialsTable.select<s.PostgrestList>();
      final List<DressingMaterial> dressingMaterials = response
          .map((Map<String, dynamic> json) => DressingMaterial.fromJson(json))
          .toList();
      return dressingMaterials;
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération des matières de vêtements');
    }
  }

  Future<List<UserDressing>> getUsersDressings() async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      final response = await supabase.usersDressingsTable
          .select<s.PostgrestList>(
              'id, users(*), title, dressing_categories(*), dressing_materials(*), dressing_colors(*), belongs_to, notes, image_path, is_favorite')
          .eq('user_id', userController.loggedUser!.id);

      final userDressings =
          response.map((data) => UserDressing.fromJson(data)).toList()
            ..sort(
              (a, b) => a.isFavorite == b.isFavorite
                  ? 0
                  : a.isFavorite
                      ? -1
                      : 1,
            );
      return userDressings;
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération du vêtement');
    }
  }

  Future<void> saveDressingItem(
    String title,
    DressingCategory category,
    DressingMaterial material,
    DressingColor color,
    String? belongsTo,
    String? notes,
    File image,
    bool isFavorite,
  ) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      final path = await imageStorageRepository.uploadImage(image);

      final userDressingDto = UserDressing(
        user: userController.loggedUser!,
        title: title,
        dressingCategory: category,
        dressingMaterial: material,
        dressingColor: color,
        belongsTo: belongsTo,
        notes: notes,
        imagePath: path,
        isFavorite: isFavorite,
      ).toDto();

      await supabase.usersDressingsTable.insert(userDressingDto.toJson());
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la sauvegarde du vêtement');
    }
  }

  Future<void> editDressingItem(
    String title,
    DressingCategory category,
    DressingMaterial material,
    DressingColor color,
    String? belongsTo,
    String? notes,
    // File image,
    UserDressing userDressing,
  ) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      // final path = await imageStorageRepository.uploadImage(image);

      final userDressingDto = userDressing
          .copyWith(
            title: title,
            dressingCategory: category,
            dressingMaterial: material,
            dressingColor: color,
            belongsTo: belongsTo,
            notes: notes,
            // imagePath: path,
          )
          .toDto();

      await supabase.usersDressingsTable
          .update(userDressingDto.toJson())
          .eq('id', userDressing.id);
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la sauvegarde du vêtement');
    }
  }

  Future<void> editFavoriteDressingItem(
    bool isFavorite,
    UserDressing userDressing,
  ) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      final userDressingDto = userDressing.copyWith(isFavorite: isFavorite);

      await supabase.usersDressingsTable
          .update(userDressingDto.toDto().toJson())
          .eq('id', userDressing.id);
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la sauvegarde du vêtement');
    }
  }
}

@riverpod
Future<List<DressingCategory>> dressingCategories(
    DressingCategoriesRef ref) async {
  final dressingRepository = ref.watch(dressingRepositoryProvider);
  return ref.notifyOnError(dressingRepository.getDressingCategories);
}

@riverpod
Future<List<DressingColor>> dressingColors(DressingColorsRef ref) async {
  final dressingRepository = ref.watch(dressingRepositoryProvider);
  return ref.notifyOnError(dressingRepository.getDressingColors);
}

@riverpod
Future<List<DressingMaterial>> dressingMaterials(
    DressingMaterialsRef ref) async {
  final dressingRepository = ref.watch(dressingRepositoryProvider);
  return ref.notifyOnError(dressingRepository.getDressingMaterials);
}

@Riverpod(keepAlive: true)
Future<List<UserDressing>> usersDressings(UsersDressingsRef ref) async {
  final dressingRepository = ref.watch(dressingRepositoryProvider);
  return ref.notifyOnError(dressingRepository.getUsersDressings);
}

final Provider<DressingRepository> dressingRepositoryProvider =
    Provider<DressingRepository>((ref) {
  return DressingRepository(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
    ref.read(userControllerProvider.notifier),
    ref.read(imageStorageRepositoryProvider),
  );
});
