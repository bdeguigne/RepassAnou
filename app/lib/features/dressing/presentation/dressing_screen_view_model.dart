// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repasse_anou/features/auth/data/user_service.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';

class DressingScreenState {
  DressingScreenState({
    this.notShowMessage = false,
    this.dressingItems = const [],
    this.isLoading = false,
  });

  final bool notShowMessage;
  final List<UserDressing> dressingItems;
  final bool isLoading;

  DressingScreenState copyWith({
    bool? notShowMessage,
    List<UserDressing>? dressingItems,
    bool? isLoading,
  }) {
    return DressingScreenState(
      notShowMessage: notShowMessage ?? this.notShowMessage,
      dressingItems: dressingItems ?? this.dressingItems,
      isLoading: isLoading ?? this.isLoading,
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

  void updateDressingItems(List<UserDressing> dressingItems) {
    state = state.copyWith(dressingItems: dressingItems);
  }

  void updateIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void hasReadDressingMessage() async {
    if (state.notShowMessage == true) {
      await _userService.setDressingMessageReadForUser();
    }
  }

  // void getUsersDressings() async {
  //   updateIsLoading(true);
  //   final dressings = await _dressingService.getUsersDressings();

  //   dressings.fold(
  //     (failure) => _messengerController.showErrorSnackbar(failure.message),
  //     (dressings) {
  //       updateDressingItems(dressings);
  //     },
  //   );

  //   updateIsLoading(false);
  // }
}

final dressingScreenViewModelProvider =
    StateNotifierProvider<DressingScreenViewModel, DressingScreenState>(
  (ref) => DressingScreenViewModel(
    ref.read(userServiceProvider),
  ),
);
