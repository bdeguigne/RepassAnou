import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/application/auth_notifier.dart';
import 'package:repasse_anou/core/top_level_providers.dart';
import 'package:repasse_anou/presentation/design_system/snackbars.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';
import 'package:repasse_anou/presentation/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_KEY'),
  );
  final ProviderContainer container = ProviderContainer();
  container.read<AuthNotifier>(authNotifierProvider.notifier).listen();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
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
