import 'package:http/http.dart' as http;
import 'package:repasse_anou/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_address_repository.g.dart';

class SearchAddressRepository {
  Future<String> getSearchAddress(String address) async {
    String urlEncoded = Uri.encodeFull(address);
    final response = await http.get(
      Uri.parse('https://api-adresse.data.gouv.fr/search/?q=$urlEncoded'),
    );

    print(response.statusCode);
    print(response.body);

    return response.body;
  }
}

final searchAddressRepositoryProvider =
    Provider<SearchAddressRepository>((ref) {
  return SearchAddressRepository();
});

@riverpod
Future<String?> searchAddress(SearchAddressRef ref, String address) async {
  if (address.length < 3) return null;
  return ref.notifyOnError(
    () => ref.read(searchAddressRepositoryProvider).getSearchAddress(address),
  );
}
