import 'package:bot_toast/bot_toast.dart';
import './theme.dart' as theme;
import 'package:flutter/material.dart';

class AppSnackbars {
  static Widget Function(BuildContext, Widget?) init() {
    return BotToastInit();
  }

  static NavigatorObserver initObserver() {
    return BotToastNavigatorObserver();
  }

  static SnackBar _customSnackbar(
    Color backgroundColor,
    Widget icon,
    Text message,
  ) {
    return SnackBar(
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          icon,
          const SizedBox(
            width: 16,
          ),
          Flexible(child: message),
        ],
      ),
      padding: const EdgeInsets.all(16),
    );
  }

  static SnackBar success(String message) {
    return _customSnackbar(
      theme.success,
      const Icon(
        Icons.check,
        color: Colors.white,
      ),
      Text(message),
    );
  }

  static SnackBar error(String message) {
    return _customSnackbar(
      theme.error,
      const Icon(Icons.close),
      Text(message),
    );
  }
}
