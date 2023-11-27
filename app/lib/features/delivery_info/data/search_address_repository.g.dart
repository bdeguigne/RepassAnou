// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_address_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchAddressHash() => r'646faecff08519ef8e5218ea18f3212f63105beb';

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

/// See also [searchAddress].
@ProviderFor(searchAddress)
const searchAddressProvider = SearchAddressFamily();

/// See also [searchAddress].
class SearchAddressFamily extends Family<AsyncValue<List<GeocodeAddress>?>> {
  /// See also [searchAddress].
  const SearchAddressFamily();

  /// See also [searchAddress].
  SearchAddressProvider call(
    String address,
  ) {
    return SearchAddressProvider(
      address,
    );
  }

  @visibleForOverriding
  @override
  SearchAddressProvider getProviderOverride(
    covariant SearchAddressProvider provider,
  ) {
    return call(
      provider.address,
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
  String? get name => r'searchAddressProvider';
}

/// See also [searchAddress].
class SearchAddressProvider
    extends AutoDisposeFutureProvider<List<GeocodeAddress>?> {
  /// See also [searchAddress].
  SearchAddressProvider(
    String address,
  ) : this._internal(
          (ref) => searchAddress(
            ref as SearchAddressRef,
            address,
          ),
          from: searchAddressProvider,
          name: r'searchAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchAddressHash,
          dependencies: SearchAddressFamily._dependencies,
          allTransitiveDependencies:
              SearchAddressFamily._allTransitiveDependencies,
          address: address,
        );

  SearchAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
  }) : super.internal();

  final String address;

  @override
  Override overrideWith(
    FutureOr<List<GeocodeAddress>?> Function(SearchAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchAddressProvider._internal(
        (ref) => create(ref as SearchAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GeocodeAddress>?> createElement() {
    return _SearchAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchAddressProvider && other.address == address;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchAddressRef on AutoDisposeFutureProviderRef<List<GeocodeAddress>?> {
  /// The parameter `address` of this provider.
  String get address;
}

class _SearchAddressProviderElement
    extends AutoDisposeFutureProviderElement<List<GeocodeAddress>?>
    with SearchAddressRef {
  _SearchAddressProviderElement(super.provider);

  @override
  String get address => (origin as SearchAddressProvider).address;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
