import 'package:repasse_anou/features/delivery_info/data/user_address_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_user_address_service.g.dart';

@riverpod
class SaveUserAddressService extends _$SaveUserAddressService {
  @override
  FutureOr<void> build() {}

  Future<bool> saveUserAddress({
    required UserAddress selectedUserAddress,
    required String addressInfo,
    required String deliveryInstructions,
    required String companyName,
    required String entitled,
  }) async {
    state = const AsyncLoading();
    final UserAddressRepository userAddressRepository =
        ref.read(userAddressRepositoryProvider);

    state = await ref.guardAndNotifyOnError(
      () => userAddressRepository.saveUserAddress(
        selectedUserAddress: selectedUserAddress,
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
