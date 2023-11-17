import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/features/commands/presentation/home_screen.dart';
import 'package:repasse_anou/features/delivery_info/application/geolocation_service.dart';
import 'package:repasse_anou/features/dressing/presentation/dressing_screen.dart';
import 'package:repasse_anou/features/account/presentation/account_screen.dart';

@RoutePage()
class NavigationScreen extends ConsumerStatefulWidget {
  const NavigationScreen({super.key});

  @override
  ConsumerState<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    const HomeScreen(),
    const DressingScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(geoLocationServiceProvider.notifier).getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (int newValue) {
          setState(() {
            pageIndex = newValue;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: AppIcons.dressingNotSelected,
            ),
            activeIcon: SizedBox(
                width: 24, height: 24, child: AppIcons.dressingSelected),
            label: 'Mon Dressing',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Mon compte',
          ),
        ],
      ),
    );
  }
}
