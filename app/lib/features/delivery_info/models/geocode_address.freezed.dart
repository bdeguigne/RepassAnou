// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocode_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeatureCollection _$FeatureCollectionFromJson(Map<String, dynamic> json) {
  return _FeatureCollection.fromJson(json);
}

/// @nodoc
mixin _$FeatureCollection {
  String get type => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  List<GeocodeAddress> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureCollectionCopyWith<FeatureCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureCollectionCopyWith<$Res> {
  factory $FeatureCollectionCopyWith(
          FeatureCollection value, $Res Function(FeatureCollection) then) =
      _$FeatureCollectionCopyWithImpl<$Res, FeatureCollection>;
  @useResult
  $Res call({String type, String version, List<GeocodeAddress> features});
}

/// @nodoc
class _$FeatureCollectionCopyWithImpl<$Res, $Val extends FeatureCollection>
    implements $FeatureCollectionCopyWith<$Res> {
  _$FeatureCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? version = null,
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<GeocodeAddress>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureCollectionImplCopyWith<$Res>
    implements $FeatureCollectionCopyWith<$Res> {
  factory _$$FeatureCollectionImplCopyWith(_$FeatureCollectionImpl value,
          $Res Function(_$FeatureCollectionImpl) then) =
      __$$FeatureCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String version, List<GeocodeAddress> features});
}

/// @nodoc
class __$$FeatureCollectionImplCopyWithImpl<$Res>
    extends _$FeatureCollectionCopyWithImpl<$Res, _$FeatureCollectionImpl>
    implements _$$FeatureCollectionImplCopyWith<$Res> {
  __$$FeatureCollectionImplCopyWithImpl(_$FeatureCollectionImpl _value,
      $Res Function(_$FeatureCollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? version = null,
    Object? features = null,
  }) {
    return _then(_$FeatureCollectionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<GeocodeAddress>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureCollectionImpl
    with DiagnosticableTreeMixin
    implements _FeatureCollection {
  const _$FeatureCollectionImpl(
      {required this.type,
      required this.version,
      required final List<GeocodeAddress> features})
      : _features = features;

  factory _$FeatureCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureCollectionImplFromJson(json);

  @override
  final String type;
  @override
  final String version;
  final List<GeocodeAddress> _features;
  @override
  List<GeocodeAddress> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeatureCollection(type: $type, version: $version, features: $features)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeatureCollection'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('features', features));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureCollectionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, version,
      const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureCollectionImplCopyWith<_$FeatureCollectionImpl> get copyWith =>
      __$$FeatureCollectionImplCopyWithImpl<_$FeatureCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureCollectionImplToJson(
      this,
    );
  }
}

abstract class _FeatureCollection implements FeatureCollection {
  const factory _FeatureCollection(
      {required final String type,
      required final String version,
      required final List<GeocodeAddress> features}) = _$FeatureCollectionImpl;

  factory _FeatureCollection.fromJson(Map<String, dynamic> json) =
      _$FeatureCollectionImpl.fromJson;

  @override
  String get type;
  @override
  String get version;
  @override
  List<GeocodeAddress> get features;
  @override
  @JsonKey(ignore: true)
  _$$FeatureCollectionImplCopyWith<_$FeatureCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeocodeAddressGeometry _$GeocodeAddressGeometryFromJson(
    Map<String, dynamic> json) {
  return _GeocodeAddressGeometry.fromJson(json);
}

/// @nodoc
mixin _$GeocodeAddressGeometry {
  String get type => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodeAddressGeometryCopyWith<GeocodeAddressGeometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodeAddressGeometryCopyWith<$Res> {
  factory $GeocodeAddressGeometryCopyWith(GeocodeAddressGeometry value,
          $Res Function(GeocodeAddressGeometry) then) =
      _$GeocodeAddressGeometryCopyWithImpl<$Res, GeocodeAddressGeometry>;
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class _$GeocodeAddressGeometryCopyWithImpl<$Res,
        $Val extends GeocodeAddressGeometry>
    implements $GeocodeAddressGeometryCopyWith<$Res> {
  _$GeocodeAddressGeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeocodeAddressGeometryImplCopyWith<$Res>
    implements $GeocodeAddressGeometryCopyWith<$Res> {
  factory _$$GeocodeAddressGeometryImplCopyWith(
          _$GeocodeAddressGeometryImpl value,
          $Res Function(_$GeocodeAddressGeometryImpl) then) =
      __$$GeocodeAddressGeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class __$$GeocodeAddressGeometryImplCopyWithImpl<$Res>
    extends _$GeocodeAddressGeometryCopyWithImpl<$Res,
        _$GeocodeAddressGeometryImpl>
    implements _$$GeocodeAddressGeometryImplCopyWith<$Res> {
  __$$GeocodeAddressGeometryImplCopyWithImpl(
      _$GeocodeAddressGeometryImpl _value,
      $Res Function(_$GeocodeAddressGeometryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_$GeocodeAddressGeometryImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodeAddressGeometryImpl
    with DiagnosticableTreeMixin
    implements _GeocodeAddressGeometry {
  const _$GeocodeAddressGeometryImpl(
      {required this.type, required final List<double> coordinates})
      : _coordinates = coordinates;

  factory _$GeocodeAddressGeometryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodeAddressGeometryImplFromJson(json);

  @override
  final String type;
  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeocodeAddressGeometry(type: $type, coordinates: $coordinates)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeocodeAddressGeometry'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('coordinates', coordinates));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodeAddressGeometryImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodeAddressGeometryImplCopyWith<_$GeocodeAddressGeometryImpl>
      get copyWith => __$$GeocodeAddressGeometryImplCopyWithImpl<
          _$GeocodeAddressGeometryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodeAddressGeometryImplToJson(
      this,
    );
  }
}

abstract class _GeocodeAddressGeometry implements GeocodeAddressGeometry {
  const factory _GeocodeAddressGeometry(
      {required final String type,
      required final List<double> coordinates}) = _$GeocodeAddressGeometryImpl;

  factory _GeocodeAddressGeometry.fromJson(Map<String, dynamic> json) =
      _$GeocodeAddressGeometryImpl.fromJson;

  @override
  String get type;
  @override
  List<double> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$GeocodeAddressGeometryImplCopyWith<_$GeocodeAddressGeometryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GeocodeAddressProperties _$GeocodeAddressPropertiesFromJson(
    Map<String, dynamic> json) {
  return _GeocodeAddressProperties.fromJson(json);
}

/// @nodoc
mixin _$GeocodeAddressProperties {
  String get label => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String? get housenumber => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  String? get citycode => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get context => throw _privateConstructorUsedError;
  double get importance => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodeAddressPropertiesCopyWith<GeocodeAddressProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodeAddressPropertiesCopyWith<$Res> {
  factory $GeocodeAddressPropertiesCopyWith(GeocodeAddressProperties value,
          $Res Function(GeocodeAddressProperties) then) =
      _$GeocodeAddressPropertiesCopyWithImpl<$Res, GeocodeAddressProperties>;
  @useResult
  $Res call(
      {String label,
      double score,
      String? housenumber,
      String id,
      String type,
      String? name,
      String? postcode,
      String? citycode,
      double x,
      double y,
      String? city,
      String? context,
      double importance,
      String? street});
}

/// @nodoc
class _$GeocodeAddressPropertiesCopyWithImpl<$Res,
        $Val extends GeocodeAddressProperties>
    implements $GeocodeAddressPropertiesCopyWith<$Res> {
  _$GeocodeAddressPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? score = null,
    Object? housenumber = freezed,
    Object? id = null,
    Object? type = null,
    Object? name = freezed,
    Object? postcode = freezed,
    Object? citycode = freezed,
    Object? x = null,
    Object? y = null,
    Object? city = freezed,
    Object? context = freezed,
    Object? importance = null,
    Object? street = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      housenumber: freezed == housenumber
          ? _value.housenumber
          : housenumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      citycode: freezed == citycode
          ? _value.citycode
          : citycode // ignore: cast_nullable_to_non_nullable
              as String?,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeocodeAddressPropertiesImplCopyWith<$Res>
    implements $GeocodeAddressPropertiesCopyWith<$Res> {
  factory _$$GeocodeAddressPropertiesImplCopyWith(
          _$GeocodeAddressPropertiesImpl value,
          $Res Function(_$GeocodeAddressPropertiesImpl) then) =
      __$$GeocodeAddressPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      double score,
      String? housenumber,
      String id,
      String type,
      String? name,
      String? postcode,
      String? citycode,
      double x,
      double y,
      String? city,
      String? context,
      double importance,
      String? street});
}

/// @nodoc
class __$$GeocodeAddressPropertiesImplCopyWithImpl<$Res>
    extends _$GeocodeAddressPropertiesCopyWithImpl<$Res,
        _$GeocodeAddressPropertiesImpl>
    implements _$$GeocodeAddressPropertiesImplCopyWith<$Res> {
  __$$GeocodeAddressPropertiesImplCopyWithImpl(
      _$GeocodeAddressPropertiesImpl _value,
      $Res Function(_$GeocodeAddressPropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? score = null,
    Object? housenumber = freezed,
    Object? id = null,
    Object? type = null,
    Object? name = freezed,
    Object? postcode = freezed,
    Object? citycode = freezed,
    Object? x = null,
    Object? y = null,
    Object? city = freezed,
    Object? context = freezed,
    Object? importance = null,
    Object? street = freezed,
  }) {
    return _then(_$GeocodeAddressPropertiesImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      housenumber: freezed == housenumber
          ? _value.housenumber
          : housenumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      citycode: freezed == citycode
          ? _value.citycode
          : citycode // ignore: cast_nullable_to_non_nullable
              as String?,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodeAddressPropertiesImpl
    with DiagnosticableTreeMixin
    implements _GeocodeAddressProperties {
  const _$GeocodeAddressPropertiesImpl(
      {required this.label,
      required this.score,
      this.housenumber,
      required this.id,
      required this.type,
      this.name,
      this.postcode,
      this.citycode,
      required this.x,
      required this.y,
      this.city,
      this.context,
      required this.importance,
      this.street});

  factory _$GeocodeAddressPropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodeAddressPropertiesImplFromJson(json);

  @override
  final String label;
  @override
  final double score;
  @override
  final String? housenumber;
  @override
  final String id;
  @override
  final String type;
  @override
  final String? name;
  @override
  final String? postcode;
  @override
  final String? citycode;
  @override
  final double x;
  @override
  final double y;
  @override
  final String? city;
  @override
  final String? context;
  @override
  final double importance;
  @override
  final String? street;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeocodeAddressProperties(label: $label, score: $score, housenumber: $housenumber, id: $id, type: $type, name: $name, postcode: $postcode, citycode: $citycode, x: $x, y: $y, city: $city, context: $context, importance: $importance, street: $street)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeocodeAddressProperties'))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('housenumber', housenumber))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('postcode', postcode))
      ..add(DiagnosticsProperty('citycode', citycode))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('y', y))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('importance', importance))
      ..add(DiagnosticsProperty('street', street));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodeAddressPropertiesImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.housenumber, housenumber) ||
                other.housenumber == housenumber) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.citycode, citycode) ||
                other.citycode == citycode) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.street, street) || other.street == street));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, score, housenumber, id,
      type, name, postcode, citycode, x, y, city, context, importance, street);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodeAddressPropertiesImplCopyWith<_$GeocodeAddressPropertiesImpl>
      get copyWith => __$$GeocodeAddressPropertiesImplCopyWithImpl<
          _$GeocodeAddressPropertiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodeAddressPropertiesImplToJson(
      this,
    );
  }
}

abstract class _GeocodeAddressProperties implements GeocodeAddressProperties {
  const factory _GeocodeAddressProperties(
      {required final String label,
      required final double score,
      final String? housenumber,
      required final String id,
      required final String type,
      final String? name,
      final String? postcode,
      final String? citycode,
      required final double x,
      required final double y,
      final String? city,
      final String? context,
      required final double importance,
      final String? street}) = _$GeocodeAddressPropertiesImpl;

  factory _GeocodeAddressProperties.fromJson(Map<String, dynamic> json) =
      _$GeocodeAddressPropertiesImpl.fromJson;

  @override
  String get label;
  @override
  double get score;
  @override
  String? get housenumber;
  @override
  String get id;
  @override
  String get type;
  @override
  String? get name;
  @override
  String? get postcode;
  @override
  String? get citycode;
  @override
  double get x;
  @override
  double get y;
  @override
  String? get city;
  @override
  String? get context;
  @override
  double get importance;
  @override
  String? get street;
  @override
  @JsonKey(ignore: true)
  _$$GeocodeAddressPropertiesImplCopyWith<_$GeocodeAddressPropertiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GeocodeAddress _$GeocodeAddressFromJson(Map<String, dynamic> json) {
  return _GeocodeAddress.fromJson(json);
}

/// @nodoc
mixin _$GeocodeAddress {
  String get type => throw _privateConstructorUsedError;
  GeocodeAddressGeometry get geometry => throw _privateConstructorUsedError;
  GeocodeAddressProperties get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodeAddressCopyWith<GeocodeAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodeAddressCopyWith<$Res> {
  factory $GeocodeAddressCopyWith(
          GeocodeAddress value, $Res Function(GeocodeAddress) then) =
      _$GeocodeAddressCopyWithImpl<$Res, GeocodeAddress>;
  @useResult
  $Res call(
      {String type,
      GeocodeAddressGeometry geometry,
      GeocodeAddressProperties properties});

  $GeocodeAddressGeometryCopyWith<$Res> get geometry;
  $GeocodeAddressPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$GeocodeAddressCopyWithImpl<$Res, $Val extends GeocodeAddress>
    implements $GeocodeAddressCopyWith<$Res> {
  _$GeocodeAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? geometry = null,
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GeocodeAddressGeometry,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as GeocodeAddressProperties,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeocodeAddressGeometryCopyWith<$Res> get geometry {
    return $GeocodeAddressGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GeocodeAddressPropertiesCopyWith<$Res> get properties {
    return $GeocodeAddressPropertiesCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeocodeAddressImplCopyWith<$Res>
    implements $GeocodeAddressCopyWith<$Res> {
  factory _$$GeocodeAddressImplCopyWith(_$GeocodeAddressImpl value,
          $Res Function(_$GeocodeAddressImpl) then) =
      __$$GeocodeAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      GeocodeAddressGeometry geometry,
      GeocodeAddressProperties properties});

  @override
  $GeocodeAddressGeometryCopyWith<$Res> get geometry;
  @override
  $GeocodeAddressPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$GeocodeAddressImplCopyWithImpl<$Res>
    extends _$GeocodeAddressCopyWithImpl<$Res, _$GeocodeAddressImpl>
    implements _$$GeocodeAddressImplCopyWith<$Res> {
  __$$GeocodeAddressImplCopyWithImpl(
      _$GeocodeAddressImpl _value, $Res Function(_$GeocodeAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? geometry = null,
    Object? properties = null,
  }) {
    return _then(_$GeocodeAddressImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GeocodeAddressGeometry,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as GeocodeAddressProperties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodeAddressImpl
    with DiagnosticableTreeMixin
    implements _GeocodeAddress {
  const _$GeocodeAddressImpl(
      {required this.type, required this.geometry, required this.properties});

  factory _$GeocodeAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodeAddressImplFromJson(json);

  @override
  final String type;
  @override
  final GeocodeAddressGeometry geometry;
  @override
  final GeocodeAddressProperties properties;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeocodeAddress(type: $type, geometry: $geometry, properties: $properties)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeocodeAddress'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('geometry', geometry))
      ..add(DiagnosticsProperty('properties', properties));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodeAddressImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.properties, properties) ||
                other.properties == properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, geometry, properties);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodeAddressImplCopyWith<_$GeocodeAddressImpl> get copyWith =>
      __$$GeocodeAddressImplCopyWithImpl<_$GeocodeAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodeAddressImplToJson(
      this,
    );
  }
}

abstract class _GeocodeAddress implements GeocodeAddress {
  const factory _GeocodeAddress(
          {required final String type,
          required final GeocodeAddressGeometry geometry,
          required final GeocodeAddressProperties properties}) =
      _$GeocodeAddressImpl;

  factory _GeocodeAddress.fromJson(Map<String, dynamic> json) =
      _$GeocodeAddressImpl.fromJson;

  @override
  String get type;
  @override
  GeocodeAddressGeometry get geometry;
  @override
  GeocodeAddressProperties get properties;
  @override
  @JsonKey(ignore: true)
  _$$GeocodeAddressImplCopyWith<_$GeocodeAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
