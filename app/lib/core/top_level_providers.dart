import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/presentation/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

final Provider<AppRouter> routerProvider = Provider(
  (ProviderRef<AppRouter> ref) => AppRouter(),
);

final Provider<GlobalKey<ScaffoldMessengerState>> scaffoldKeyProvider =
    Provider((ProviderRef<GlobalKey<ScaffoldMessengerState>> ref) =>
        GlobalKey<ScaffoldMessengerState>());

final Provider<s.SupabaseClient> supabaseClientProvider =
    Provider<s.SupabaseClient>(
        (ProviderRef<s.SupabaseClient> ref) => s.Supabase.instance.client);

final Provider<Logger> loggerProvider = Provider<Logger>(
  (ProviderRef<Logger> ref) => Logger(
    printer: PrettyPrinter(methodCount: 2, printEmojis: true, printTime: true),
  ),
);
