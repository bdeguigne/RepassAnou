import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_checkbox.dart';
import 'package:repasse_anou/design_system/app_divider.dart';
import 'package:repasse_anou/design_system/app_images.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/auth/application/auth_service.dart';
import 'package:repasse_anou/routing/app_router.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';
import 'package:repasse_anou/utils/input_validator.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';
import 'package:repasse_anou/utils/value_objects.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final rememberMe = useState(false);
    final showValidationErrors = useState(false);
    final formKey = GlobalKey<FormState>();

    final authState = ref.watch(authServiceProvider);

    return AppCenteredLayout(
      child: Form(
        key: formKey,
        autovalidateMode: showValidationErrors.value
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            sh(11),
            AppImages.logo,
            sh(11),
            Text(
              'Bienvenue',
              style: headlineMedium.copyWith(
                fontSize: 32,
              ),
            ),
            sh(4),
            Padding(
              padding: pw(20),
              child: Column(
                children: [
                  Text(
                    'Pour continuer sur l’application RepassAnou connectez-vous 😉',
                    style: labelLarge.copyWith(
                      fontSize: 16,
                      color: const Color(0xFF666666),
                      overflow: TextOverflow.visible,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  sh(24),
                  AppTextField.outlined(
                    hint: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    controller: emailController,
                    validator: (value) =>
                        InputValidator.email(EmailAddress(value ?? '')),
                  ),
                  sh(10),
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
            sh(10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: pw(8),
                child: AppInkWell(
                  transparent: true,
                  onTap: () => rememberMe.value = !rememberMe.value,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppCheckbox(
                          value: rememberMe.value,
                          onChanged: (value) =>
                              rememberMe.value = value ?? false),
                      const Text('Se souvenir de moi').labelMedium,
                      const SizedBox(
                        width: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
            sh(20),
            Padding(
              padding: pw(20),
              child: SizedBox(
                width: double.infinity,
                height: 64,
                child: AppButton.primary(
                  text: 'Se connecter',
                  isLoading: authState.isLoading,
                  onPressed: () {
                    if (formKey.currentState?.validate() != true) {
                      showValidationErrors.value = true;
                      return;
                    }
                    ref
                        .read(authServiceProvider.notifier)
                        .signInWithEmailAndPassword(
                            emailController.text, passwordController.text);
                  },
                ),
              ),
            ),
            sh(24),
            Padding(
              padding: pw(20),
              child: const AppDivider(
                middleText: 'Ou continuer avec',
              ),
            ),
            sh(24),
            Padding(
              padding: pw(20),
              child: RowSpacing(
                spacing: 8,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48.h,
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
                      height: 48.h,
                      child: AppButton.outlinedIcon(
                        icon: SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: AppImages.facebook,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 48.h,
                      child: AppButton.outlinedIcon(
                        icon: SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: AppImages.apple,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sh(6),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                const Text(
                  "Vous n'avez pas de compte ?",
                  style: labelMedium,
                ),
                AppButton.text(
                  text: '👉 Inscrivez-vous',
                  onPressed: () {
                    ref
                        .read(navigationControllerProvider)
                        .push(const SignupRoute());
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
