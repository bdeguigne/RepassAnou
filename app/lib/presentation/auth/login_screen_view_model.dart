// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repasse_anou/controllers/messenger_controller.dart';
import 'package:repasse_anou/controllers/navigation_controller.dart';
import 'package:repasse_anou/shared/failures/auth_failure.dart';
import 'package:repasse_anou/shared/value_objects.dart';
import 'package:repasse_anou/data/auth_service.dart';

class LoginScreenViewModelState {
  LoginScreenViewModelState({
    required this.email,
    required this.password,
    this.loggedIn = false,
  });
  final EmailAddress email;
  final Password password;
  final bool loggedIn;

  LoginScreenViewModelState copyWith({
    EmailAddress? email,
    Password? password,
    bool? loggedIn,
  }) {
    return LoginScreenViewModelState(
      email: email ?? this.email,
      password: password ?? this.password,
      loggedIn: loggedIn ?? this.loggedIn,
    );
  }
}

class LoginScreenViewModel extends StateNotifier<LoginScreenViewModelState> {
  LoginScreenViewModel(
      this._navigationController, this._messengerController, this._authService)
      : super(LoginScreenViewModelState(
          email: EmailAddress.empty(),
          password: Password.empty(),
        ));

  final NavigationController _navigationController;
  final MessengerController _messengerController;
  final AuthService _authService;

  final formKey = GlobalKey<FormState>();

  void updateEmail(String email) {
    state = state.copyWith(email: EmailAddress(email));
  }

  void updatePassword(String password) {
    state = state.copyWith(password: Password(password));
  }

  void login() async {
    if (formKey.currentState?.validate() != null) {
      final signInRequest = await _authService.signInWithEmailAndPassword(
          state.email, state.password);

      signInRequest.fold(
        (failure) => _messengerController.showErrorSnackbar(failure.message),
        (r) {
          _messengerController.showSuccesssSnackbar('Connecté !');
          _navigationController.goBack();
        },
      );
    }
  }

  void logout() {
    state = state.copyWith(
      loggedIn: false,
      email: EmailAddress.empty(),
      password: Password.empty(),
    );
  }
}

final StateNotifierProvider<LoginScreenViewModel, LoginScreenViewModelState>
    loginScreenViewModelProvider =
    StateNotifierProvider<LoginScreenViewModel, LoginScreenViewModelState>(
  (ref) => LoginScreenViewModel(
    ref.read(navigationControllerProvider),
    ref.read(messengerControllerProvider),
    ref.read(authServiceProvider),
  ),
);
