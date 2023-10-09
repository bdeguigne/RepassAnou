// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/controllers/command_item_controller.dart';

class HomeScreenModelState {
  HomeScreenModelState({
    this.isLoading = true,
  });

  final bool isLoading;

  HomeScreenModelState copyWith({
    bool? isLoading,
  }) {
    return HomeScreenModelState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class HomeScreenViewModel extends StateNotifier<HomeScreenModelState> {
  HomeScreenViewModel(
    this._commandItemController,
  ) : super(HomeScreenModelState());

  final CommandItemController _commandItemController;

  void updateIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void fetchCommandItems() async {
    updateIsLoading(true);
    await _commandItemController.fetchCommandItems();
    updateIsLoading(false);
  }
}

final homeScreenViewModelProvider =
    StateNotifierProvider<HomeScreenViewModel, HomeScreenModelState>(
  (ref) => HomeScreenViewModel(
    ref.read(commandItemControllerProvider.notifier),
  ),
);
