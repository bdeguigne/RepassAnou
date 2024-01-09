// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_storage_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$readImageHash() => r'267fa4dbf5f4d7d543961735d0ae201a0f7c24ad';

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

/// See also [readImage].
@ProviderFor(readImage)
const readImageProvider = ReadImageFamily();

/// See also [readImage].
class ReadImageFamily extends Family {
  /// See also [readImage].
  const ReadImageFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'readImageProvider';

  /// See also [readImage].
  ReadImageProvider call(
    String path,
  ) {
    return ReadImageProvider(
      path,
    );
  }

  @visibleForOverriding
  @override
  ReadImageProvider getProviderOverride(
    covariant ReadImageProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<Uint8List> Function(ReadImageRef ref) create) {
    return _$ReadImageFamilyOverride(this, create);
  }
}

class _$ReadImageFamilyOverride implements FamilyOverride {
  _$ReadImageFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Uint8List> Function(ReadImageRef ref) create;

  @override
  final ReadImageFamily overriddenFamily;

  @override
  ReadImageProvider getProviderOverride(
    covariant ReadImageProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [readImage].
class ReadImageProvider extends FutureProvider<Uint8List> {
  /// See also [readImage].
  ReadImageProvider(
    String path,
  ) : this._internal(
          (ref) => readImage(
            ref as ReadImageRef,
            path,
          ),
          from: readImageProvider,
          name: r'readImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$readImageHash,
          dependencies: ReadImageFamily._dependencies,
          allTransitiveDependencies: ReadImageFamily._allTransitiveDependencies,
          path: path,
        );

  ReadImageProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  Override overrideWith(
    FutureOr<Uint8List> Function(ReadImageRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReadImageProvider._internal(
        (ref) => create(ref as ReadImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  (String,) get argument {
    return (path,);
  }

  @override
  FutureProviderElement<Uint8List> createElement() {
    return _ReadImageProviderElement(this);
  }

  ReadImageProvider _copyWith(
    FutureOr<Uint8List> Function(ReadImageRef ref) create,
  ) {
    return ReadImageProvider._internal(
      (ref) => create(ref as ReadImageRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      path: path,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReadImageProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReadImageRef on FutureProviderRef<Uint8List> {
  /// The parameter `path` of this provider.
  String get path;
}

class _ReadImageProviderElement extends FutureProviderElement<Uint8List>
    with ReadImageRef {
  _ReadImageProviderElement(super.provider);

  @override
  String get path => (origin as ReadImageProvider).path;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
