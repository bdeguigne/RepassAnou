import 'package:image_picker/image_picker.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'image_picker_service.g.dart';

@riverpod
class ImagePickerService extends _$ImagePickerService {
  @override
  FutureOr<XFile?> build() {
    return null;
  }

  Future<void> pickImageFromGallery() async {
    state = const AsyncLoading();

    final XFile? image = await ref
        .read(imagePickerProvider)
        .pickImage(source: ImageSource.gallery);

    if (image != null) {
      state = AsyncData(image);
    } else {
      state = AsyncError(
          'Une erreur est survenue lors de la sélection de l\'image',
          StackTrace.current);
    }
  }
}

// final takePhotoServiceProvider = Provider<TakePhotoService>((ref) {
//   return TakePhotoService(
//     ref.read(imagePickerProvider),
//   );
// });
