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
String _$updateAddressDateHash() => r'7eae5b10f2b4fab55d82873f3eb91ec85049a847';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [updateAddressDate].
@ProviderFor(updateAddressDate)
const updateAddressDateProvider = UpdateAddressDateFamily();

/// See also [updateAddressDate].
class UpdateAddressDateFamily extends Family<AsyncValue<void>> {
  /// See also [updateAddressDate].
  const UpdateAddressDateFamily();

  /// See also [updateAddressDate].
  UpdateAddressDateProvider call(
    UserAddress selectedUserAddress,
  ) {
    return UpdateAddressDateProvider(
      selectedUserAddress,
    );
  }

  @visibleForOverriding
  @override
  UpdateAddressDateProvider getProviderOverride(
    covariant UpdateAddressDateProvider provider,
  ) {
    return call(
      provider.selectedUserAddress,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateAddressDateProvider';
}

/// See also [updateAddressDate].
class UpdateAddressDateProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateAddressDate].
  UpdateAddressDateProvider(
    UserAddress selectedUserAddress,
  ) : this._internal(
          (ref) => updateAddressDate(
            ref as UpdateAddressDateRef,
            selectedUserAddress,
          ),
          from: updateAddressDateProvider,
          name: r'updateAddressDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateAddressDateHash,
          dependencies: UpdateAddressDateFamily._dependencies,
          allTransitiveDependencies:
              UpdateAddressDateFamily._allTransitiveDependencies,
          selectedUserAddress: selectedUserAddress,
        );

  UpdateAddressDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.selectedUserAddress,
  }) : super.internal();

  final UserAddress selectedUserAddress;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateAddressDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateAddressDateProvider._internal(
        (ref) => create(ref as UpdateAddressDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        selectedUserAddress: selectedUserAddress,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateAddressDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateAddressDateProvider &&
        other.selectedUserAddress == selectedUserAddress;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, selectedUserAddress.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateAddressDateRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `selectedUserAddress` of this provider.
  UserAddress get selectedUserAddress;
}

class _UpdateAddressDateProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateAddressDateRef {
  _UpdateAddressDateProviderElement(super.provider);

  @override
  UserAddress get selectedUserAddress =>
      (origin as UpdateAddressDateProvider).selectedUserAddress;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
