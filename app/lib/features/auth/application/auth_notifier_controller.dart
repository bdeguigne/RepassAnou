import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/features/auth/application/auth_service.dart';
import 'package:repasse_anou/utils/messenger_controller.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/auth/data/auth_repository.dart';
import 'package:repasse_anou/features/auth/models/user.dart';
import 'package:repasse_anou/failures/auth_failure.dart';
import 'package:repasse_anou/features/auth/models/auth.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;
import 'package:logger/logger.dart';

class AuthNotifierController extends StateNotifier<Auth> {
  AuthNotifierController(
    this.navigationController,
    this.supabase,
    this.logger,
    this.authRepository,
  ) : super(const Auth.unauthenticated());

  final NavigationController navigationController;
  final Logger logger;
  final s.SupabaseClient supabase;
  final AuthRepository authRepository;

  StreamSubscription<s.AuthState>? _authStateChanges;

  void listen(ProviderContainer ref) {
    handleSession(supabase.auth.currentSession, ref);
    _authStateChanges = supabase.auth.onAuthStateChange.listen((event) {
      handleSession(event.session, ref);
    });
  }

  void handleSession(s.Session? session, ProviderContainer ref) {
    if (session == null || session.isExpired == true) {
      state = const Auth.unauthenticated();
    } else {
      state = const Auth.authenticated();
    }
    redirect(ref);
  }

  void redirect(ProviderContainer ref) async {
    switch (state.maybeWhen(
        authenticated: () => 'authenticated',
        orElse: () => 'unauthenticated')) {
      case 'authenticated':
        logger.i("L'utilisateur est connecté");
        ref.read(authServiceProvider.notifier).setLoading();
        final Either<AuthFailure, User> userRequest =
            await authRepository.getAppUser();
        final MessengerController messengerController =
            ref.read(messengerControllerProvider);
        final UserController userController =
            ref.read(userControllerProvider.notifier);
        userRequest.fold(
          (AuthFailure failure) {
            logger.e(
                "Impossible de récupérer les infos de l'utilisateur connecté : ${failure.message}");
            ref.read(authServiceProvider.notifier).setError(failure.message);
            messengerController.showErrorSnackbar(failure.message);
            navigationController.goToLandingPage();
          },
          (User user) async {
            logger.i("Récupération des données de l'utilisateur : $user");
            ref.read(authServiceProvider.notifier).setSuccess();
            // ref.read(geoLocationServiceProvider.notifier).getCurrentLocation();
            userController.updateUser(user);
            navigationController.goToHomePage();
          },
        );
        break;
      case 'unauthenticated':
        logger.i("L'utilisateur est déconnecté");
        navigationController.goToLandingPage();
        break;
    }
  }

  @override
  void dispose() {
    _authStateChanges?.cancel();
    super.dispose();
  }
}

final StateNotifierProvider<AuthNotifierController, Auth>
    authNotifierControllerProvider =
    StateNotifierProvider<AuthNotifierController, Auth>(
        (StateNotifierProviderRef<AuthNotifierController, Auth> ref) {
  return AuthNotifierController(
    ref.read(navigationControllerProvider),
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
    ref.read(authRepositoryProvider),
  );
});
