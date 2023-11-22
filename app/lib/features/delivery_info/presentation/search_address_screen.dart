import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/features/delivery_info/data/user_address_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';

@RoutePage()
class SearchAddressScreen extends ConsumerWidget {
  const SearchAddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<UserAddress>> userAddresses =
        ref.watch(userAddressesProvider);

    return AppLayout.standard(
      appBar: AppAppBar.searchBar(
        searchHint: 'Saisissez votre adresse',
        onSearchFieldChanged: (value) => print(value),
      ),
      scrollable: false,
      child: userAddresses.when(
        data: (data) => ListView(
          children: data
              .map(
                (userAddress) => Text(userAddress.address),
              )
              .toList(),
        ),
        error: (error, stackTrace) => const Text('Une erreur est survenue'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
