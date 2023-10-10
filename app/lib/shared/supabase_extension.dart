import 'package:repasse_anou/shared/models/user/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

extension SupabaseExtensions<T> on s.SupabaseClient {
  s.SupabaseQueryBuilder get usersTable => from('users');
  s.SupabaseQueryBuilder get dressingTable => from('dressing');
}

extension PostgrestMapX on s.PostgrestMap {
  User? toAppUser() {
    if (!this['id']) return null;
    return User.fromJson(this);
  }
}
