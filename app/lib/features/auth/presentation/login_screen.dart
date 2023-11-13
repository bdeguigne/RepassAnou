import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_checkbox.dart';
import 'package:repasse_anou/design_system/app_divider.dart';
import 'package:repasse_anou/design_system/app_images.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/auth/presentation/login_screen_view_model.dart';
import 'package:repasse_anou/routing/app_router.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';
import 'package:repasse_anou/utils/input_validator.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

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
      child: SingleChildScrollView(
        child: Form(
          key: model.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 11),
              AppImages.logo,
              const SizedBox(height: 11),
              Text(
                'Bienvenue',
                style: headlineMedium.copyWith(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    const SizedBox(height: 24),
                    AppTextField(
                      hint: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onChanged: (value) => model.updateEmail(value),
                      validator: (value) =>
                          InputValidator.email(modelState.email),
                    ),
                    const SizedBox(height: 10),
                    AppTextField(
                      hint: 'Mot-de-passe',
                      obscureText: true,
                      validator: (value) =>
                          InputValidator.password(modelState.password),
                      onChanged: (value) => model.updatePassword(value),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(
                  children: [
                    AppCheckbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text('Se souvenir de moi').labelMedium,
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 64,
                  child:
                      AppButton.primary(text: 'Se connecter', onPressed: () {}),
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
      ),
    );
  }
}
