import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:repasse_anou/features/auth/presentation/login_screen.dart';
import 'package:repasse_anou/features/auth/presentation/signup_screen.dart';
import 'package:repasse_anou/features/commands/presentation/home_screen.dart';
import 'package:repasse_anou/routing/navigation_screen.dart';
import 'package:repasse_anou/features/account/presentation/account_screen.dart';
import 'package:repasse_anou/features/dressing/presentation/dressing_screen.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
import 'package:repasse_anou/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:repasse_anou/features/dressing/presentation/dressing_detail_screen.dart';
import 'package:repasse_anou/features/delivery_info/presentation/pickup_and_delivery_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        // AutoRoute(page: LandingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(
          page: NavigationRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: DressingRoute.page,
            ),
            AutoRoute(
              page: AccountRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: DressingDetailRoute.page,
        ),
        AutoRoute(page: PickupAndDeliveryRoute.page),
      ];
}
