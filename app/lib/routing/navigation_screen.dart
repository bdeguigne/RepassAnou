import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/features/commands/presentation/home_screen.dart';
import 'package:repasse_anou/features/dressing/presentation/dressing_screen.dart';
import 'package:repasse_anou/features/account/presentation/account_screen.dart';
import 'package:repasse_anou/utils/drawer_controller.dart';

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

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    ref.read(drawerControllerProvider.notifier).setKey(_drawerKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drawerContent = ref.watch(drawerControllerProvider);

    return Scaffold(
      key: _drawerKey,
      endDrawer: Drawer(
        width: screenWidthPercent(context, 75),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: SafeArea(child: drawerContent),
      ),
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
              width: 24.w,
              height: 24.h,
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
