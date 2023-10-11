import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/controllers/messenger_controller.dart';
import 'package:repasse_anou/data/dressing_service.dart';
import 'package:repasse_anou/shared/models/dressing_category/dressing_category.dart';

class DressingCategoriesController
    extends StateNotifier<List<DressingCategory>?> {
  DressingCategoriesController(this.dressingService, this.messengerController)
      : super(null) {
    getDressingCategories();
  }

  final DressingService dressingService;
  final MessengerController messengerController;

  Future<void> getDressingCategories() async {
    final categories = await dressingService.getDressingCategories();
    categories.fold(
      (failure) => messengerController.showErrorSnackbar(failure.message),
      (dressingCategories) => state = dressingCategories,
    );
  }
}

final dressingCategoriesControllerProvider =
    StateNotifierProvider<DressingCategoriesController, List<DressingCategory>?>(
  (ref) => DressingCategoriesController(
    ref.watch(dressingServiceProvider),
    ref.watch(messengerControllerProvider),
  ),
);
