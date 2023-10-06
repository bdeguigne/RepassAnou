import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/core/top_level_providers.dart';
import 'package:repasse_anou/presentation/design_system/snackbars.dart';

class MessengerController {
  MessengerController(this._scaffoldMessengerState) : super();

  final ScaffoldMessengerState? _scaffoldMessengerState;

  void showErrorSnackbar(String message) {
    _scaffoldMessengerState?.showSnackBar(
      AppSnackbars.error(message),
    );
  }

  void showSuccesssSnackbar(String message) {
    _scaffoldMessengerState?.showSnackBar(
      AppSnackbars.success(message),
    );
  }
}

final Provider<MessengerController> messengerControllerProvider =
    Provider<MessengerController>((ProviderRef<MessengerController> ref) {
  return MessengerController(
    ref.watch(scaffoldKeyProvider).currentState!,
  );
});
