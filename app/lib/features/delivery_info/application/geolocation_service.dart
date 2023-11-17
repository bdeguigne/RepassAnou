import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:repasse_anou/features/delivery_info/data/geolocation_repository.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geolocation_service.g.dart';

@riverpod
class GeoLocationService extends _$GeoLocationService {
  @override
  FutureOr<Position?> build() {
    return null;
  }

  Future<bool> getCurrentLocation() async {
    final geoLocalationRepository = ref.read(geoLocationRepositoryProvider);

    state = const AsyncLoading();
    state = await ref.guardAndNotifyOnError(
      () => geoLocalationRepository.getCurrentLocation(),
    );

    state.whenData(
      (value) => getPlaceFromCoordinates(value!.latitude, value.longitude).then(
        (value) {
          print('ADDRESSSSSS');
          print(value);
        },
      ),
    );

    return state.hasError;
  }

  Future<Placemark> getPlaceFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      return placemarks.first;
    } catch (e) {
      throw Exception('Failed to get address from coordinates: $e');
    }
  }
}
