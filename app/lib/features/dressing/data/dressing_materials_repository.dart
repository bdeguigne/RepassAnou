import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_material_dto.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class DressingMaterialsRepository {
  DressingMaterialsRepository(
    this.supabase,
    this.logger,
  );

  final s.SupabaseClient supabase;
  final Logger logger;

  Future<void> addMaterialToDressing(
      String dressingId, List<DressingMaterial> materials) async {
    try {
      await supabase.usersDressingsMaterialsTable.insert(
        materials
            .map((material) => UserDressingMaterialDto(
                  userDressingId: dressingId,
                  dressingMaterialId: material.id,
                ).toJson())
            .toList(),
      );
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de l\'ajout de la matière au dressing');
    }
  }

  Future<void> deleteMaterialToDressing(UserDressing dressing) async {
    try {
      await supabase.usersDressingsMaterialsTable
          .delete()
          .eq('user_dressing_id', dressing.id ?? '');
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la suppression de la matière du dressing');
    }
  }

  Future<void> editMaterialToDressing(
      UserDressing dressing, List<DressingMaterial> materials) async {
    try {
      await deleteMaterialToDressing(dressing);
      await addMaterialToDressing(dressing.id ?? '', materials);
    } catch (e) {
      logger.e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la modification du la matière du dressing');
    }
  }
}

final Provider<DressingMaterialsRepository>
    dressingMatetialsRepositoryProvider =
    Provider<DressingMaterialsRepository>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  final logger = ref.watch(loggerProvider);
  return DressingMaterialsRepository(supabase, logger);
});
