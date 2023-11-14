import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/utils/messenger_controller.dart';
import 'package:repasse_anou/features/auth/data/auth_repository.dart';
import 'package:repasse_anou/features/auth/models/user.dart';
import 'package:repasse_anou/failures/auth_failure.dart';

class UserController extends StateNotifier<User?> {
  UserController(this._authService, this._messengerController) : super(null);

  final AuthRepository _authService;
  final MessengerController _messengerController;

  User? get loggedUser => state;

  void updateUser(User user) {
    state = user;
  }

  void signOut() async {
    final signOutRequest = await _authService.signOut();

    signOutRequest.fold(
      (l) => _messengerController.showErrorSnackbar(l.message),
      (r) {},
    );
  }
}

final userControllerProvider = StateNotifierProvider<UserController, User?>(
  (ref) => UserController(
    ref.read(authRepositoryProvider),
    ref.read(messengerControllerProvider),
  ),
);
