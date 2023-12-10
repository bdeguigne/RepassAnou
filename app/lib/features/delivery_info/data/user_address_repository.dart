import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
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
          .select<s.PostgrestList>(UserAddress.selectQuery)
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
          .select<s.PostgrestMap?>(UserAddress.selectQuery)
          .eq('user_id', userController.loggedUser!.id)
          .order('created_time', ascending: false)
          .limit(1)
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
    String? addressInfo,
    String? deliveryInstructions,
    String? companyName,
    required String entitled,
  }) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      // update the selected address if the id exists
      if (selectedUserAddress.id != null) {
        await supabase.usersAddressesTable
            .update(selectedUserAddress
                .copyWith(
                  addressInfo: addressInfo,
                  deliveryInstructions: deliveryInstructions,
                  companyName: companyName,
                  entitled: entitled,
                )
                .toDto(userController.loggedUser!.id)
                .toJson())
            .eq('id', selectedUserAddress.id);
        return;
      }

      // if the current address is from the database, we update need to change the selected address to false before inserting the new one
      if (selectedUserAddress.source == AddressSource.database) {
        await supabase.usersAddressesTable
            .update(selectedUserAddress.toJson())
            .eq('id', selectedUserAddress.id);
      }

      await supabase.usersAddressesTable.insert(
        UserAddressDto(
          userId: userController.loggedUser!.id,
          street: selectedUserAddress.street,
          postalCode: selectedUserAddress.postalCode,
          city: selectedUserAddress.city,
          latitude: selectedUserAddress.latitude,
          longitude: selectedUserAddress.longitude,
          addressInfo: addressInfo,
          deliveryInstructions: deliveryInstructions,
          companyName: companyName,
          entitled: entitled,
          label: selectedUserAddress.label,
          createdTime: DateTime.now(),
        ).toJson(),
      );
    } catch (e) {
      logger.e(e.toString());
      throw const ExceptionMessage(
          "Une erreur est survenur lors de l'enregistrement de votre adresse");
    }
  }

  Future<void> updateAddressDate(UserAddress selectedUserAddress) async {
    try {
      if (userController.loggedUser == null) {
        throw const ExceptionMessage('Impossible de récupérer l\'utilisateur');
      }

      await supabase.usersAddressesTable.update({
        'created_time': DateTime.now().toIso8601String(),
      }).eq('id', selectedUserAddress.id);
    } catch (e) {
      logger.e(e.toString());
      throw const ExceptionMessage(
          'Une erreur est survenur lors de la mise à jour de votre adresse');
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
Future<void> updateAddressDate(
    UpdateAddressDateRef ref, UserAddress selectedUserAddress) async {
  return ref.notifyOnError(
    () => ref
        .read(userAddressRepositoryProvider)
        .updateAddressDate(selectedUserAddress),
  );
}

final userAddressRepositoryProvider = Provider(
  (ref) => UserAddressRepository(
    logger: ref.read(loggerProvider),
    supabase: ref.read(supabaseClientProvider),
    userController: ref.read(userControllerProvider.notifier),
  ),
);
