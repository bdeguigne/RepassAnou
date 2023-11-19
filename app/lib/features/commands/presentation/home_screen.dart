import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/commands/application/command_item_controller.dart';
import 'package:repasse_anou/design_system/article_card.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/features/commands/models/command_item.dart';
import 'package:repasse_anou/features/delivery_info/presentation/command_detail_bottom_sheet.dart';
import 'package:repasse_anou/features/commands/presentation/home_screen_view_model.dart';
import 'package:repasse_anou/features/delivery_info/data/geolocation_repository.dart';

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
    final AsyncValue<String?> currentLocation =
        ref.watch(currentAddressProvider);

    return AppLayout(
      customAppBar: LoggedAppBar(
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
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/icons/bag.png',
                  width: 14,
                  height: 14,
                ),
                onPressed: () {},
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
                  currentLocation.when(
                    data: (position) => Text(
                      position ?? 'Veuillez renseigner votre adresse',
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
      child: SingleChildScrollView(
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
      ),
    );
  }
}
