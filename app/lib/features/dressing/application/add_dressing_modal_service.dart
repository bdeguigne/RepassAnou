import 'dart:io';

import 'package:repasse_anou/features/dressing/data/dressing_belongs_to_repository.dart';
import 'package:repasse_anou/features/dressing/data/dressing_materials_repository.dart';
import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_and_image.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_belong_to.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_dressing_modal_service.g.dart';

@riverpod
class AddDressingModalService extends _$AddDressingModalService {
  @override
  FutureOr<UserDressingAndImage?> build() {
    return null;
  }

  Future<bool> saveDressingItem(
    String title,
    DressingCategory selectedCategory,
    List<DressingMaterial> selectedMaterial,
    DressingColor selectedColor,
    UserDressingBelongsTo? belongsTo,
    String? belongsToName,
    String notes,
    File image,
    bool isFavorite,
  ) async {
    state = const AsyncLoading();

    final DressingRepository dressingRepository =
        ref.read(dressingRepositoryProvider);
    final DressingMaterialsRepository dressingMaterialsRepository =
        ref.read(dressingMatetialsRepositoryProvider);
    final DressingBelongsToRepository dressingBelongsToRepository =
        ref.read(dressingBelongsToRepositoryProvider);

    if (belongsTo == null && belongsToName == null) {
      return false;
    }

    // if is belongsTo is null, we need to create it
    if (belongsTo == null) {
      state = await ref.guardAndNotifyOnError(
        () async {
          belongsTo =
              await dressingBelongsToRepository.addDressingBelongsToName(
            name: belongsToName!,
          );
          return null;
        },
      );
    }

    if (state.hasError || belongsTo == null) {
      return false;
    }

    state = const AsyncLoading();
    state = await ref.guardAndNotifyOnError(
      () => dressingRepository.saveDressingItem(title, selectedCategory,
          selectedColor, belongsTo!, notes, image, isFavorite),
    );

    if (state.hasError ||
        state.value == null ||
        state.value!.userDressing.id == null) {
      return false;
    }

    state = const AsyncLoading();
    state = await ref.guardAndNotifyOnError(
      () async {
        await dressingMaterialsRepository.addMaterialToDressing(
            state.value!.userDressing.id!, selectedMaterial);
        return state.value!;
      },
      successMessage: 'Vêtement enregistré avec succès',
    );

    return state.hasError == false;
  }

  Future<bool> editDressingItem(
    String title,
    DressingCategory selectedCategory,
    List<DressingMaterial> selectedMaterial,
    DressingColor selectedColor,
    UserDressingBelongsTo? belongsTo,
    String? belongsToName,
    String notes,
    UserDressing dressingItem,
    File? image,
  ) async {
    final DressingRepository dressingRepository =
        ref.read(dressingRepositoryProvider);
    final DressingBelongsToRepository dressingBelongsToRepository =
        ref.read(dressingBelongsToRepositoryProvider);
    state = const AsyncLoading();

    if (belongsTo == null && belongsToName == null) {
      return false;
    }

    // if is belongsTo is null, we need to create it
    if (belongsTo == null) {
      state = await ref.guardAndNotifyOnError(
        () async {
          belongsTo =
              await dressingBelongsToRepository.addDressingBelongsToName(
            name: belongsToName!,
          );
          return null;
        },
      );
    }

    if (state.hasError || belongsTo == null) {
      return false;
    }

    state = const AsyncLoading();
    state = await ref.guardAndNotifyOnError(
      () => dressingRepository.editDressingItem(
        title,
        selectedCategory,
        selectedMaterial,
        selectedColor,
        belongsTo!,
        notes,
        dressingItem,
        image,
      ),
      successMessage: 'Vêtement modifié avec succès',
    );

    return state.hasError == false;
  }

  Future<bool> editFavoriteDressingItem(
      bool isFavorite, UserDressing dressingItem) async {
    final DressingRepository dressingRepository =
        ref.read(dressingRepositoryProvider);
    state = const AsyncLoading();

    state = await ref.guardAndNotifyOnError(
      () async {
        dressingRepository.editFavoriteDressingItem(isFavorite, dressingItem);
        return null;
      },
      successMessage:
          'Vêtement ${isFavorite == true ? "ajouté" : "supprimé"} des favoris',
    );

    return state.hasError == false;
  }
}
