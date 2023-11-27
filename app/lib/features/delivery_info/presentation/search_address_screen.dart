import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/features/delivery_info/application/get_user_address_service.dart';
import 'package:repasse_anou/features/delivery_info/data/search_address_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';

@RoutePage()
class SearchAddressScreen extends HookConsumerWidget {
  const SearchAddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<String> searchValue = useState('');
    final ValueNotifier<Timer?> debounce = useState(null);
    final ValueNotifier<bool> debounceLoading = useState(false);
    final ValueNotifier<UserAddress?> selectedAddress = useState(null);

    final TextEditingController searchController = useTextEditingController();

    // final AsyncValue<List<UserAddress>> userAddresses =
    //     ref.watch(userAddressesProvider);
    final searchAddress = ref.watch(searchAddressProvider(searchValue.value));

    void onSearchChanged(String value) {
      debounceLoading.value = true;
      if (debounce.value?.isActive ?? false) debounce.value!.cancel();
      debounce.value = Timer(const Duration(milliseconds: 500), () {
        searchValue.value = value;
        debounceLoading.value = false;
      });
    }

    return AppLayout.withBottomButton(
      appBar: AppAppBar.searchBar(
        searchHint: 'Saisissez votre adresse',
        onSearchFieldChanged: (value) => onSearchChanged(value ?? ''),
        isLoading: (searchAddress.isLoading || debounceLoading.value),
        controller: searchController,
      ),
      bottomButton: Padding(
        padding: const EdgeInsets.all(20),
        child: AppButton.primary(
          text: 'Valider',
          expanded: true,
          onPressed: selectedAddress.value != null
              ? () {
                  ref
                      .read(getUserAddressServiceProvider.notifier)
                      .updateAddress(selectedAddress.value!);
                  AutoRouter.of(context).pop();
                }
              : null,
        ),
      ),
      child: (searchAddress.isLoading || debounceLoading.value)
          ? Container()
          : searchAddress.valueOrNull == null
              ? Container()
              : Column(
                  children: searchAddress.valueOrNull!
                      .map(
                        (address) => ListTile(
                          title: Text(address.properties.label),
                          onTap: () {
                            searchController.text = address.properties.label;
                            selectedAddress.value = UserAddress.api(
                              street: address.properties.street ?? '',
                              postalCode: address.properties.postcode ?? '',
                              city: address.properties.city ?? '',
                              latitude: address.geometry.coordinates[1],
                              longitude: address.geometry.coordinates[0],
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
    );
  }
}
