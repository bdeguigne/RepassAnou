import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/shared/failures/failure.dart';
import 'package:repasse_anou/shared/models/dressing_category/dressing_category.dart';
import 'package:repasse_anou/shared/models/dressing_color/dressing_color.dart';
import 'package:repasse_anou/shared/models/dressing_material/dressing_material.dart';
import 'package:repasse_anou/shared/supabase_extension.dart';
import 'package:repasse_anou/shared/top_level_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class DressingService {
  DressingService(this.supabase, this.logger);
  final s.SupabaseClient supabase;
  final Logger logger;

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
}

final Provider<DressingService> dressingServiceProvider =
    Provider<DressingService>((ref) {
  return DressingService(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
  );
});
