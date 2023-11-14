import 'package:repasse_anou/features/auth/data/auth_repository.dart';
import 'package:repasse_anou/features/auth/data/user_repository.dart';
import 'package:repasse_anou/features/auth/models/user.dart';
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

  Future<bool> signUpWithEmailAndPassword({
    required String name,
    required String firstName,
    required String email,
    required String password,
  }) async {
    final AuthRepository authRepository = ref.read(authRepositoryProvider);
    final UserRepository userRepository = ref.read(userRepositoryProvider);

    state = const AsyncLoading();

    String? userId;

    state = await ref.guardAndNotifyOnError(
      () async {
        userId = await authRepository.signUpWithEmailAndPassword(
          EmailAddress(email),
          Password(password),
          firstName,
          name,
        );
      },
    );

    if (state.hasError && userId == null) {
      return false;
    }

    final user = User(
      id: userId!,
      email: EmailAddress(email),
      firstName: firstName,
      lastName: name,
    );
    state = const AsyncLoading();
    state = await ref.guardAndNotifyOnError(
      () => userRepository.addUser(user),
      successMessage: 'Compte créé avec succès',
    );

    return state.hasError == false;
  }

  // setters for auth_notifier_controller.dart
  void setLoading() {
    state = const AsyncLoading();
  }

  void setError(Object error) {
    state = AsyncError(error, StackTrace.current);
  }

  void setSuccess() {
    state = const AsyncData(null);
  }
}
