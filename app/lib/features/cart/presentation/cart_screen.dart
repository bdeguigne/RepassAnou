import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_divider.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/article_card.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/cart/application/cart_service.dart';
import 'package:repasse_anou/features/commands/models/command_item.dart';
import 'package:repasse_anou/features/delivery_info/application/get_user_address_service.dart';
import 'package:repasse_anou/features/delivery_info/data/users_schedules_repository.dart';
import 'package:repasse_anou/features/delivery_info/models/user_address.dart';
import 'package:repasse_anou/features/delivery_info/models/user_schedule.dart';
import 'package:repasse_anou/features/delivery_info/presentation/command_detail_bottom_sheet.dart';
import 'package:repasse_anou/utils/date_formatter.dart';

@RoutePage()
class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider.notifier).loggedUser;
    final AsyncValue<UserSchedule?> userSchedule =
        ref.watch(userScheduleProvider);
    final AsyncValue<UserAddress> userAddress =
        ref.watch(getUserAddressServiceProvider);

    //to Set to remove duplicate
    final List<CommandItem> cartData =
        ref.watch(cartServiceProvider).toSet().toList();

    void showCommandDetailBottomSheet(BuildContext context) {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) => const CommandDetailBottomSheet(),
      );
    }

    Widget buildAddress() {
      return userAddress.when(
        data: (position) {
          return RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Adresse : ', style: bodyMedium),
                TextSpan(
                  text:
                      '${position.street} ${position.postalCode} ${position.city}',
                  style: bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, _) {
          return Row(
            children: [
              const Text('Addresse : ').bodyMedium,
              Text(error.toString()).bodyMedium,
            ],
          );
        },
        loading: () {
          return const Text('Chargement : ').bodyMedium;
        },
      );
    }

    Widget buildSchedule() {
      return userSchedule.when(
        data: (schedule) {
          final topLabel = schedule == null
              ? 'Aucune date sélectionnée'
              : '${formaterWeekDay(schedule.collectingDate)}. ${schedule.collectingDate.day}/${schedule.collectingDate.month} ${schedule.collectingSchedule.labelShort}';

          final bottomLabel = schedule == null
              ? 'Aucune date sélectionnée'
              : '${formaterWeekDay(schedule.deliveryDate)}. ${schedule.deliveryDate.day}/${schedule.deliveryDate.month} ${schedule.deliverySchedule.labelShort}';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${user?.lastName} ${user?.firstName}').headlineMedium,
              sh(8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Retrait : ', style: bodyMedium),
                    TextSpan(
                      text: topLabel,
                      style: bodyMedium.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Livraison : ', style: bodyMedium),
                    TextSpan(
                      text: bottomLabel,
                      style: bodyMedium.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              buildAddress(),
            ],
          );
        },
        error: (error, _) {
          return Padding(
            padding: pw(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user?.lastName} ${user?.firstName}').headlineMedium,
                Text('Retrait: ${error.toString()}').headlineMedium
              ],
            ),
          );
        },
        loading: () {
          return Padding(
            padding: pw(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user?.lastName} ${user?.firstName}').headlineMedium,
                const Text('Retrait: Chargement...').headlineMedium
              ],
            ),
          );
        },
      );
    }

    return AppLayout.standard(
      appBar: AppAppBar.title('Panier'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sh(10),
          Padding(
            padding: pw(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: buildSchedule()),
                AppButton.tertiary(
                  text: 'Modifier',
                  onPressed: () => showCommandDetailBottomSheet(context),
                )
              ],
            ),
          ),
          sh(10),
          Padding(
            padding: pw(20),
            child: const AppDivider(),
          ),
          sh(10),
          Padding(
            padding: pw(20),
            child: Column(
              children: cartData
                  .map(
                    (command) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ArticleCard(
                        isLoading: false,
                        description: command.description,
                        imageUrl: command.imageUrl,
                        price: command.price,
                        title: command.title,
                        onDismissed: () {},
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          sh(25),
          Padding(
            padding: pw(20),
            child: SizedBox(
              height: 50.h,
              child: AppTextField.filled(
                hint: 'Code promo',
                border: appOutlineInputBorder.copyWith(
                  borderRadius: br(10),
                  borderSide: BorderSide.none,
                ),
                suffix: Padding(
                  padding: pwh(10, 15),
                  child: AppButton.promoCode(
                    text: 'Appliquer',
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          sh(30),
          Padding(
            padding: pw(20),
            child: const AppDivider(),
          ),
        ],
      ),
    );
  }
}
