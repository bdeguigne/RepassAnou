import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/design_system/theme.dart';

@RoutePage()
class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserController userController = ref.read(userControllerProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: const Text('Account').headlineMedium,
        ),
        ElevatedButton(
          onPressed: () => userController.signOut(),
          child: const Text('Se déconnecter'),
        ),
      ],
    );
  }
}
