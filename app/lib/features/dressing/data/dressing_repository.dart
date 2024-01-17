import 'dart:io';

import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/dressing/application/dressing_filter_controller.dart';
import 'package:repasse_anou/features/dressing/data/dressing_materials_repository.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_filter.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_and_image.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_belong_to.dart';
import 'package:repasse_anou/features/photo/data/image_storage_repository.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;
import 'package:supabase_flutter/supabase_flutter.dart';

part 'dressing_repository.g.dart';

class DressingRepository {
  DressingRepository(
    this.supabase,
    this.logger,
    this.userController,
    this.imageStorageRepository,
    this.dressingMaterialsRepository,
  );
  final s.SupabaseClient supabase;
  final Logger logger;
  final UserController userController;
  final ImageStorageRepository imageStorageRepository;
  final DressingMaterialsRepository dressingMaterialsRepository;

  Future<List<DressingCategory>> getDressingCategories() async {
    try {
      final response = await supabase.dressingCategoriesTable.select();
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
      final response = await supabase.dressingColorsTable.select();
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
      final response = await supabase.dressingMaterialsTable
          .select()
          .order('id', ascending: true);
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

  Future<List<UserDressing>> getUsersDressingsByBelongsTo(
    UserDressingBelongsTo userDressingBelongsTo,
    DressingFilter filter,
  ) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      List<String> filteredDressingIds = [];
      if (filter.material != null) {
        final materialFilterResponse = await supabase.usersDressingsTable
            .select('id, dressing_materials!inner(id)')
            .eq('user_id', userController.loggedUser!.id)
            .eq('user_dressing_belongs_to_id', userDressingBelongsTo.id)
            .inFilter('dressing_materials.id',
                filter.material!.map((e) => e.id).toList());

        filteredDressingIds =
            materialFilterResponse.map((e) => e['id'] as String).toList();
      }

      PostgrestFilterBuilder<PostgrestList> query = supabase.usersDressingsTable
          .select(
              'id, users(*), title, dressing_categories(*), dressing_materials(*), dressing_colors(*), users_dressings_belongs_to(id, name), notes, image_path, is_favorite, created_at')
          .eq('user_id', userController.loggedUser!.id)
          .eq('user_dressing_belongs_to_id', userDressingBelongsTo.id);

      if (filter.category != null) {
        query = query.eq('dressing_category_id', filter.category!.id);
      }

      // if (filter.material != null) {
      //   logger.e(filter.material);
      //   query = query.inFilter('dressing_materials.id',
      //       filter.material!.map((e) => e.id).toList());

      // }
      if (filteredDressingIds.isNotEmpty) {
        query = query.inFilter('id', filteredDressingIds);
      }

      if (filter.color != null) {
        query = query.eq('dressing_color_id', filter.color!.id);
      }

      final response = await query.order('created_at').limit(5);

      final userDressings = response.map((data) {
        return UserDressing.fromJson(data);
      }).toList()
        ..sort(
          (a, b) => a.isFavorite == b.isFavorite
              ? 0
              : a.isFavorite
                  ? -1
                  : 1,
        );

      logger.d(userDressings);
      return userDressings;
    } catch (e) {
      logger.e(e);
      logger.e(e.runtimeType);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération du vêtement');
    }
  }

  Future<UserDressingAndImage?> saveDressingItem(
    String title,
    DressingCategory category,
    DressingColor color,
    UserDressingBelongsTo belongsTo,
    String? notes,
    File image,
    bool isFavorite,
  ) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      final path = await imageStorageRepository.uploadImage(image);

      final UserDressing updatedUserDressing = UserDressing(
        user: userController.loggedUser!,
        title: title,
        dressingCategory: category,
        dressingColor: color,
        belongsTo: belongsTo,
        notes: notes,
        imagePath: path,
        isFavorite: isFavorite,
        createdAt: DateTime.now(),
      );

      final data = await supabase.usersDressingsTable
          .insert(updatedUserDressing.toDto().toJson())
          .select('id')
          .single();

      return UserDressingAndImage(
        userDressing: updatedUserDressing.copyWith(
          id: data['id'],
        ),
      );
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la sauvegarde du vêtement');
    }
  }

  Future<UserDressingAndImage?> editDressingItem(
    String title,
    DressingCategory category,
    List<DressingMaterial> materials,
    DressingColor color,
    UserDressingBelongsTo belongsTo,
    String? notes,
    UserDressing userDressing,
    File? image,
  ) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }
      if (materials.isEmpty) {
        throw const ExceptionMessage(
            'Veuillez sélectionner au moins une matière');
      }
      String? path;
      if (image != null) {
        // remove old image
        await imageStorageRepository.deleteImage(userDressing.imagePath);

        path = await imageStorageRepository.uploadImage(image);
      }

      final isMaterialsDifferent =
          materials.length != userDressing.dressingMaterials.length ||
              !userDressing.dressingMaterials
                  .every((element) => materials.contains(element));

      if (isMaterialsDifferent) {
        logger.i('materials are different');
        await dressingMaterialsRepository.editMaterialToDressing(
            userDressing, materials);
      }

      final UserDressing updatedUserDressing = userDressing.copyWith(
        title: title,
        dressingCategory: category,
        dressingMaterials:
            isMaterialsDifferent ? materials : userDressing.dressingMaterials,
        dressingColor: color,
        belongsTo: belongsTo,
        notes: notes,
        imagePath: path ?? userDressing.imagePath,
      );

      if (isMaterialsDifferent) {}

      await supabase.usersDressingsTable
          .update(updatedUserDressing.toDto().toJson())
          .eq('id', userDressing.id ?? '');

      // return the data with image to update the UI
      return UserDressingAndImage(
          userDressing: updatedUserDressing, image: image?.readAsBytesSync());
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
          .eq('id', userDressing.id ?? '');
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la sauvegarde du vêtement');
    }
  }

  Future<void> deleteUserDressing(UserDressing dressing) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      await supabase.usersDressingsTable.delete().eq('id', dressing.id ?? '');
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la suppression du vêtement');
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

@Riverpod(keepAlive: false)
Future<List<UserDressing>> usersDressingsByBelongsTo(
    UsersDressingsByBelongsToRef ref,
    UserDressingBelongsTo userDressingBelongsTo) async {
  final dressingRepository = ref.watch(dressingRepositoryProvider);
  final filter = ref.watch(dressingFilterControllerProvider);
  return ref.notifyOnError(
    () => dressingRepository.getUsersDressingsByBelongsTo(
        userDressingBelongsTo, filter),
  );
}

final Provider<DressingRepository> dressingRepositoryProvider =
    Provider<DressingRepository>((ref) {
  return DressingRepository(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
    ref.read(userControllerProvider.notifier),
    ref.read(imageStorageRepositoryProvider),
    ref.read(dressingMatetialsRepositoryProvider),
  );
});
