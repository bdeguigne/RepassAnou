// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_state_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quantityStateControllerHash() =>
    r'03cf83492599255718027cf6d6f50bd9289d99bc';

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

abstract class _$QuantityStateController extends BuildlessNotifier<int> {
  late final String id;

  int build(
    String id,
  );
}

/// See also [QuantityStateController].
@ProviderFor(QuantityStateController)
const quantityStateControllerProvider = QuantityStateControllerFamily();

/// See also [QuantityStateController].
class QuantityStateControllerFamily extends Family<int> {
  /// See also [QuantityStateController].
  const QuantityStateControllerFamily();

  /// See also [QuantityStateController].
  QuantityStateControllerProvider call(
    String id,
  ) {
    return QuantityStateControllerProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  QuantityStateControllerProvider getProviderOverride(
    covariant QuantityStateControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'quantityStateControllerProvider';
}

/// See also [QuantityStateController].
class QuantityStateControllerProvider
    extends NotifierProviderImpl<QuantityStateController, int> {
  /// See also [QuantityStateController].
  QuantityStateControllerProvider(
    String id,
  ) : this._internal(
          () => QuantityStateController()..id = id,
          from: quantityStateControllerProvider,
          name: r'quantityStateControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quantityStateControllerHash,
          dependencies: QuantityStateControllerFamily._dependencies,
          allTransitiveDependencies:
              QuantityStateControllerFamily._allTransitiveDependencies,
          id: id,
        );

  QuantityStateControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  int runNotifierBuild(
    covariant QuantityStateController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(QuantityStateController Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuantityStateControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  NotifierProviderElement<QuantityStateController, int> createElement() {
    return _QuantityStateControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuantityStateControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuantityStateControllerRef on NotifierProviderRef<int> {
  /// The parameter `id` of this provider.
  String get id;
}

class _QuantityStateControllerProviderElement
    extends NotifierProviderElement<QuantityStateController, int>
    with QuantityStateControllerRef {
  _QuantityStateControllerProviderElement(super.provider);

  @override
  String get id => (origin as QuantityStateControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
