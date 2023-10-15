import 'dart:io';

import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_dressing_modal_controller.g.dart';

@riverpod
class AddDressingModalController extends _$AddDressingModalController {
  @override
  FutureOr<void> build() {}

  Future<bool> saveDressingItem(
    String title,
    DressingCategory selectedCategory,
    DressingMaterial selectedMaterial,
    DressingColor selectedColor,
    String belongsTo,
    String notes,
    File image,
  ) async {
    final DressingRepository dressingRepository =
        ref.read(dressingRepositoryProvider);
    state = const AsyncLoading();

    state = await ref.guardAndNotifyOnError(
      () => dressingRepository.saveDressingItem(title, selectedCategory,
          selectedMaterial, selectedColor, belongsTo, notes, image),
      successMessage: 'Vêtement enregistré avec succès',
    );

    return state.hasError == false;
  }
}
