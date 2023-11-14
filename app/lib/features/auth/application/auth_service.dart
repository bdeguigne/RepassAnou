import 'package:repasse_anou/features/auth/data/auth_repository.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:repasse_anou/utils/value_objects.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  FutureOr<void> build() {}

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    final AuthRepository authRepository = ref.read(authRepositoryProvider);

    state = const AsyncLoading();
    state = await ref.guardAndNotifyOnError(
      () => authRepository.signInWithEmailAndPassword(
        EmailAddress(email),
        Password(password),
      ),
    );

    return state.hasError == false;
  }
}
