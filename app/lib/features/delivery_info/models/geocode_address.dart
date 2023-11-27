import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocode_address.freezed.dart';
part 'geocode_address.g.dart';

@freezed
class FeatureCollection with _$FeatureCollection {
  const factory FeatureCollection({
    required String type,
    required String version,
    required List<GeocodeAddress> features,
  }) = _FeatureCollection;

  factory FeatureCollection.fromJson(Map<String, dynamic> json) =>
      _$FeatureCollectionFromJson(json);
}

@freezed
abstract class GeocodeAddressGeometry with _$GeocodeAddressGeometry {
  const factory GeocodeAddressGeometry({
    required String type,
    required List<double> coordinates,
  }) = _GeocodeAddressGeometry;

  factory GeocodeAddressGeometry.fromJson(Map<String, dynamic> json) =>
      _$GeocodeAddressGeometryFromJson(json);
}

@freezed
abstract class GeocodeAddressProperties with _$GeocodeAddressProperties {
  const factory GeocodeAddressProperties({
    required String label,
    required double score,
    String? housenumber,
    required String id,
    required String type,
    String? name,
    String? postcode,
    String? citycode,
    required double x,
    required double y,
    String? city,
    String? context,
    required double importance,
    String? street,
  }) = _GeocodeAddressProperties;

  factory GeocodeAddressProperties.fromJson(Map<String, dynamic> json) =>
      _$GeocodeAddressPropertiesFromJson(json);
}

@freezed
abstract class GeocodeAddress with _$GeocodeAddress {
  const factory GeocodeAddress({
    required String type,
    required GeocodeAddressGeometry geometry,
    required GeocodeAddressProperties properties,
  }) = _GeocodeAddress;

  factory GeocodeAddress.fromJson(Map<String, dynamic> json) =>
      _$GeocodeAddressFromJson(json);
}
