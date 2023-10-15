import 'dart:io';
import 'dart:typed_data';

import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_storage_repository.g.dart';

class ImageStorageRepository {
  ImageStorageRepository(this.ref);

  final ProviderRef<ImageStorageRepository> ref;

  Future<String> uploadImage(File file) async {
    try {
      final loggedUser = ref.watch(userControllerProvider);

      if (loggedUser == null) {
        throw const ExceptionMessage(
            'Une erreur est survenue lors de l\'upload de l\'image');
      }

      final String path = '${loggedUser.id}/${ref.read(uuidProvider).v4()}.jpg';

      final response = await ref
          .read(supabaseClientProvider)
          .storage
          .dressingImagesBucket
          .uploadBinary(path, file.readAsBytesSync());
      ref.read(loggerProvider).i('uploadImage response: $response');
      return path;
    } catch (e) {
      ref.read(loggerProvider).e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de l\'upload de l\'image');
    }
  }

  Future<Uint8List> readImageFromStorage(String path) async {
    try {
      final response = await ref
          .read(supabaseClientProvider)
          .storage
          .dressingImagesBucket
          .download(path);
      return response;
    } catch (e) {
      ref.read(loggerProvider).e(e);
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération de l\'image');
    }
  }
}

@Riverpod(keepAlive: true)
Future<Uint8List> readImage(ReadImageRef ref, String path) async {
  final imageStorageRepository = ref.watch(imageStorageRepositoryProvider);
  return ref
      .notifyOnError(() => imageStorageRepository.readImageFromStorage(path));
}

final imageStorageRepositoryProvider = Provider<ImageStorageRepository>((ref) {
  return ImageStorageRepository(
    ref,
  );
});
