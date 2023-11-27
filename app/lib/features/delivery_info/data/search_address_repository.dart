import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/delivery_info/models/geocode_address.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_address_repository.g.dart';

class SearchAddressRepository {
  SearchAddressRepository({required this.logger});

  final Logger logger;

  Future<List<GeocodeAddress>> getSearchAddress(String address) async {
    try {
      String urlEncoded = Uri.encodeFull(address);
      final response = await http.get(
        Uri.parse('https://api-adresse.data.gouv.fr/search/?q=$urlEncoded'),
      );

      if (response.statusCode != 200) {
        throw ExceptionMessage(response.body);
      }

      final featureCollection =
          FeatureCollection.fromJson(jsonDecode(response.body));

      return featureCollection.features;
    } catch (e) {
      logger.e(e.toString());
      throw const ExceptionMessage('Impossible de récupérer l\'adresse');
    }
  }
}

final searchAddressRepositoryProvider =
    Provider<SearchAddressRepository>((ref) {
  return SearchAddressRepository(
    logger: ref.read(loggerProvider),
  );
});

@Riverpod(keepAlive: false)
Future<List<GeocodeAddress>?> searchAddress(
    SearchAddressRef ref, String address) async {
  if (address.length < 3) return null;
  return ref.notifyOnError(
    () => ref.read(searchAddressRepositoryProvider).getSearchAddress(address),
  );
}
