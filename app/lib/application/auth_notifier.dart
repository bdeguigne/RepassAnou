import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/application/navigation_controller.dart';
import 'package:repasse_anou/core/models/auth/auth.dart';
import 'package:repasse_anou/core/top_level_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logger/logger.dart';

class AuthNotifier extends StateNotifier<Auth> {
  AuthNotifier(
    this.navigationController,
    this.supabase,
    this.logger,
  ) : super(const Auth.unauthenticated());

  final NavigationController navigationController;
  final Logger logger;
  final SupabaseClient supabase;

  void listen() {
    handleSession(supabase.auth.currentSession);
    supabase.auth.onAuthStateChange.listen((event) {
      handleSession(event.session);
    });
  }

  void handleSession(Session? session) {
    if (session == null) {
      state = const Auth.unauthenticated();
    } else {
      state = const Auth.authenticated();
    }
    redirect();
  }

  void redirect() async {
    switch (state.maybeWhen(
        authenticated: () => 'authenticated',
        orElse: () => 'unauthenticated')) {
      case 'authenticated':
        logger.i("L'utilisateur est connecté");
        navigationController.goToHomePage();
        // final Either<AuthFailure, User> userRequest =
        //     await authService.getAppUser();
        // userRequest.fold(
        //   (AuthFailure failure) {
        //     logger.e(
        //         "Impossible de récupérer les infos de l'utilisateur connecté : ${failure.message}");
        //     // messengerController.showErrorSnackbar(failure.message);
        //     navigationController.goToLandingPage();
        //   },
        //   (User user) async {
        //     logger.i("Récupération des données de l'utilisateur : $user");
        //     _userController.updateUser(user);

        //     if (user.activity == null) {
        //       final Either<ProfileFailure, User> setActivityRequest =
        //           await _profileService.setActivityToUser(
        //         const Activity(type: ActivityType.transaction),
        //       );

        //       setActivityRequest.fold(
        //         (ProfileFailure failure) {},
        //         (User user) {
        //           _userController.updateUser(user);
        //           navigationController.goToProfileInfosPage();
        //         },
        //       );
        //       // navigationController.goToActivityPage();
        //     } else if (user.profileCompleted == true &&
        //         user.numberVerified == true &&
        //         navigationController.currentRouteName() == LoadingRoute.name) {
        //       navigationController.goToHomePage();
        //     } else if (user.profileCompleted == false) {
        //       navigationController.goToProfileInfosPage();
        //     } else if (user.numberVerified == false) {
        //       navigationController.goToAddPhoneNumberPage();
        //     }
        //   },
        // );
        break;
      case 'unauthenticated':
        logger.i("L'utilisateur est déconnecté");
        navigationController.goToLandingPage();
        break;
    }
  }
}

final StateNotifierProvider<AuthNotifier, Auth> authNotifierProvider =
    StateNotifierProvider<AuthNotifier, Auth>(
        (StateNotifierProviderRef<AuthNotifier, Auth> ref) {
  return AuthNotifier(
    ref.read(navigationControllerProvider),
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
  );
});
