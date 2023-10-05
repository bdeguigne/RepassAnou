import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:runpasseo/presentation/routes/app_router.dart';

final Provider<AppRouter> routerProvider = Provider(
  (ProviderRef<AppRouter> ref) => AppRouter(),
);

final Provider<GlobalKey<ScaffoldMessengerState>> scaffoldKeyProvider =
    Provider((ProviderRef<GlobalKey<ScaffoldMessengerState>> ref) =>
        GlobalKey<ScaffoldMessengerState>());
