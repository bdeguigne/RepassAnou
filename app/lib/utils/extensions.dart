import 'package:flutter/material.dart';
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

extension SpacingExtensionColum on Column {
  static Column withSpacing({
    Key? key,
    required List<Widget> children,
    int spacing = 10,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    var spacedChildren = children
        .expand((widget) => [widget, SizedBox(height: spacing.toDouble())])
        .toList();
    spacedChildren.removeLast(); // Remove the extra SizedBox

    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}

extension SpacingExtensionRow on Row {
  static Row withSpacing({
    Key? key,
    required List<Widget> children,
    int spacing = 10,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    var spacedChildren = children
        .expand((widget) => [widget, SizedBox(width: spacing.toDouble())])
        .toList();
    spacedChildren.removeLast(); // Remove the extra SizedBox

    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}
