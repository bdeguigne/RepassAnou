import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
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
}
