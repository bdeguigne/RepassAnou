import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_controller.g.dart';

@riverpod
class DrawerController extends _$DrawerController {
  @override
  Widget build() {
    return const Text('Default Drawer');
  }

  GlobalKey<ScaffoldState>? key;

  void setKey(GlobalKey<ScaffoldState> key) {
    this.key = key;
  }

  void showEndDrawer({required Widget Function() builder}) {
    state = builder();
    key?.currentState?.openEndDrawer();
  }
}
