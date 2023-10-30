import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/app_images.dart';
import 'package:repasse_anou/design_system/label_content.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/rounded_label.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';

@RoutePage()
class DressingDetailScreen extends StatelessWidget {
  const DressingDetailScreen({
    super.key,
    required this.userDressing,
    required this.imageData,
  });

  final UserDressing userDressing;
  final Uint8List imageData;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: DressingPersistentHeader(
              imageData: imageData,
              userDressing: userDressing,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: DressingDetailContent(
                userDressing: userDressing,
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
  });

  final UserDressing userDressing;

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
                Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.all(10),
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(),
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.all(10),
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(),
                    color: Color(0xFFE4E4E4),
                  ),
                ),
                Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.all(10),
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(),
                  ),
                  child: AppImages.color,
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
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: RoundedLabel(label: 'Laine'),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: RoundedLabel(label: 'Coton'),
              ),
              RoundedLabel(label: 'Viscose'),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildSection(
          'Notes',
          Container(
            child: const Text('Aucune').bodyMedium,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 56,
          child:
              ElevatedButton(onPressed: () {}, child: const Text('Modifier')),
        ),
      ],
    );
  }
}

class DressingPersistentHeader extends SliverPersistentHeaderDelegate {
  const DressingPersistentHeader({
    required this.userDressing,
    required this.imageData,
  });

  final UserDressing userDressing;
  final Uint8List imageData;

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
            // padding:
            //     const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pull blanc',
                        style: appTheme.textTheme.headlineMedium?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const Text('Dressing de Lou').labelLarge,
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Supprimer'),
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
                  onPressed: () {},
                  icon: SizedBox(
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
