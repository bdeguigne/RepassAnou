// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address_dto.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

import 'package:repasse_anou/utils/top_level_providers.dart';

class UserAddressRepository {
  UserAddressRepository({
    required this.logger,
    required this.supabase,
    required this.userController,
  });

  final Logger logger;
  final s.SupabaseClient supabase;
  final UserController userController;

  Future<void> saveUserAddress({
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

      await supabase.usersAddressesTable.insert(
        UserAddressDto(
          userId: userController.loggedUser!.id,
          address: address,
          addressInfo: addressInfo,
          deliveryInstructions: deliveryInstructions,
          companyName: companyName,
          entitled: entitled,
        ).toJson(),
      );
    } catch (e) {
      logger.e(e.toString());
      throw const ExceptionMessage(
          "Une erreur est survenur lors de l'enregistrement de votre adresse");
    }
  }
}

final userAddressRepositoryProvider = Provider(
  (ref) => UserAddressRepository(
    logger: ref.read(loggerProvider),
    supabase: ref.read(supabaseClientProvider),
    userController: ref.read(userControllerProvider.notifier),
  ),
);
