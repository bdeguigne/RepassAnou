import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/delivery_info/data/geolocation_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address_dto.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;
import 'package:repasse_anou/utils/top_level_providers.dart';

part 'user_address_repository.g.dart';

class UserAddressRepository {
  UserAddressRepository({
    required this.logger,
    required this.supabase,
    required this.userController,
  });

  final Logger logger;
  final s.SupabaseClient supabase;
  final UserController userController;

  Future<List<UserAddress>> getUserAddresses() async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      final response = await supabase.usersAddressesTable
          .select<s.PostgrestList>(
              'id, address, address_info, delivery_instructions, company_name, entitled, selected')
          .eq('user_id', userController.loggedUser!.id);

      return response.map((data) => UserAddress.fromJson(data)).toList();
    } catch (e) {
      logger.e(e.toString());
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération de vos adresses');
    }
  }

  Future<UserAddress?> getSelectedAddress() async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      final response = await supabase.usersAddressesTable
          .select<s.PostgrestMap?>(
              'id, address, address_info, delivery_instructions, company_name, entitled, selected')
          .eq('user_id', userController.loggedUser!.id)
          .eq('selected', true)
          .maybeSingle();

      return response != null
          ? UserAddress.fromJson(response)
              .copyWith(source: AddressSource.database)
          : null;
    } catch (e) {
      logger.e(e.toString());
      throw const ExceptionMessage(
          'Une erreur est survenue lors de la récupération de votre adresse');
    }
  }

  Future<void> saveUserAddress({
    required UserAddress selectedUserAddress,
    required String address,
    String? addressInfo,
    String? deliveryInstructions,
    String? companyName,
    required String entitled,
  }) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      // if the current address is from the database, we update need to change the selected address to false before inserting the new one
      if (selectedUserAddress.source == AddressSource.database) {
        await supabase.usersAddressesTable
            .update(selectedUserAddress.copyWith(selected: false).toJson())
            .eq('id', selectedUserAddress.id);
      }

      await supabase.usersAddressesTable.insert(
        UserAddressDto(
          userId: userController.loggedUser!.id,
          address: address,
          addressInfo: addressInfo,
          deliveryInstructions: deliveryInstructions,
          companyName: companyName,
          entitled: entitled,
          selected: true,
        ).toJson(),
      );
    } catch (e) {
      logger.e(e.toString());
      throw const ExceptionMessage(
          "Une erreur est survenur lors de l'enregistrement de votre adresse");
    }
  }
}

@riverpod
Future<List<UserAddress>> userAddresses(UserAddressesRef ref) async {
  return ref.notifyOnError(
    () => ref.read(userAddressRepositoryProvider).getUserAddresses(),
  );
}

@riverpod
Future<UserAddress> selectedAddressOrGeolocation(
    SelectedAddressOrGeolocationRef ref) async {
  return ref.notifyOnError(
    () async {
      final selectedAddress =
          await ref.read(userAddressRepositoryProvider).getSelectedAddress();
      if (selectedAddress != null) {
        ref.read(loggerProvider).i('Selected address found : $selectedAddress');
        return selectedAddress;
      }

      final currentAddress =
          await ref.read(geoLocationRepositoryProvider).getCurrentAddress();
      if (currentAddress != null) {
        final userAddress = UserAddress.geolocation(currentAddress);

        ref
            .read(loggerProvider)
            .i('Address from geolocation found : $userAddress');

        return userAddress;
      }

      throw const ExceptionMessage('Impossible de récupérer votre adresse');
    },
  );
}

final userAddressRepositoryProvider = Provider(
  (ref) => UserAddressRepository(
    logger: ref.read(loggerProvider),
    supabase: ref.read(supabaseClientProvider),
    userController: ref.read(userControllerProvider.notifier),
  ),
);
