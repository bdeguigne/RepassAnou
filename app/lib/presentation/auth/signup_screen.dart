import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:runpasseo/presentation/auth/signup_screen_view_model.dart';

@RoutePage()
class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignupScreenViewModel model =
        ref.read(signupScreenViewModelProvider.notifier);
    final SignupScreenViewModelState modelState =
        ref.watch(signupScreenViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un compte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: model.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) => model.updateEmail(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                onChanged: (value) => model.updateFirstName(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                onChanged: (value) => model.updateLastName(value),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                // onTap: _pickProfilePicture,
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: modelState.profilePicture != null
                      ? Image.file(modelState.profilePicture!,
                          fit: BoxFit.cover)
                      : const Icon(Icons.camera_alt, size: 64.0),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: model.submitForm,
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
