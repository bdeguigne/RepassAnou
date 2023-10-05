import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:runpasseo/application/navigation_controller.dart';
import 'package:runpasseo/presentation/auth/login_screen_view_model.dart';
import 'package:runpasseo/presentation/routes/app_router.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NavigationController navigationController =
        ref.watch(navigationControllerProvider);

    final LoginScreenViewModelState loginState =
        ref.watch(loginScreenViewModelProvider);
    final LoginScreenViewModel loginModel =
        ref.read(loginScreenViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to My App 🚀'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Boilerplate for Flutter with Riverpod and AutoRoute',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'This is a boilerplate for a Flutter app that uses Riverpod for state management and AutoRoute for navigation. It includes a basic theme and some example screens to get you started.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            if (loginState.loggedIn)
              Text(
                'Logged in as ${loginState.userName}',
                style: const TextStyle(fontSize: 16),
              ),
            ElevatedButton(
              onPressed: () {
                loginState.loggedIn
                    ? loginModel.logout()
                    : navigationController.push(const LoginRoute());
              },
              child: Text(loginState.loggedIn ? 'Logout' : 'Go to Login'),
            ),
            ElevatedButton(
              onPressed: () {
                navigationController.push(const SignupRoute());
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
