import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/app_images.dart';
import 'package:repasse_anou/design_system/label_content.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/rounded_label.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/dressing/application/add_dressing_modal_service.dart';
import 'package:repasse_anou/features/dressing/application/dressing_detail_screen_service.dart';
import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing_and_image.dart';
import 'package:repasse_anou/features/dressing/presentation/dressing_modal.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

@RoutePage()
class DressingDetailScreen extends HookConsumerWidget {
  const DressingDetailScreen({
    super.key,
    required this.userDressing,
    required this.image,
  });

  final UserDressing userDressing;
  final Uint8List image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> favValue = useState(userDressing.isFavorite);

    //store the user dressing data for updating the page after editing
    final ValueNotifier<UserDressing> userDressingData = useState(userDressing);
    final ValueNotifier<Uint8List> imageData = useState(image);

    ref.watch(dressingDetailScreenServiceProvider);
    final AsyncValue<UserDressingAndImage?> dressingModalState =
        ref.watch(addDressingModalServiceProvider);

    useEffect(
      () {
        if (dressingModalState is AsyncData &&
            dressingModalState.value != null) {
          userDressingData.value = dressingModalState.value!.userDressing;
          imageData.value = dressingModalState.value!.image ?? image;
        }
        return;
      },
      [dressingModalState],
    );

    Future<void> editFavorite(bool value) async {
      final success = await ref
          .read(dressingDetailScreenServiceProvider.notifier)
          .editFavoriteDressingItem(
            value,
            userDressingData.value,
          );

      if (success == true && context.mounted) {
        favValue.value = value;
        // ignore: unused_result
        ref.refresh(usersDressingsProvider);
      }
    }

    Future<void> deleteDressing() async {
      final success = await ref
          .read(dressingDetailScreenServiceProvider.notifier)
          .deleteUserDressing(userDressingData.value);

      if (success == true && context.mounted) {
        // ignore: unused_result
        ref.refresh(usersDressingsProvider);
        AutoRouter.of(context).pop();
      }
    }

    return AppLayout(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: DressingPersistentHeader(
              imageData: imageData.value,
              userDressing: userDressingData.value,
              favValue: favValue.value,
              onFavPressed: (value) {
                editFavorite(value);
              },
              onDeleteDressingPressed: () {
                deleteDressing();
              },
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: DressingDetailContent(
                userDressing: userDressingData.value,
                imageData: imageData.value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DressingDetailContent extends StatelessWidget {
  const DressingDetailContent({
    super.key,
    required this.userDressing,
    required this.imageData,
  });

  final UserDressing userDressing;
  final Uint8List imageData;

  @override
  Widget build(BuildContext context) {
    Widget buildSection(String title, Widget content) {
      return LabelContent(
        spacing: 10,
        titleTextStyle: appTheme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: const Color(0xFF33302E),
        ),
        title: title,
        child: content,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSection(
          'Catégorie',
          RoundedLabel(
            label: userDressing.dressingCategory.label,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildSection(
          'Couleur',
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: const Color(0xFFE5E5E5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      margin: const EdgeInsets.all(10),
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(),
                        color: Colors.black,
                      ),
                      child: userDressing.dressingColor.label ==
                              DressingColorLabels.black
                          ? Center(
                              child: AppIcons.checkWhite,
                            )
                          : Container(),
                    ),
                  ],
                ),
                Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.all(10),
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(),
                    color: Color(0xFFE4E4E4),
                  ),
                  child: userDressing.dressingColor.label ==
                          DressingColorLabels.white
                      ? Center(
                          child: AppIcons.check,
                        )
                      : Container(),
                ),
                Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      AppImages.color,
                      if (userDressing.dressingColor.label ==
                          DressingColorLabels.color)
                        Center(
                          child: AppIcons.check,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildSection(
          'Matière',
          RowSpacing(
            spacing: 10,
            children: userDressing.dressingMaterials
                .map(
                  (material) => RoundedLabel(label: material.label),
                )
                .toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildSection(
          'Notes',
          Container(
            child: userDressing.notes != null
                ? Text(userDressing.notes!).bodyMedium
                : const Text('Aucune').bodyMedium,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: AppButton.primary(
            text: 'Modifier',
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return DressingModal(
                    userDressing: userDressing,
                    imageData: imageData,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class DressingPersistentHeader extends SliverPersistentHeaderDelegate {
  const DressingPersistentHeader({
    required this.userDressing,
    required this.imageData,
    this.onFavPressed,
    this.favValue = false,
    this.onDeleteDressingPressed,
  });

  final UserDressing userDressing;
  final Uint8List imageData;

  final void Function(bool)? onFavPressed;
  final VoidCallback? onDeleteDressingPressed;
  final bool favValue;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Positioned(
          top: -shrinkOffset / 2,
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.memory(
            imageData,
            height: 435 + shrinkOffset,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userDressing.title,
                        style: appTheme.textTheme.headlineMedium?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const Text('Dressing de').labelLarge,
                    ],
                  ),
                  AppButton.secondary(
                    onPressed: () => onDeleteDressingPressed?.call(),
                    text: 'Supprimer',
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 100,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.8],
              colors: [
                Color.fromARGB(163, 255, 255, 255),
                Color.fromARGB(0, 255, 255, 255),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: AppIcons.arrowBack,
                ),
                IconButton(
                  onPressed: () => onFavPressed?.call(!favValue),
                  icon: favValue
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: AppIcons.heartFill,
                        )
                      : SizedBox(
                          height: 24,
                          width: 24,
                          child: AppIcons.heart,
                        ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
