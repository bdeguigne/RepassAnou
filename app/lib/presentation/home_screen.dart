import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/controllers/user_controller.dart';
import 'package:repasse_anou/presentation/home_screen_view_model.dart';
import 'package:repasse_anou/presentation/widgets/article_card.dart';
import 'package:repasse_anou/presentation/widgets/layouts.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserController userController = ref.read(userControllerProvider.notifier);
    HomeScreenViewModel model = ref.read(homeScreenViewModelProvider.notifier);
    HomeScreenModelState modelState = ref.watch(homeScreenViewModelProvider);

    return AppLayout(
      customAppBar: const LoggedAppBar(),
      fabContent: modelState.toggleLoading
          ? const Icon(Icons.hourglass_full)
          : const Icon(Icons.hourglass_bottom),
      onFabPressed: () {
        model.toggleLoading();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            ArticleCard(
              title: 'Pack linge 5kg',
              description: 'Lavage et repassage de votre ligne du quotidien',
              price: '50.00',
              isLoading: modelState.toggleLoading,
            ),
            const SizedBox(
              height: 12,
            ),
            ArticleCard(
              title: 'Pack 5 chemises',
              description: 'Lavage et repassage de vos chemises sur cintre',
              price: '28.00',
              isLoading: modelState.toggleLoading,
            ),
            const SizedBox(
              height: 12,
            ),
            ArticleCard(
              title: 'Linge délicat',
              description: 'Lavage à la main et repassage de pièce délicate',
              price: '8.00',
              isLoading: modelState.toggleLoading,
            ),
            // ElevatedButton(
            //   onPressed: () => userController.signOut(),
            //   child: const Text('Sign Out'),
            // ),
          ],
        ),
      ),
    );
  }
}
