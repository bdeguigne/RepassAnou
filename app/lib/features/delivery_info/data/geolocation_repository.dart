import 'package:geocoding/geocoding.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:geolocator/geolocator.dart';
import 'package:repasse_anou/features/delivery_info/models/placemark_and_position.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class GeolocationRepository {
  GeolocationRepository(
    this.geoLocator,
    this.logger,
  );
  final GeolocatorPlatform geoLocator;
  final Logger logger;

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await geoLocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      logger.e('Location services are disabled.');
      throw const ExceptionMessage('Le service de localisation est désactivé');
    }

    permission = await geoLocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geoLocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        logger.e('Location permissions are denied');
        throw const ExceptionMessage('Permission de localisation refusée');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      logger.e(
          'Location permissions are permanently denied, we cannot request permissions.');
      throw const ExceptionMessage('Permission de localisation refusée');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true;
  }

  Future<Placemark> _getPlaceFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      return placemarks.first;
    } catch (e) {
      logger.e('Failed to get address from coordinates: $e');
      throw Exception('Failed to get address from coordinates: $e');
    }
  }

  Future<PlacemarkAndPosition?> getCurrentAddress() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      throw const ExceptionMessage('Permission de localisation refusée');
    }

    final position = await geoLocator.getCurrentPosition();

    final place =
        await _getPlaceFromCoordinates(position.latitude, position.longitude);

    return PlacemarkAndPosition(
      placemark: place,
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}

final geoLocationRepositoryProvider = Provider<GeolocationRepository>(
  (ref) => GeolocationRepository(
    ref.read(geolocatorPlatformProvider),
    ref.read(loggerProvider),
  ),
);
