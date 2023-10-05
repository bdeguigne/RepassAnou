import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:runpasseo/application/messenger_controller.dart';
import 'package:runpasseo/application/navigation_controller.dart';

class LoginScreenViewModelState {
  LoginScreenViewModelState({
    this.userName = '',
    this.loggedIn = false,
  });
  final String userName;
  final bool loggedIn;

  LoginScreenViewModelState copyWith({
    String? userName,
    bool? loggedIn,
  }) {
    return LoginScreenViewModelState(
      userName: userName ?? this.userName,
      loggedIn: loggedIn ?? this.loggedIn,
    );
  }
}

class LoginScreenViewModel extends StateNotifier<LoginScreenViewModelState> {
  LoginScreenViewModel(this._navigationController, this._messengerController)
      : super(LoginScreenViewModelState());

  final NavigationController _navigationController;
  final MessengerController _messengerController;

  void updateUserName(String userName) {
    state = state.copyWith(userName: userName);
  }

  void login() {
    state = state.copyWith(loggedIn: true);
    _messengerController.showSuccesssSnackbar('Welcome ${state.userName}');
    _navigationController.goBack();
  }

  void logout() {
    state = state.copyWith(loggedIn: false, userName: '');
  }
}

final StateNotifierProvider<LoginScreenViewModel, LoginScreenViewModelState>
    loginScreenViewModelProvider =
    StateNotifierProvider<LoginScreenViewModel, LoginScreenViewModelState>(
  (StateNotifierProviderRef ref) => LoginScreenViewModel(
    ref.read(navigationControllerProvider),
    ref.read(messengerControllerProvider),
  ),
);
