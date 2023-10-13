import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/utils/messenger_controller.dart';
import 'package:repasse_anou/features/dressing/data/dressing_service.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';

class DressingMaterialsController
    extends StateNotifier<List<DressingMaterial>?> {
  DressingMaterialsController(this.dressingService, this.messengerController)
      : super(null) {
    getDressingMaterials();
  }

  final DressingService dressingService;
  final MessengerController messengerController;

  Future<void> getDressingMaterials() async {
    final materials = await dressingService.getDressingMaterials();
    materials.fold(
      (failure) => messengerController.showErrorSnackbar(failure.message),
      (dressingMaterials) => state = dressingMaterials,
    );
  }
}

final dressingMaterialsControllerProvider =
    StateNotifierProvider<DressingMaterialsController, List<DressingMaterial>?>(
  (ref) => DressingMaterialsController(
    ref.watch(dressingServiceProvider),
    ref.watch(messengerControllerProvider),
  ),
);
