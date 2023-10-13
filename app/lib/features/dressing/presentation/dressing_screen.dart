import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/dressing/presentation/add_dressing_modal.dart';
import 'package:repasse_anou/features/dressing/presentation/dressing_screen_view_model.dart';
import 'package:repasse_anou/design_system/app_bottom_sheet.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/theme.dart';

@RoutePage()
class DressingScreen extends ConsumerStatefulWidget {
  const DressingScreen({super.key});

  @override
  ConsumerState<DressingScreen> createState() => _DressingScreenState();
}

class _DressingScreenState extends ConsumerState<DressingScreen> {
  late DressingScreenViewModel model =
      ref.read(dressingScreenViewModelProvider.notifier);

  @override
  void initState() {
    super.initState();

    final hasReadDressingMessage =
        ref.read(userControllerProvider)?.hasReadDressingMessage;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model.getUsersDressings();
      if (hasReadDressingMessage == false) {
        showModalBottomSheet<void>(
          context: context,
          builder: (context) => buildDressingMessageBottomSheet(),
        );
      }
    });
  }

  Widget buildDressingMessageBottomSheet() {
    return Consumer(
      builder: (context, ref, child) {
        bool notShowMessage =
            ref.watch(dressingScreenViewModelProvider).notShowMessage;
        return AppBottomSheet(
          title: 'Votre dressing',
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text(
                  'Vous avez la possibilité d’ajoutez vos vêtements dans ce dressing virtuel 👗\n\nEn y ajoutant vos pièces régulièrement, vous vous assurez que chacun de vos vêtements reçoive le traitement qui lui convient le mieux ✨\n\nPour un lavage, séchage et repassage toujours au top ! 👌',
                ).bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Checkbox(
                      value: notShowMessage,
                      onChanged: (value) {
                        if (value != null) {
                          model.updateNotShowMessage(value);
                        }
                      },
                    ),
                    const Text(
                      'Ne plus afficher ce message',
                      style: bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      model.hasReadDressingMessage();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "J'ai compris",
                    ).headlineLargeWhite,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> buildEmptyDressing() {
    return [
      const Spacer(),
      Image.asset('assets/images/empty-dressing.png', width: 160),
      const SizedBox(
        height: 16,
      ),
      const Text(
        'Votre dressing est vide pour le moment',
      ).headlineMediumLightBlack,
      const SizedBox(
        height: 10,
      ),
      Text(
        'Ajoutez-y vos vêtements pour les voir\napparaître ici',
        textAlign: TextAlign.center,
        style: labelMedium.copyWith(color: const Color(0xffA7A9B7)),
      ),
      const Spacer(),
    ];
  }

  Widget buildTopButton(String label, Widget filter, VoidCallback? onTap) {
    return AppInkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Row(
              children: [
                filter,
                const SizedBox(
                  width: 10,
                ),
                Text(label).bodyLarge,
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Mon Dressing').headlineLarge,
              const Icon(Icons.search),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTopButton('Filtrer', const Icon(Icons.filter), () {}),
              buildTopButton('Dressing de', const Icon(Icons.settings), () {}),
              buildTopButton(
                'Ajouter',
                const Icon(Icons.add),
                () {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return const AddDressingModal();
                    },
                  );
                },
              ),
            ],
          ),
        ),
        ...buildEmptyDressing(),
      ],
    ));
  }
}
