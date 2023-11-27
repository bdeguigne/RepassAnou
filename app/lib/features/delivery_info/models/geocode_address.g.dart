// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureCollectionImpl _$$FeatureCollectionImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureCollectionImpl(
      type: json['type'] as String,
      version: json['version'] as String,
      features: (json['features'] as List<dynamic>)
          .map((e) => GeocodeAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FeatureCollectionImplToJson(
        _$FeatureCollectionImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'version': instance.version,
      'features': instance.features,
    };

_$GeocodeAddressGeometryImpl _$$GeocodeAddressGeometryImplFromJson(
        Map<String, dynamic> json) =>
    _$GeocodeAddressGeometryImpl(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$GeocodeAddressGeometryImplToJson(
        _$GeocodeAddressGeometryImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_$GeocodeAddressPropertiesImpl _$$GeocodeAddressPropertiesImplFromJson(
        Map<String, dynamic> json) =>
    _$GeocodeAddressPropertiesImpl(
      label: json['label'] as String,
      score: (json['score'] as num).toDouble(),
      housenumber: json['housenumber'] as String?,
      id: json['id'] as String,
      type: json['type'] as String,
      name: json['name'] as String?,
      postcode: json['postcode'] as String?,
      citycode: json['citycode'] as String?,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      city: json['city'] as String?,
      context: json['context'] as String?,
      importance: (json['importance'] as num).toDouble(),
      street: json['street'] as String?,
    );

Map<String, dynamic> _$$GeocodeAddressPropertiesImplToJson(
        _$GeocodeAddressPropertiesImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'score': instance.score,
      'housenumber': instance.housenumber,
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'postcode': instance.postcode,
      'citycode': instance.citycode,
      'x': instance.x,
      'y': instance.y,
      'city': instance.city,
      'context': instance.context,
      'importance': instance.importance,
      'street': instance.street,
    };

_$GeocodeAddressImpl _$$GeocodeAddressImplFromJson(Map<String, dynamic> json) =>
    _$GeocodeAddressImpl(
      type: json['type'] as String,
      geometry: GeocodeAddressGeometry.fromJson(
          json['geometry'] as Map<String, dynamic>),
      properties: GeocodeAddressProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeocodeAddressImplToJson(
        _$GeocodeAddressImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'geometry': instance.geometry,
      'properties': instance.properties,
    };
