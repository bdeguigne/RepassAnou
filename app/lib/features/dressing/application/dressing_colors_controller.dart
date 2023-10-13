import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/utils/messenger_controller.dart';
import 'package:repasse_anou/features/dressing/data/dressing_service.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';

class DressingColorsController extends StateNotifier<List<DressingColor>?> {
  DressingColorsController(this.dressingService, this.messengerController)
      : super(null) {
    getDressingColors();
  }

  final DressingService dressingService;
  final MessengerController messengerController;

  Future<void> getDressingColors() async {
    final colors = await dressingService.getDressingColors();
    colors.fold(
      (failure) => messengerController.showErrorSnackbar(failure.message),
      (dressingColors) => state = dressingColors,
    );
  }
}

final dressingColorsControllerProvider =
    StateNotifierProvider<DressingColorsController, List<DressingColor>?>(
  (ref) => DressingColorsController(
    ref.watch(dressingServiceProvider),
    ref.watch(messengerControllerProvider),
  ),
);
