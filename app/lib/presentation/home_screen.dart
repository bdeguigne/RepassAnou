import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/controllers/command_item_controller.dart';
import 'package:repasse_anou/presentation/design_system/article_card.dart';
import 'package:repasse_anou/presentation/design_system/layouts.dart';
import 'package:repasse_anou/presentation/home_screen_view_model.dart';
import 'package:repasse_anou/shared/models/command_item/command_item.dart';

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

  @override
  Widget build(BuildContext context) {
    final HomeScreenModelState modelState =
        ref.watch(homeScreenViewModelProvider);
    final List<CommandItem> commandItems =
        ref.watch(commandItemControllerProvider);

    return AppLayout(
      customAppBar: const LoggedAppBar(),
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
