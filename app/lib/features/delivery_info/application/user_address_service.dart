import 'package:repasse_anou/features/delivery_info/data/user_address_repository.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_address_service.g.dart';

@riverpod
class UserAddressService extends _$UserAddressService {
  @override
  FutureOr<void> build() {}

  Future<bool> saveUserAddress(
    String address,
    String? addressInfo,
    String? deliveryInstructions,
    String? companyName,
    String entitled,
  ) async {
    state = const AsyncLoading();

    final UserAddressRepository userAddressRepository =
        ref.read(userAddressRepositoryProvider);

    state = await ref.guardAndNotifyOnError(
      () => userAddressRepository.saveUserAddress(
        address: address,
        addressInfo: addressInfo,
        deliveryInstructions: deliveryInstructions,
        companyName: companyName,
        entitled: entitled,
      ),
      successMessage: 'Votre adresse a été enregistrée avec succès',
    );

    return state.hasError == false;
  }
}
