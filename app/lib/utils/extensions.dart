import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/utils/messenger_controller.dart';

extension AutoDisposeAsyncNotifierProviderRefX<T>
    on AutoDisposeAsyncNotifierProviderRef<T> {
  Future<AsyncValue<T>> guardAndNotifyOnError(Future<T> Function() future,
      {String? successMessage}) async {
    try {
      final data = AsyncValue.data(await future());

      if (successMessage != null) {
        read(messengerControllerProvider).showSuccesssSnackbar(successMessage);
      }

      return data;
    } catch (err, stack) {
      read(messengerControllerProvider).showErrorSnackbar(err.toString());
      return AsyncValue.error(err, stack);
    }
  }
}

extension FutureProviderRefX<T> on FutureProviderRef<T> {
  Future<T> notifyOnError(Future<T> Function() future) async {
    try {
      return await future();
    } catch (e) {
      read(messengerControllerProvider).showErrorSnackbar(e.toString());
      return future();
    }
  }
}
