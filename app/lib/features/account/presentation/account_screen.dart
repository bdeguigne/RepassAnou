import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/layouts.dart';

@RoutePage()
class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // UserController userController = ref.read(userControllerProvider.notifier);

    return AppLayout.standard(
      appBar: AppAppBar.title('Mon profil'),
      child: const Column(
        children: [],
      ),
    );
  }
}
