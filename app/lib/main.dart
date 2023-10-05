import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:runpasseo/core/top_level_providers.dart';
import 'package:runpasseo/presentation/design_system/snackbars.dart';
import 'package:runpasseo/presentation/design_system/theme.dart';
import 'package:runpasseo/presentation/routes/app_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = ref.watch(routerProvider);
    final GlobalKey<ScaffoldMessengerState> scaffoldKey =
        ref.watch(scaffoldKeyProvider);

    return MaterialApp.router(
      theme: appTheme,
      builder: AppSnackbars.init(),
      scaffoldMessengerKey: scaffoldKey,
      routerConfig: appRouter.config(
        navigatorObservers: () => [AppSnackbars.initObserver()],
      ),
    );
  }
}
