import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/controllers/user_controller.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserController userController = ref.read(userControllerProvider.notifier);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Home Screen',
              style: TextStyle(fontSize: 24),
            ),
          ),
          ElevatedButton(
            onPressed: () => userController.signOut(),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
