import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/utils/messenger_controller.dart';
import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';

class DressingCategoriesController
    extends StateNotifier<List<DressingCategory>?> {
  DressingCategoriesController(
      this.dressingRepository, this.messengerController)
      : super(null) {
    getDressingCategories();
  }

  final DressingRepository dressingRepository;
  final MessengerController messengerController;

  Future<void> getDressingCategories() async {
    final categories = await dressingRepository.getDressingCategories();
    categories.fold(
      (failure) => messengerController.showErrorSnackbar(failure.message),
      (dressingCategories) => state = dressingCategories,
    );
  }
}

final dressingCategoriesControllerProvider = StateNotifierProvider<
    DressingCategoriesController, List<DressingCategory>?>(
  (ref) => DressingCategoriesController(
    ref.watch(dressingRepositoryProvider),
    ref.watch(messengerControllerProvider),
  ),
);
