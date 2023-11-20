import 'package:repasse_anou/features/delivery_info/data/user_address_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_address_service.g.dart';

@riverpod
class UserAddressService extends _$UserAddressService {
  @override
  FutureOr<void> build() {}

  Future<bool> saveUserAddress(
    UserAddress selectedUserAddress,
    String address,
    String addressInfo,
    String deliveryInstructions,
    String companyName,
    String entitled,
  ) async {
    state = const AsyncLoading();
    final UserAddressRepository userAddressRepository =
        ref.read(userAddressRepositoryProvider);

    state = await ref.guardAndNotifyOnError(
      () => userAddressRepository.saveUserAddress(
        selectedUserAddress: selectedUserAddress,
        address: address,
        addressInfo: addressInfo.isEmpty ? null : addressInfo,
        deliveryInstructions:
            deliveryInstructions.isEmpty ? null : deliveryInstructions,
        companyName: companyName.isEmpty ? null : companyName,
        entitled: entitled,
      ),
      successMessage: 'Votre adresse a été enregistrée avec succès',
    );

    return state.hasError == false;
  }
}
