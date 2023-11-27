// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:geocoding/geocoding.dart';

class PlacemarkAndPosition {
  final Placemark placemark;
  final double latitude;
  final double longitude;

  PlacemarkAndPosition({
    required this.placemark,
    required this.latitude,
    required this.longitude,
  });
}
