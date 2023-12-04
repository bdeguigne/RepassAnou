import 'package:supabase_flutter/supabase_flutter.dart' as s;

extension SupabaseExtensions<T> on s.SupabaseClient {
  s.SupabaseQueryBuilder get usersTable => from('users');
  s.SupabaseQueryBuilder get commandItemsTable => from('command_items');
  s.SupabaseQueryBuilder get dressingCategoriesTable =>
      from('dressing_categories');
  s.SupabaseQueryBuilder get dressingColorsTable => from('dressing_colors');
  s.SupabaseQueryBuilder get dressingMaterialsTable =>
      from('dressing_materials');
  s.SupabaseQueryBuilder get usersDressingsTable => from('users_dressings');
  s.SupabaseQueryBuilder get usersDressingsMaterialsTable =>
      from('users_dressings_materials');
  s.SupabaseQueryBuilder get usersDressingsBelongsToTable =>
      from('users_dressings_belongs_to');
  s.SupabaseQueryBuilder get usersAddressesTable => from('users_addresses');
  s.SupabaseQueryBuilder get usersSchedulesTable => from('users_schedules');
  s.SupabaseQueryBuilder get planificationTimeSlotsTable =>
      from('planification_time_slots');
}

extension SupabaseStorageExtensions<T> on s.SupabaseStorageClient {
  s.StorageFileApi get commandItemsImagesBucket => from('command_items_images');
  s.StorageFileApi get dressingImagesBucket => from('dressing_images');
}
