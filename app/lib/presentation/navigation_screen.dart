import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repasse_anou/presentation/account_screen.dart';
import 'package:repasse_anou/presentation/dressing_screen.dart';
import 'package:repasse_anou/presentation/home_screen.dart';

@RoutePage()
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    const HomeScreen(),
    const DressingScreen(),
    const AccountScreen(),
  ];

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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Mon Dressing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Mon compte',
          ),
        ],
      ),
    );
  }
}
