// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatScreen(),
      );
    },
    DressingDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DressingDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DressingDetailScreen(
          key: args.key,
          userDressing: args.userDressing,
          image: args.image,
        ),
      );
    },
    DressingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DressingScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    NavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavigationScreen(),
      );
    },
    PickupAndDeliveryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PickupAndDeliveryScreen(),
      );
    },
    PlanificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlanificationScreen(),
      );
    },
    SearchAddressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchAddressScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DressingDetailScreen]
class DressingDetailRoute extends PageRouteInfo<DressingDetailRouteArgs> {
  DressingDetailRoute({
    Key? key,
    required UserDressing userDressing,
    required Uint8List image,
    List<PageRouteInfo>? children,
  }) : super(
          DressingDetailRoute.name,
          args: DressingDetailRouteArgs(
            key: key,
            userDressing: userDressing,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'DressingDetailRoute';

  static const PageInfo<DressingDetailRouteArgs> page =
      PageInfo<DressingDetailRouteArgs>(name);
}

class DressingDetailRouteArgs {
  const DressingDetailRouteArgs({
    this.key,
    required this.userDressing,
    required this.image,
  });

  final Key? key;

  final UserDressing userDressing;

  final Uint8List image;

  @override
  String toString() {
    return 'DressingDetailRouteArgs{key: $key, userDressing: $userDressing, image: $image}';
  }
}

/// generated route for
/// [DressingScreen]
class DressingRoute extends PageRouteInfo<void> {
  const DressingRoute({List<PageRouteInfo>? children})
      : super(
          DressingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DressingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NavigationScreen]
class NavigationRoute extends PageRouteInfo<void> {
  const NavigationRoute({List<PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PickupAndDeliveryScreen]
class PickupAndDeliveryRoute extends PageRouteInfo<void> {
  const PickupAndDeliveryRoute({List<PageRouteInfo>? children})
      : super(
          PickupAndDeliveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickupAndDeliveryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlanificationScreen]
class PlanificationRoute extends PageRouteInfo<void> {
  const PlanificationRoute({List<PageRouteInfo>? children})
      : super(
          PlanificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlanificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchAddressScreen]
class SearchAddressRoute extends PageRouteInfo<void> {
  const SearchAddressRoute({List<PageRouteInfo>? children})
      : super(
          SearchAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchAddressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
