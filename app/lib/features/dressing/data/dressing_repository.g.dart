// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dressing_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dressingCategoriesHash() =>
    r'3dc14b39f6f1b82790b2d7d52bd6c9df1ef05a51';

/// See also [dressingCategories].
@ProviderFor(dressingCategories)
final dressingCategoriesProvider =
    AutoDisposeFutureProvider<List<DressingCategory>>.internal(
  dressingCategories,
  name: r'dressingCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dressingCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DressingCategoriesRef
    = AutoDisposeFutureProviderRef<List<DressingCategory>>;
String _$dressingColorsHash() => r'a726d9a715af0e26e8b1a5b44119b8f7726d735f';

/// See also [dressingColors].
@ProviderFor(dressingColors)
final dressingColorsProvider =
    AutoDisposeFutureProvider<List<DressingColor>>.internal(
  dressingColors,
  name: r'dressingColorsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dressingColorsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DressingColorsRef = AutoDisposeFutureProviderRef<List<DressingColor>>;
String _$dressingMaterialsHash() => r'cfda478924f274704874dbce4734c34214f4cf71';

/// See also [dressingMaterials].
@ProviderFor(dressingMaterials)
final dressingMaterialsProvider =
    AutoDisposeFutureProvider<List<DressingMaterial>>.internal(
  dressingMaterials,
  name: r'dressingMaterialsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dressingMaterialsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DressingMaterialsRef
    = AutoDisposeFutureProviderRef<List<DressingMaterial>>;
String _$usersDressingsByBelongsToHash() =>
    r'237dd7c971e5ce4c2f09d8fbb6bea9f92d78c42b';

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

/// See also [usersDressingsByBelongsTo].
@ProviderFor(usersDressingsByBelongsTo)
const usersDressingsByBelongsToProvider = UsersDressingsByBelongsToFamily();

/// See also [usersDressingsByBelongsTo].
class UsersDressingsByBelongsToFamily
    extends Family<AsyncValue<List<UserDressing>>> {
  /// See also [usersDressingsByBelongsTo].
  const UsersDressingsByBelongsToFamily();

  /// See also [usersDressingsByBelongsTo].
  UsersDressingsByBelongsToProvider call(
    UserDressingBelongsTo userDressingBelongsTo,
  ) {
    return UsersDressingsByBelongsToProvider(
      userDressingBelongsTo,
    );
  }

  @visibleForOverriding
  @override
  UsersDressingsByBelongsToProvider getProviderOverride(
    covariant UsersDressingsByBelongsToProvider provider,
  ) {
    return call(
      provider.userDressingBelongsTo,
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
  String? get name => r'usersDressingsByBelongsToProvider';
}

/// See also [usersDressingsByBelongsTo].
class UsersDressingsByBelongsToProvider
    extends FutureProvider<List<UserDressing>> {
  /// See also [usersDressingsByBelongsTo].
  UsersDressingsByBelongsToProvider(
    UserDressingBelongsTo userDressingBelongsTo,
  ) : this._internal(
          (ref) => usersDressingsByBelongsTo(
            ref as UsersDressingsByBelongsToRef,
            userDressingBelongsTo,
          ),
          from: usersDressingsByBelongsToProvider,
          name: r'usersDressingsByBelongsToProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$usersDressingsByBelongsToHash,
          dependencies: UsersDressingsByBelongsToFamily._dependencies,
          allTransitiveDependencies:
              UsersDressingsByBelongsToFamily._allTransitiveDependencies,
          userDressingBelongsTo: userDressingBelongsTo,
        );

  UsersDressingsByBelongsToProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userDressingBelongsTo,
  }) : super.internal();

  final UserDressingBelongsTo userDressingBelongsTo;

  @override
  Override overrideWith(
    FutureOr<List<UserDressing>> Function(UsersDressingsByBelongsToRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UsersDressingsByBelongsToProvider._internal(
        (ref) => create(ref as UsersDressingsByBelongsToRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userDressingBelongsTo: userDressingBelongsTo,
      ),
    );
  }

  @override
  FutureProviderElement<List<UserDressing>> createElement() {
    return _UsersDressingsByBelongsToProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UsersDressingsByBelongsToProvider &&
        other.userDressingBelongsTo == userDressingBelongsTo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userDressingBelongsTo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UsersDressingsByBelongsToRef on FutureProviderRef<List<UserDressing>> {
  /// The parameter `userDressingBelongsTo` of this provider.
  UserDressingBelongsTo get userDressingBelongsTo;
}

class _UsersDressingsByBelongsToProviderElement
    extends FutureProviderElement<List<UserDressing>>
    with UsersDressingsByBelongsToRef {
  _UsersDressingsByBelongsToProviderElement(super.provider);

  @override
  UserDressingBelongsTo get userDressingBelongsTo =>
      (origin as UsersDressingsByBelongsToProvider).userDressingBelongsTo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
