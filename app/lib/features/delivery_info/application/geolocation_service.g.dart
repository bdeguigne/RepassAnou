// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geoLocationServiceHash() =>
    r'a604fb6db12d81eafb49f507997587f8fe9ef83b';

/// See also [GeoLocationService].
@ProviderFor(GeoLocationService)
final geoLocationServiceProvider =
    AutoDisposeAsyncNotifierProvider<GeoLocationService, Position?>.internal(
  GeoLocationService.new,
  name: r'geoLocationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$geoLocationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GeoLocationService = AutoDisposeAsyncNotifier<Position?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
