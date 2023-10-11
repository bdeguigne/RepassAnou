import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/controllers/messenger_controller.dart';
import 'package:repasse_anou/data/dressing_service.dart';
import 'package:repasse_anou/shared/models/dressing_material/dressing_material.dart';

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
