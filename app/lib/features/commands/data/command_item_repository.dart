import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/features/commands/models/command_item.dart';
import 'package:repasse_anou/failures/failure.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class CommandItemRepository {
  CommandItemRepository(this.supabase, this.logger);

  final s.SupabaseClient supabase;
  final Logger logger;

  Future<Either<Failure, List<CommandItem>>> getCommandItems() async {
    try {
      final data =
          await supabase.from('command_items').select<s.PostgrestList>();
      return right(
        data.map((commandItemData) {
          return CommandItem.fromJson(commandItemData);
        }).toList(),
      );
    } catch (e) {
      logger.e(e.toString());
      return left(const Failure('Impossible de récupérer les commandes'));
    }
  }
}

final Provider<CommandItemRepository> commandItemRepositoryProvider =
    Provider<CommandItemRepository>((ref) {
  return CommandItemRepository(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
  );
});
