import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:runpasseo/presentation/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

final Provider<AppRouter> routerProvider = Provider(
  (ProviderRef<AppRouter> ref) => AppRouter(),
);

final Provider<GlobalKey<ScaffoldMessengerState>> scaffoldKeyProvider =
    Provider((ProviderRef<GlobalKey<ScaffoldMessengerState>> ref) =>
        GlobalKey<ScaffoldMessengerState>());

final Provider<s.SupabaseClient> firebaseStorageProvider =
    Provider<s.SupabaseClient>(
        (ProviderRef<s.SupabaseClient> ref) => s.Supabase.instance.client);
