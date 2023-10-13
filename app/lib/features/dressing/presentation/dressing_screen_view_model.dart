// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repasse_anou/utils/messenger_controller.dart';
import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
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
    this._dressingService,
    this._messengerController,
  ) : super(DressingScreenState());

  final UserService _userService;
  final DressingRepository _dressingService;
  final MessengerController _messengerController;

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

  void getUsersDressings() async {
    updateIsLoading(true);
    final dressings = await _dressingService.getUsersDressings();

    dressings.fold(
      (failure) => _messengerController.showErrorSnackbar(failure.message),
      (dressings) {
        print('GET DRESSINGS $dressings');
        updateDressingItems(dressings);
      },
    );

    updateIsLoading(false);
  }
}

final dressingScreenViewModelProvider =
    StateNotifierProvider<DressingScreenViewModel, DressingScreenState>(
  (ref) => DressingScreenViewModel(
    ref.read(userServiceProvider),
    ref.read(dressingRepositoryProvider),
    ref.read(messengerControllerProvider),
  ),
);
