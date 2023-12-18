import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/delivery_info/data/geolocation_repository.dart';
import 'package:repasse_anou/features/delivery_info/data/user_address_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_address_service.g.dart';

@Riverpod(keepAlive: true)
class GetUserAddressService extends _$GetUserAddressService {
  @override
  FutureOr<UserAddress> build() async {
    print('BUILD ???');

    final selectedAddress =
        await ref.read(userAddressRepositoryProvider).getSelectedAddress();
    if (selectedAddress != null) {
      ref.read(loggerProvider).i('Selected address found : $selectedAddress');
      return selectedAddress;
    }

    //* Logique pour utiliser la géolocalisation si aucune adresse n'est sélectionnée
    final currentPlace =
        await ref.read(geoLocationRepositoryProvider).getCurrentAddress();
    if (currentPlace != null) {
      final userAddress = UserAddress.geolocation(
        street: currentPlace.placemark.street ?? '',
        city: currentPlace.placemark.locality ?? '',
        postalCode: currentPlace.placemark.postalCode ?? '',
        latitude: currentPlace.latitude,
        longitude: currentPlace.longitude,
      );

      ref
          .read(loggerProvider)
          .i('Address from geolocation found : $userAddress');

      return userAddress;
    }

    throw const ExceptionMessage('Impossible de récupérer votre adresse');
  }

  Future<void> updateAddress(UserAddress newAddress) async {
    state = AsyncValue.data(newAddress);
  }
}
