import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/utils/messenger_controller.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';

class DressingMaterialsController
    extends StateNotifier<List<DressingMaterial>?> {
  DressingMaterialsController(this.dressingRepository, this.messengerController)
      : super(null) {
    getDressingMaterials();
  }

  final DressingRepository dressingRepository;
  final MessengerController messengerController;

  Future<void> getDressingMaterials() async {
    final materials = await dressingRepository.getDressingMaterials();
    materials.fold(
      (failure) => messengerController.showErrorSnackbar(failure.message),
      (dressingMaterials) => state = dressingMaterials,
    );
  }
}

final dressingMaterialsControllerProvider =
    StateNotifierProvider<DressingMaterialsController, List<DressingMaterial>?>(
  (ref) => DressingMaterialsController(
    ref.watch(dressingRepositoryProvider),
    ref.watch(messengerControllerProvider),
  ),
);
