import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/cart_icon.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/design_system/article_card.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/features/cart/application/cart_service.dart';
import 'package:repasse_anou/features/commands/data/command_item_repository.dart';
import 'package:repasse_anou/features/commands/models/command_item.dart';
import 'package:repasse_anou/features/delivery_info/application/get_user_address_service.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/features/delivery_info/presentation/command_detail_bottom_sheet.dart';
import 'package:repasse_anou/routing/app_router.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void showCommandDetailBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) => const CommandDetailBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<CommandItem>> commandItems =
        ref.watch(commandItemsProvider);
    final AsyncValue<UserAddress> userAddress =
        ref.watch(getUserAddressServiceProvider);

    final List<CommandItem> cartItems = ref.watch(cartServiceProvider);

    return AppLayout.standard(
      appBar: LoggedAppBar(
        actions: [
          Container(
            width: 30,
            height: 30,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0x21000000),
                  blurRadius: 17,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: CartIcon(
              cartQuentity: cartItems.length,
              onTap: () => ref.read(navigationControllerProvider).push(
                    const CartRoute(),
                  ),
            ),
          ),
        ],
        child: Row(
          children: [
            AppInkWell(
              transparent: true,
              onTap: () => showCommandDetailBottomSheet(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Votre adresse').bodyMedium,
                  userAddress.when(
                    data: (position) => Text(
                      position.entitled.isNotEmpty
                          ? position.entitled
                          : position.label,
                      style: bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    loading: () => Text(
                      'Chargement...',
                      style: bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    error: (error, stackTrace) => Text(
                      'Veuillez renseigner votre adresse',
                      style: bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppInkWell(
              transparent: true,
              onTap: () => showCommandDetailBottomSheet(context),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: commandItems.when(
          data: (commandItems) => Column(
            children: commandItems.map((commandItem) {
              return Padding(
                padding: ph(5),
                child: ArticleCard(
                  isLoading: false,
                  title: commandItem.title,
                  description: commandItem.description,
                  price: commandItem.price,
                  imageUrl: commandItem.imageUrl,
                  onAddQuentity: () {
                    ref
                        .read(cartServiceProvider.notifier)
                        .addToCart(commandItem);
                  },
                  onRemoveQuentity: () => ref
                      .read(cartServiceProvider.notifier)
                      .removeFromCart(commandItem),
                ),
              );
            }).toList(),
          ),
          error: (error, stackTrace) =>
              const Text('Une erreur est survenue').bodyMedium,
          loading: () => Column(
            children: List.generate(
              3,
              (index) => Padding(
                padding: ph(5),
                child: const ArticleCard(isLoading: true),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
