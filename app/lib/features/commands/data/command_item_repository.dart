import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/exception/exception_message.dart';
import 'package:repasse_anou/features/commands/models/command_item.dart';
import 'package:repasse_anou/utils/extensions.dart';
import 'package:repasse_anou/utils/supabase_extension.dart';
import 'package:repasse_anou/utils/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

part 'command_item_repository.g.dart';

class CommandItemRepository {
  CommandItemRepository(this.supabase, this.logger);

  final s.SupabaseClient supabase;
  final Logger logger;

  Future<List<CommandItem>> getCommandItems() async {
    try {
      final response = await supabase.commandItemsTable.select().order('price');

      return response.map((commandItemData) {
        return CommandItem.fromJson(commandItemData);
      }).toList();
    } catch (e) {
      logger.e(e.toString());
      throw const ExceptionMessage('Impossible de récupérer les commandes');
    }
  }
}

@Riverpod(keepAlive: true)
Future<List<CommandItem>> commandItems(CommandItemsRef ref) async {
  final CommandItemRepository repository =
      await ref.read(commandItemRepositoryProvider);

  return ref.notifyOnError(() => repository.getCommandItems());
}

final Provider<CommandItemRepository> commandItemRepositoryProvider =
    Provider<CommandItemRepository>((ref) {
  return CommandItemRepository(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
  );
});
