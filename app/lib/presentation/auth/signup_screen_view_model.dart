// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repasse_anou/controllers/messenger_controller.dart';
import 'package:repasse_anou/controllers/navigation_controller.dart';
import 'package:repasse_anou/core/failures/auth_failure.dart';
import 'package:repasse_anou/core/value_objects.dart';
import 'package:repasse_anou/data/auth_service.dart';

class SignupScreenViewModelState {
  SignupScreenViewModelState({
    required this.email,
    required this.password,
    this.firstName = '',
    this.lastName = '',
    this.profilePicture,
    this.isLoading = false,
  });
  final EmailAddress email;
  final Password password;
  final String firstName;
  final String lastName;
  final File? profilePicture;
  final bool isLoading;

  SignupScreenViewModelState copyWith({
    EmailAddress? email,
    Password? password,
    String? firstName,
    String? lastName,
    File? profilePicture,
    bool? isLoading,
  }) {
    return SignupScreenViewModelState(
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePicture: profilePicture ?? this.profilePicture,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SignupScreenViewModel extends StateNotifier<SignupScreenViewModelState> {
  SignupScreenViewModel(
      this._navigationController, this._messengerController, this._authService)
      : super(SignupScreenViewModelState(
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

  void updateFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void updateLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void updateProfilePicture(File profilePicture) {
    state = state.copyWith(profilePicture: profilePicture);
  }

  void updateIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void submitForm() async {
    if (formKey.currentState?.validate() != null) {
      print('Form is valid');
      print('${state.email}');
      print('${state.firstName}');
      print('${state.lastName}');

      updateIsLoading(true);

      final signUpRequest = await _authService.signUpWithEmailAndPassword(
          state.email, state.password);

      signUpRequest.fold(
        (failure) => _messengerController.showErrorSnackbar(failure.message),
        (r) {
          _messengerController.showSuccesssSnackbar('Compte créé avec succès');

          _navigationController.goBack();
        },
      );
      updateIsLoading(false);

      //     _formKey.currentState?.save();
      //     // TODO: Implement sign up logic
    }
  }
}

final StateNotifierProvider<SignupScreenViewModel, SignupScreenViewModelState>
    signupScreenViewModelProvider =
    StateNotifierProvider<SignupScreenViewModel, SignupScreenViewModelState>(
  (ref) => SignupScreenViewModel(
    ref.read(navigationControllerProvider),
    ref.read(messengerControllerProvider),
    ref.read(authServiceProvider),
  ),
);
