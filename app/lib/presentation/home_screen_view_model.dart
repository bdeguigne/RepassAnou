// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreenModelState {
  HomeScreenModelState({
    this.toggleLoading = true,
  });

  final bool toggleLoading;

  HomeScreenModelState copyWith({
    bool? toggleLoading,
  }) {
    return HomeScreenModelState(
      toggleLoading: toggleLoading ?? this.toggleLoading,
    );
  }
}

class HomeScreenViewModel extends StateNotifier<HomeScreenModelState> {
  HomeScreenViewModel() : super(HomeScreenModelState());

  void toggleLoading() {
    state = state.copyWith(toggleLoading: !state.toggleLoading);
  }
}

final homeScreenViewModelProvider =
    StateNotifierProvider<HomeScreenViewModel, HomeScreenModelState>(
  (ref) => HomeScreenViewModel(),
);
