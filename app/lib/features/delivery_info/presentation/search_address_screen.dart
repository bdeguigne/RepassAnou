import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/features/delivery_info/data/search_address_repository.dart';
import 'package:repasse_anou/features/delivery_info/data/user_address_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';

@RoutePage()
class SearchAddressScreen extends HookConsumerWidget {
  const SearchAddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<String> searchValue = useState('');
    final ValueNotifier<Timer?> debounce = useState(null);
    final ValueNotifier<bool> debounceLoading = useState(false);

    final AsyncValue<List<UserAddress>> userAddresses =
        ref.watch(userAddressesProvider);
    final searchAddress = ref.watch(searchAddressProvider(searchValue.value));

    void onSearchChanged(String value) {
      debounceLoading.value = true;
      if (debounce.value?.isActive ?? false) debounce.value!.cancel();
      debounce.value = Timer(const Duration(milliseconds: 500), () {
        searchValue.value = value;
        debounceLoading.value = false;
      });
    }

    return AppLayout.standard(
      appBar: AppAppBar.searchBar(
        searchHint: 'Saisissez votre adresse',
        onSearchFieldChanged: (value) => onSearchChanged(value ?? ''),
        isLoading: (searchAddress.isLoading || debounceLoading.value),
      ),
      scrollable: false,
      child: (searchAddress.isLoading || debounceLoading.value)
          ? Container()
          : userAddresses.when(
              data: (data) => Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: data
                      .map(
                        (userAddress) => Text(userAddress.address),
                      )
                      .toList(),
                ),
              ),
              error: (error, stackTrace) =>
                  const Text('Une erreur est survenue'),
              loading: () => const CircularProgressIndicator(),
            ),
    );
  }
}
