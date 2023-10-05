// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:runpasseo/application/messenger_controller.dart';
import 'package:runpasseo/application/navigation_controller.dart';

class SignupScreenViewModelState {
  SignupScreenViewModelState({
    this.email,
    this.firstName,
    this.lastName,
    this.profilePicture,
  });
  final String? email;
  final String? firstName;
  final String? lastName;
  final File? profilePicture;

  SignupScreenViewModelState copyWith({
    String? email,
    String? firstName,
    String? lastName,
    File? profilePicture,
  }) {
    return SignupScreenViewModelState(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}

class SignupScreenViewModel extends StateNotifier<SignupScreenViewModelState> {
  SignupScreenViewModel(this._navigationController, this._messengerController)
      : super(SignupScreenViewModelState());

  final NavigationController _navigationController;
  final MessengerController _messengerController;

  final formKey = GlobalKey<FormState>();

  void updateEmail(String email) {
    state = state.copyWith(email: email);
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

  submitForm() {
    if (formKey.currentState?.validate() != null) {
      print('Form is valid');
      print('${state.email}');
      print('${state.firstName}');
      print('${state.lastName}');

      //     _formKey.currentState?.save();
      //     // TODO: Implement sign up logic
    }
  }
}

final StateNotifierProvider<SignupScreenViewModel, SignupScreenViewModelState>
    signupScreenViewModelProvider =
    StateNotifierProvider<SignupScreenViewModel, SignupScreenViewModelState>(
  (StateNotifierProviderRef ref) => SignupScreenViewModel(
    ref.read(navigationControllerProvider),
    ref.read(messengerControllerProvider),
  ),
);
