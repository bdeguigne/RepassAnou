import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/shared/top_level_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class DressingService {
  DressingService(this.supabase, this.logger);
  final s.SupabaseClient supabase;
  final Logger logger;
}

final Provider<DressingService> dressingServiceProvider =
    Provider<DressingService>((ref) {
  return DressingService(
    ref.read(supabaseClientProvider),
    ref.read(loggerProvider),
  );
});
