import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/delivery_info/application/user_address_service.dart';
import 'package:repasse_anou/features/delivery_info/data/geolocation_repository.dart';
import 'package:repasse_anou/features/delivery_info/data/user_address_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/routing/app_router.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';
import 'package:repasse_anou/utils/input_validator.dart';

@RoutePage()
class PickupAndDeliveryScreen extends HookConsumerWidget {
  const PickupAndDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<String?> currentLocation =
        ref.watch(currentAddressProvider);
    final AsyncValue<void> saveUserAddressState =
        ref.watch(userAddressServiceProvider);
    final AsyncValue<UserAddress?> selectedAddress =
        ref.watch(selectedAddressProvider);

    final ValueNotifier<String?> address = useState(null);
    final TextEditingController addressInfoController =
        useTextEditingController();
    final TextEditingController companyNameController =
        useTextEditingController();
    final TextEditingController deliveryInstructionsController =
        useTextEditingController();
    final TextEditingController entitledController = useTextEditingController();
    final showValidationErrors = useState(false);

    final formKey = GlobalKey<FormState>();

    void onSave() {
      if (!formKey.currentState!.validate() || address.value == null) {
        showValidationErrors.value = true;
        return;
      }

      final String? addressInfo = addressInfoController.text.isEmpty
          ? null
          : addressInfoController.text;
      final String? deliveryInstructions =
          deliveryInstructionsController.text.isEmpty
              ? null
              : deliveryInstructionsController.text;
      final String? companyName = companyNameController.text.isEmpty
          ? null
          : companyNameController.text;

      ref.read(userAddressServiceProvider.notifier).saveUserAddress(
            address.value!,
            addressInfo,
            deliveryInstructions,
            companyName,
            entitledController.text,
          );
    }

    return AppLayout(
      title: 'Récupération & livraison',
      child: selectedAddress.when(
        data: (storedAddress) {
          if (storedAddress != null) {
            addressInfoController.text = storedAddress.addressInfo ?? '';
            companyNameController.text = storedAddress.companyName ?? '';
            deliveryInstructionsController.text =
                storedAddress.deliveryInstructions ?? '';
            entitledController.text = storedAddress.entitled;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              autovalidateMode: showValidationErrors.value
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField.button(
                    value: storedAddress != null
                        ? storedAddress.address
                        : currentLocation.when(
                            data: (data) {
                              address.value = data;
                              return data ??
                                  'Veuillez renseigner votre adresse';
                            },
                            error: (error, stackTrace) =>
                                'Veuillez renseigner votre adresse',
                            loading: () => 'Chargement...',
                          ),
                    hint: 'Veuillez saisir votre adresse',
                    errorMessage: showValidationErrors.value == true &&
                            address.value == null
                        ? 'Veuillez renseigner votre adresse'
                        : null,
                    onTap: () => ref.read(navigationControllerProvider).push(
                          const SearchAddressRoute(),
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Options').bodyMedium,
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
                  const Text('Enregistrer cette adresse').bodyMedium,
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField.filled(
                    controller: entitledController,
                    hint: 'Intitulé (ex : Maison)',
                    validator: (value) => InputValidator.notEmpty(value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton.primary(
                    text: 'Terminer',
                    onPressed: onSave,
                    expanded: true,
                    isLoading: saveUserAddressState.isLoading,
                  )
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => const Text('Une erreur est survenue'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
