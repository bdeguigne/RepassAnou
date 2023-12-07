import 'package:repasse_anou/features/commands/models/command_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_service.g.dart';

@Riverpod(keepAlive: true)
class CartService extends _$CartService {
  @override
  List<CommandItem> build() {
    return [];
  }

  void addToCart(CommandItem item) {
    state = List.from(state..add(item));
  }

  void removeFromCart(CommandItem item) {
    state = List.from(state..remove(item));
  }
}
