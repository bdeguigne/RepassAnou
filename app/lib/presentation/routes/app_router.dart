import 'package:auto_route/auto_route.dart';
import 'package:repasse_anou/presentation/landing_screen.dart';
import 'package:repasse_anou/presentation/splash_screen.dart';
import 'package:repasse_anou/presentation/auth/login_screen.dart';
import 'package:repasse_anou/presentation/auth/signup_screen.dart';
import 'package:repasse_anou/presentation/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LandingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
