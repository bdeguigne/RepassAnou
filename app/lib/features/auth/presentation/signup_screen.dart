import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_divider.dart';
import 'package:repasse_anou/design_system/app_images.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/auth/application/auth_service.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';
import 'package:repasse_anou/utils/input_validator.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';
import 'package:repasse_anou/utils/value_objects.dart';

@RoutePage()
class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = useTextEditingController();
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final showValidationErrors = useState(false);

    final authState = ref.watch(authServiceProvider);

    final formKey = GlobalKey<FormState>();

    return AppCenteredLayout(
      child: Form(
        key: formKey,
        autovalidateMode: showValidationErrors.value
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 11),
            AppImages.logo,
            const SizedBox(height: 11),
            Text(
              'Inscription',
              style: headlineMedium.copyWith(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ColumnSpacing(
                spacing: 10,
                children: [
                  AppTextField.outlined(
                    hint: 'Prénom',
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    controller: firstNameController,
                    validator: (value) => InputValidator.notEmpty(value),
                  ),
                  AppTextField.outlined(
                    hint: 'Nom',
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    controller: nameController,
                    validator: (value) => InputValidator.notEmpty(value),
                  ),
                  AppTextField.outlined(
                    hint: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    controller: emailController,
                    validator: (value) => InputValidator.email(
                      EmailAddress(value ?? ''),
                    ),
                  ),
                  AppTextField.outlined(
                    hint: 'Mot-de-passe',
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) =>
                        InputValidator.password(Password(value ?? '')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 64,
                child: AppButton.primary(
                  text: "S'inscrire",
                  isLoading: authState.isLoading,
                  onPressed: () {
                    if (formKey.currentState?.validate() != true) {
                      showValidationErrors.value = true;
                      return;
                    }
                    ref
                        .read(authServiceProvider.notifier)
                        .signUpWithEmailAndPassword(
                          firstName: firstNameController.text,
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: AppDivider(
                middleText: 'Ou continuer avec',
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RowSpacing(
                spacing: 8,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: AppButton.outlinedIcon(
                        icon: SizedBox(
                          width: 24,
                          height: 24,
                          child: AppImages.google,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: AppButton.outlinedIcon(
                        icon: SizedBox(
                          width: 24,
                          height: 24,
                          child: AppImages.facebook,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: AppButton.outlinedIcon(
                        icon: SizedBox(
                          width: 24,
                          height: 24,
                          child: AppImages.apple,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                const Text(
                  'Vous avez déjà un compte ?',
                  style: labelMedium,
                ),
                AppButton.text(
                  text: '👉 Connectez-vous',
                  onPressed: () {
                    ref.read(navigationControllerProvider).goBack();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
