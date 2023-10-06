import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/presentation/auth/login_screen_view_model.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginScreenViewModel model =
        ref.read(loginScreenViewModelProvider.notifier);

    final LoginScreenViewModelState modelState =
        ref.watch(loginScreenViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => model.updateUserName(value),
            ),
            const SizedBox(height: 16),
            if (modelState.userName != '')
              Text(
                'Username: ${modelState.userName}',
                style: const TextStyle(fontSize: 16),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => model.login(),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
