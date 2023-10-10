import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/controllers/messenger_controller.dart';
import 'package:repasse_anou/controllers/navigation_controller.dart';
import 'package:repasse_anou/data/auth_service.dart';
import 'package:repasse_anou/data/user_service.dart';
import 'package:repasse_anou/shared/failures/auth_failure.dart';
import 'package:repasse_anou/shared/models/user/user.dart';
import 'package:repasse_anou/shared/top_level_providers.dart';
import 'package:repasse_anou/shared/value_objects.dart';

class AuthController {
  AuthController(
    this._authService,
    this._messengerController,
    this._logger,
    this._userService,
    this._navigationController,
  );

  final AuthService _authService;
  final MessengerController _messengerController;
  final Logger _logger;
  final UserService _userService;
  final NavigationController _navigationController;

  Future<void> signUpWithEmailAndPassword(EmailAddress email, Password password,
      String firstName, String lastName) async {
    final signUpRequest = await _authService.signUpWithEmailAndPassword(
        email, password, firstName, lastName);

    signUpRequest.fold((failure) {
      _logger.e(failure.message);
      _messengerController.showErrorSnackbar(
          'Une erreur est survenue lors de la création de votre compte');
      _navigationController.goToLandingPage();
    }, (id) async {
      if (id != null) {
        final user = User(
          id: id,
          email: email,
          firstName: firstName,
          lastName: lastName,
        );
        final req = await _userService.addUser(user);

        return req.fold(
          (failure) {
            _logger.e(failure.message);
            _messengerController.showErrorSnackbar(
                'Une erreur est survenue lors de la création de votre compte');
            _navigationController.goToLandingPage();
          },
          (r) {
            _messengerController
                .showSuccesssSnackbar('Compte créé avec succès');
            _navigationController.goBack();

            // TODO Verifier si besoin d'update le user dans userController
          },
        );
      } else {
        _logger.e("Impossible de récupérer l'id de l'utilisateur");
        _messengerController.showErrorSnackbar(
            'Impossible de récupérer les données d\'authentification');
        _navigationController.goToLandingPage();
      }
    });
  }
}

final authControllerProvider = Provider<AuthController>(
  (ref) => AuthController(
    ref.read(authServiceProvider),
    ref.read(messengerControllerProvider),
    ref.read(loggerProvider),
    ref.read(userServiceProvider),
    ref.read(navigationControllerProvider),
  ),
);
