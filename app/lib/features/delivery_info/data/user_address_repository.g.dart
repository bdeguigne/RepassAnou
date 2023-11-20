// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userAddressesHash() => r'c3979cd85b9a51aff396e4b30785ada72fe16994';

/// See also [userAddresses].
@ProviderFor(userAddresses)
final userAddressesProvider =
    AutoDisposeFutureProvider<List<UserAddress>>.internal(
  userAddresses,
  name: r'userAddressesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userAddressesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserAddressesRef = AutoDisposeFutureProviderRef<List<UserAddress>>;
String _$selectedAddressHash() => r'86d249eb7551b2baf8df072b2b100ee28ea8877a';

/// See also [selectedAddress].
@ProviderFor(selectedAddress)
final selectedAddressProvider =
    AutoDisposeFutureProvider<UserAddress?>.internal(
  selectedAddress,
  name: r'selectedAddressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SelectedAddressRef = AutoDisposeFutureProviderRef<UserAddress?>;
String _$selectedAddressOrGeolocationHash() =>
    r'0c841c195671aa84b59f8b73d6c1090032984fbc';

/// See also [selectedAddressOrGeolocation].
@ProviderFor(selectedAddressOrGeolocation)
final selectedAddressOrGeolocationProvider =
    AutoDisposeFutureProvider<UserAddress>.internal(
  selectedAddressOrGeolocation,
  name: r'selectedAddressOrGeolocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedAddressOrGeolocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SelectedAddressOrGeolocationRef
    = AutoDisposeFutureProviderRef<UserAddress>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
