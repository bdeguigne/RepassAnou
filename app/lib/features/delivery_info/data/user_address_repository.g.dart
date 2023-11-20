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
String _$selectedAddressOrGeolocationHash() =>
    r'62117a3d46c5a47c28f4af890f4df100b0e7c7f0';

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
