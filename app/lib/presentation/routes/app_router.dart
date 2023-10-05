import 'package:auto_route/auto_route.dart';
import 'package:runpasseo/presentation/home_screen.dart';
import 'package:runpasseo/presentation/login_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
      ];
}
