import 'package:repasse_anou/features/dressing/data/dressing_materials_repository.dart';
import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
import 'package:repasse_anou/features/photo/data/image_storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:repasse_anou/utils/extensions.dart';

part 'dressing_detail_screen_service.g.dart';

@riverpod
class DressingDetailScreenService extends _$DressingDetailScreenService {
  @override
  FutureOr<void> build() {}

  Future<bool> editFavoriteDressingItem(
      bool isFavorite, UserDressing dressingItem) async {
    final DressingRepository dressingRepository =
        ref.read(dressingRepositoryProvider);
    state = const AsyncLoading();

    state = await ref.guardAndNotifyOnError(
      () =>
          dressingRepository.editFavoriteDressingItem(isFavorite, dressingItem),
      successMessage:
          'Vêtement ${isFavorite == true ? "ajouté" : "supprimé"} des favoris',
    );

    return state.hasError == false;
  }

  Future<bool> deleteUserDressing(UserDressing dressing) async {
    state = const AsyncLoading();
    final DressingRepository dressingRepository =
        ref.read(dressingRepositoryProvider);
    final DressingMaterialsRepository dressingMaterialsRepository =
        ref.read(dressingMatetialsRepositoryProvider);
    final ImageStorageRepository imageStorageRepository =
        ref.read(imageStorageRepositoryProvider);

    state = await ref.guardAndNotifyOnError(
      () => dressingMaterialsRepository.deleteMaterialToDressing(dressing),
    );

    if (state.hasError) {
      return false;
    }

    state = await ref.guardAndNotifyOnError(
      () => imageStorageRepository.deleteImage(dressing.imagePath),
    );

    if (state.hasError) {
      return false;
    }

    state = await ref.guardAndNotifyOnError(
      () => dressingRepository.deleteUserDressing(dressing),
      successMessage: 'Vêtement supprimé',
    );

    return state.hasError == false;
  }
}
