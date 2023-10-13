import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/utils/messenger_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_dressing_modal_controller.g.dart';

@riverpod
class AddDressingModalController extends _$AddDressingModalController {
  @override
  FutureOr<void> build() {}

  void saveDressingItem(
    String title,
    DressingCategory selectedCategory,
    DressingMaterial selectedMaterial,
    DressingColor selectedColor,
    String belongsTo,
    String notes,
  ) async {
    final DressingRepository dressingService =
        ref.read(dressingRepositoryProvider);
    state = const AsyncLoading();

    final saveDressingRequest = await dressingService.saveDressingItem(
        title, selectedCategory, selectedMaterial, selectedColor, null, notes);

    saveDressingRequest.fold(
      (failure) {
        ref
            .read(messengerControllerProvider)
            .showErrorSnackbar(failure.message);
        state = AsyncError(failure, StackTrace.current);
      },
      (value) {
        ref.read(messengerControllerProvider).showSuccesssSnackbar('OK');
        return state = AsyncData(value);
      },
    );
  }
}
