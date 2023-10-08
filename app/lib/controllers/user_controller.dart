import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/controllers/messenger_controller.dart';
import 'package:repasse_anou/shared/failures/auth_failure.dart';
import 'package:repasse_anou/shared/models/user/user.dart';
import 'package:repasse_anou/data/auth_service.dart';

class UserController extends StateNotifier<User?> {
  UserController(this._authService, this._messengerController) : super(null);

  final AuthService _authService;
  final MessengerController _messengerController;

  void updateUser(User user) {
    state = user;
  }

  void signOut() async {
    final signOutRequest = await _authService.signOut();

    signOutRequest.fold(
      (l) => _messengerController.showErrorSnackbar(l.message),
      (r) => _messengerController.showSuccesssSnackbar('Déconnecté'),
    );
  }
}

final userControllerProvider = StateNotifierProvider<UserController, User?>(
  (ref) => UserController(
    ref.read(authServiceProvider),
    ref.read(messengerControllerProvider),
  ),
);
