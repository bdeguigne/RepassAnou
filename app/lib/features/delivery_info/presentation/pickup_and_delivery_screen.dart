import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/delivery_info/application/get_user_address_service.dart';
import 'package:repasse_anou/features/delivery_info/application/save_user_address_service.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/routing/app_router.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';
import 'package:repasse_anou/utils/input_validator.dart';

@RoutePage()
class PickupAndDeliveryScreen extends HookConsumerWidget {
  const PickupAndDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserAddress> userAddress =
        ref.watch(getUserAddressServiceProvider);
    final AsyncValue<void> saveUserAddressState =
        ref.watch(saveUserAddressServiceProvider);

    final TextEditingController addressInfoController =
        useTextEditingController();
    final TextEditingController companyNameController =
        useTextEditingController();
    final TextEditingController deliveryInstructionsController =
        useTextEditingController();
    final TextEditingController entitledController = useTextEditingController();
    final showValidationErrors = useState(false);

    final formKey = GlobalKey<FormState>();

    void onSave(UserAddress selectedUserAddress) async {
      if (!formKey.currentState!.validate()) {
        showValidationErrors.value = true;
        return;
      }

      final success = await ref
          .read(saveUserAddressServiceProvider.notifier)
          .saveUserAddress(
            selectedUserAddress: selectedUserAddress,
            addressInfo: addressInfoController.text,
            deliveryInstructions: deliveryInstructionsController.text,
            companyName: companyNameController.text,
            entitled: entitledController.text,
          );

      if (success == true && context.mounted) {
        ref.invalidate(getUserAddressServiceProvider);
      }
    }

    return userAddress.when(
      data: (position) {
        addressInfoController.text = position.addressInfo ?? '';
        companyNameController.text = position.companyName ?? '';
        deliveryInstructionsController.text =
            position.deliveryInstructions ?? '';
        entitledController.text = position.entitled;

        return AppLayout.withBottomButton(
          appBar: AppAppBar.title('Récupération & livraison'),
          padding: const EdgeInsets.all(20),
          bottomButton: AppButton.primary(
            expanded: true,
            text: 'Terminer',
            onPressed: () => onSave(position),
            isLoading: saveUserAddressState.isLoading,
          ),
          child: Form(
            key: formKey,
            autovalidateMode: showValidationErrors.value
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField.button(
                  value:
                      '${position.street} ${position.postalCode} ${position.city}',
                  hint: 'Veuillez saisir votre adresse',
                  errorMessage: showValidationErrors.value == true
                      ? 'Veuillez renseigner votre adresse'
                      : null,
                  onTap: () => ref.read(navigationControllerProvider).push(
                        const SearchAddressRoute(),
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Options',
                  style: bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextField.filled(
                  controller: addressInfoController,
                  hint: 'Appartement, bureau ou étage',
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextField.filled(
                  controller: companyNameController,
                  hint: "Nom de l'entreprise",
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextField.filled(
                  controller: deliveryInstructionsController,
                  hint: 'Instructions de livraison',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Enregistrer cette adresse',
                  style: bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextField.filled(
                  controller: entitledController,
                  hint: 'Intitulé (ex : Maison)',
                  validator: (value) => InputValidator.notEmpty(value),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => AppLayout.standard(
        child: const Text('Une erreur est survenue'),
      ),
      loading: () => AppLayout.standard(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
