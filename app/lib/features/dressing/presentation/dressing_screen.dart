import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_checkbox.dart';
import 'package:repasse_anou/design_system/dressing_card.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';
import 'package:repasse_anou/features/dressing/data/dressing_belongs_to_repository.dart';
import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_belong_to.dart';
import 'package:repasse_anou/features/dressing/presentation/dressing_detail_screen.dart';
import 'package:repasse_anou/features/dressing/presentation/dressing_modal.dart';
import 'package:repasse_anou/features/dressing/presentation/dressing_screen_view_model.dart';
import 'package:repasse_anou/design_system/app_bottom_sheet.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/photo/data/image_storage_repository.dart';
import 'package:repasse_anou/routing/navigation_controller.dart';

@RoutePage()
class DressingScreen extends ConsumerStatefulWidget {
  const DressingScreen({super.key});

  @override
  ConsumerState<DressingScreen> createState() => _DressingScreenState();
}

class _DressingScreenState extends ConsumerState<DressingScreen> {
  late DressingScreenViewModel model =
      ref.read(dressingScreenViewModelProvider.notifier);
  late NavigationController navigationController =
      ref.read(navigationControllerProvider);

  final List<UserDressing> selectedDressing = [];
  List<String> ignoredBelongsTo = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      ignoredBelongsTo = [];
    });

    final hasReadDressingMessage =
        ref.read(userControllerProvider)?.hasReadDressingMessage;
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
                child: Text(
                  'Vous avez la possibilité d’ajoutez vos vêtements dans ce dressing virtuel 👗\n\nEn y ajoutant vos pièces régulièrement, vous vous assurez que chacun de vos vêtements reçoive le traitement qui lui convient le mieux ✨\n\nPour un lavage, séchage et repassage toujours au top ! 👌',
                  style: bodyMedium.copyWith(overflow: TextOverflow.visible),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    AppCheckbox(
                      value: notShowMessage,
                      onChanged: (value) {
                        if (value != null) {
                          model.updateNotShowMessage(value);
                        }
                      },
                    ),
                    Text(
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

  Widget buildDressingItems(UserDressingBelongsTo belongsTo) {
    final AsyncValue<List<UserDressing>> usersDressings = ref.watch(
      usersDressingsByBelongsToProvider(belongsTo),
    );

    return usersDressings.when<Widget>(
      data: (data) {
        if (data.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              ignoredBelongsTo.add(belongsTo.id);
            });
          });
          // return empty content because we already ignore this belongsTo
          return Container();
        }
        return SizedBox(
          height: 225,
          child: ListView.builder(
            itemCount: data.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final dressing = data.elementAt(index);
              final bool isLastItem = data.length - 1 != index;
              final padding = EdgeInsets.only(right: isLastItem ? 4 : 0);

              final AsyncValue<Uint8List> image =
                  ref.watch(ReadImageProvider(dressing.imagePath));

              return image.when(
                data: (imageData) => Padding(
                  padding: padding,
                  child: DressingCard(
                    title: dressing.title,
                    image: imageData,
                    selected: selectedDressing.contains(dressing),
                    isFavorite: dressing.isFavorite,
                    openBuilder: (context, action) {
                      return DressingDetailScreen(
                        image: imageData,
                        userDressing: dressing,
                      );
                    },
                  ),
                ),
                loading: () => Padding(
                  padding: padding,
                  child: const DressingCard(
                    isLoading: true,
                  ),
                ),
                error: (error, stackTrace) => const DressingCard(
                  isLoading: true,
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child:
            Text('Une erreur est survenue lors de la récupération du dressing'),
      ),
      loading: () => SizedBox(
        height: 225,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: List.generate(
              3,
              (index) => const Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: DressingCard(isLoading: true),
              ),
            )),
      ),
    );
  }

  Widget buildDressingBelongsToItems(
      AsyncValue<List<UserDressingBelongsTo>> usersDressingBelongsTo) {
    return usersDressingBelongsTo.when(
      data: (data) {
        return Expanded(
          child: ListView(
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              children: data.map((belongsTo) {
            return !ignoredBelongsTo.contains(belongsTo.id)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Dressing de ${belongsTo.name}')
                                .headlineMedium,
                            Text(
                              'Voir tout',
                              style: labelLarge.copyWith(
                                  color: const Color(0xFF9B9B9B)),
                            ),
                          ],
                        ),
                      ),
                      buildDressingItems(belongsTo),
                    ],
                  )
                : Container();
          }).toList()),
        );
      },
      error: (error, stackTrace) => const Center(
        child:
            Text('Une erreur est survenue lors de la récupération du dressing'),
      ),
      loading: () => const Center(
        child: Text('Loading...'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<UserDressingBelongsTo>> usersDressingBelongsTo =
        ref.watch(usersDressingsBelongsToProvider);

    return AppLayout.standard(
        scrollable: false,
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
                  buildTopButton(
                      'Dressing de', const Icon(Icons.settings), () {}),
                  buildTopButton(
                    'Ajouter',
                    const Icon(Icons.add),
                    () {
                      showDialog<void>(
                        context: context,
                        builder: (context) {
                          return DressingModal();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildDressingBelongsToItems(usersDressingBelongsTo),
          ],
        ));
  }
}
