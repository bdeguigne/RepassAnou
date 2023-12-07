import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quantity_state_controller.g.dart';

@Riverpod(keepAlive: true)
class QuantityStateController extends _$QuantityStateController {
  @override
  int build(String id) {
    return 0;
  }

  void increment() => state++;
  void decrement() {
    if (state > 0) state--;
  }
}
