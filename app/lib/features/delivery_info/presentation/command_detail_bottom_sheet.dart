import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_bottom_sheet.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/delivery_info/application/get_user_address_service.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/routing/app_router.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

class CommandDetailBottomSheet extends ConsumerWidget {
  const CommandDetailBottomSheet({super.key});

  Widget buildCommandDetailSection({
    required String topLabel,
    required String bottomLabel,
    required String buttonLabel,
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: AppIcons.circleGrey,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(topLabel).bodyMedium,
                    Text(bottomLabel,
                        style:
                            bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 35,
          child: AppButton.tertiary(text: buttonLabel, onPressed: onPressed),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserAddress> userAddress =
        ref.watch(getUserAddressServiceProvider);

    return AppBottomSheet(
      title: 'Détail de la commande',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ColumnSpacing(
          spacing: 20,
          children: [
            buildCommandDetailSection(
              topLabel: 'Récupération & livraison',
              bottomLabel: userAddress.when(
                data: (position) => position.street,
                error: (error, stackTrace) =>
                    'Veuillez renseigner votre adresse',
                loading: () => 'Chargement...',
              ),
              buttonLabel: 'Modifier',
              onPressed: () => ref.read(navigationControllerProvider).push(
                    const PickupAndDeliveryRoute(),
                  ),
            ),
            buildCommandDetailSection(
              topLabel: 'Retrait : Lun. 09/10  14h-16h ',
              bottomLabel: 'Livraison : Mer. 11/10  14h-16h',
              buttonLabel: 'Planifier',
              onPressed: () => ref.read(navigationControllerProvider).push(
                    const PlanificationRoute(),
                  ),
            ),
            AppButton.primary(
              expanded: true,
              text: 'Terminer',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
