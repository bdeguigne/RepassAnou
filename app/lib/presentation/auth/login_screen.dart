import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/presentation/design_system/layouts.dart';
import 'package:repasse_anou/shared/utils/input_validator.dart';
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

    return AppLayout(
      title: 'Login',
      child: Form(
        key: model.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onChanged: (value) => model.updateEmail(value),
                validator: (value) => InputValidator.email(modelState.email),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) =>
                    InputValidator.password(modelState.password),
                onChanged: (value) => model.updatePassword(value),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => model.login(),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
