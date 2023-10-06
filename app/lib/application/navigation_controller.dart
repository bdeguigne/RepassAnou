import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/core/top_level_providers.dart';
import 'package:repasse_anou/presentation/routes/app_router.dart';

class NavigationController {
  NavigationController({required this.router});

  final AppRouter router;

  void goToHomePage() {
    router.replaceAll([
      const HomeRoute(),
    ]);
  }

  void goToLoginPage() {
    router.replaceAll([
      const LoginRoute(),
    ]);
  }

  Future<void> goBack() async {
    await router.pop();
  }

  void push(PageRouteInfo route) {
    router.push(route);
  }

  String currentRouteName() {
    return router.current.name;
  }
}

final Provider<NavigationController> navigationControllerProvider =
    Provider((ProviderRef<NavigationController> ref) {
  return NavigationController(router: ref.watch(routerProvider));
});
