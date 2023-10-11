import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/data/user_service.dart';

class DressingScreenState {
  DressingScreenState({
    this.notShowMessage = false,
  });

  final bool notShowMessage;

  DressingScreenState copyWith({
    bool? notShowMessage,
  }) {
    return DressingScreenState(
      notShowMessage: notShowMessage ?? this.notShowMessage,
    );
  }
}

class DressingScreenViewModel extends StateNotifier<DressingScreenState> {
  DressingScreenViewModel(
    this._userService,
  ) : super(DressingScreenState());

  final UserService _userService;

  void updateNotShowMessage(bool notShowMessage) {
    state = state.copyWith(notShowMessage: notShowMessage);
  }

  void hasReadDressingMessage() async {
    if (state.notShowMessage == true) {
      await _userService.setDressingMessageReadForUser();
    }
  }
}

final dressingScreenViewModelProvider =
    StateNotifierProvider<DressingScreenViewModel, DressingScreenState>(
  (ref) => DressingScreenViewModel(
    ref.read(userServiceProvider),
  ),
);
