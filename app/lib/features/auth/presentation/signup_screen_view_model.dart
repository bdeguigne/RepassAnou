// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/features/auth/application/auth_controller.dart';
import 'package:repasse_anou/utils/value_objects.dart';

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
  SignupScreenViewModel(this._authController)
      : super(SignupScreenViewModelState(
          email: EmailAddress.empty(),
          password: Password.empty(),
        ));

  final AuthController _authController;

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

      await _authController.signUpWithEmailAndPassword(
          state.email, state.password, state.firstName, state.lastName);

      updateIsLoading(false);
    }
  }
}

final StateNotifierProvider<SignupScreenViewModel, SignupScreenViewModelState>
    signupScreenViewModelProvider =
    StateNotifierProvider<SignupScreenViewModel, SignupScreenViewModelState>(
  (ref) => SignupScreenViewModel(
    ref.read(authControllerProvider),
  ),
);
