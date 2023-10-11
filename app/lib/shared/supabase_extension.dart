import 'package:supabase_flutter/supabase_flutter.dart' as s;

extension SupabaseExtensions<T> on s.SupabaseClient {
  s.SupabaseQueryBuilder get usersTable => from('users');
  s.SupabaseQueryBuilder get dressingCategoriesTable =>
      from('dressing_categories');
  s.SupabaseQueryBuilder get dressingColorsTable => from('dressing_colors');
  s.SupabaseQueryBuilder get dressingMaterialsTable =>
      from('dressing_materials');
}
