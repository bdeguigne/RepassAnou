import 'package:repasse_anou/exception/exception_message.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class GeolocationRepository {
  Future<Position> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // throw const LocationServiceDisabledException();
        throw const ExceptionMessage(
            'Le service de localisation est désactivé');
      }

      // Demande de permission
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw const ExceptionMessage('Permission de localisation refusée');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw const ExceptionMessage('Permission de localisation refusée');
      }

      final pos = await Geolocator.getCurrentPosition();

      print(pos);

      return pos;
    } catch (e) {
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération de la géolocalisation');
    }
  }
}

final geoLocationRepositoryProvider = Provider<GeolocationRepository>(
  (ref) => GeolocationRepository(),
);
