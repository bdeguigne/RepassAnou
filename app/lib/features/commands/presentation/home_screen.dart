import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/commands/application/command_item_controller.dart';
import 'package:repasse_anou/design_system/article_card.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/features/commands/models/command_item.dart';
import 'package:repasse_anou/features/delivery_info/application/get_user_address_service.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/features/delivery_info/presentation/command_detail_bottom_sheet.dart';
import 'package:repasse_anou/features/commands/presentation/home_screen_view_model.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late HomeScreenViewModel model =
      ref.read(homeScreenViewModelProvider.notifier);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<CommandItem> commandItems = ref.read(commandItemControllerProvider);

      if (commandItems.isEmpty) {
        model.fetchCommandItems();
      } else {
        model.updateIsLoading(false);
      }
    });
  }

  void showCommandDetailBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) => const CommandDetailBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomeScreenModelState modelState =
        ref.watch(homeScreenViewModelProvider);
    final List<CommandItem> commandItems =
        ref.watch(commandItemControllerProvider);
    final AsyncValue<UserAddress> userAddress =
        ref.watch(getUserAddressServiceProvider);

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
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Image.asset(
                      'assets/icons/bag.png',
                      width: 14,
                      height: 14,
                    ),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: -5,
                    top: -5,
                    child: ClipOval(
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            '7',
                            style: headlineLarge.copyWith(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: sp(7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        child: Row(
          children: [
            AppInkWell(
              transparent: true,
              onTap: () => showCommandDetailBottomSheet(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Votre adresse').bodyMedium,
                  userAddress.when(
                    data: (position) => Text(
                      position.street,
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
              onTap: () => showCommandDetailBottomSheet(),
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
        child: Column(
            children: modelState.isLoading
                ? [
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ArticleCard(
                          isLoading: modelState.isLoading,
                        ),
                      ),
                  ]
                : commandItems.map((commandItem) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ArticleCard(
                        isLoading: modelState.isLoading,
                        title: commandItem.title,
                        description: commandItem.description,
                        price: commandItem.price,
                        imageUrl: commandItem.imageUrl,
                      ),
                    );
                  }).toList()),
      ),
    );
  }
}
