import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/delivery_info/data/users_schedules_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_schedule.dart';

@RoutePage()
class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider.notifier).loggedUser;
    final AsyncValue<UserSchedule?> userSchedule =
        ref.watch(userScheduleProvider);

    return AppLayout.standard(
      appBar: AppAppBar.title('Panier'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sh(10),
          Padding(
            padding: pw(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user?.lastName} ${user?.firstName}').headlineMedium,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
