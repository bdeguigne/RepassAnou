import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:repasse_anou/routing/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;
import 'package:uuid/uuid.dart';

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

final Provider<ImagePicker> imagePickerProvider =
    Provider((ref) => ImagePicker());

final Provider<Uuid> uuidProvider = Provider((ref) => const Uuid());

final Provider<GeolocatorPlatform> geolocatorPlatformProvider =
    Provider((ref) => GeolocatorPlatform.instance);
