import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/shimmer_loading.dart';
import 'package:repasse_anou/design_system/theme.dart';

class DressingCard extends HookWidget {
  const DressingCard({
    super.key,
    this.isLoading = false,
    this.title,
    this.image,
    this.selected = false,
    this.onSelected,
    this.onLongPress,
  });

  final String? title;
  final bool isLoading;
  final Uint8List? image;
  final bool selected;
  final void Function(bool?)? onSelected;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final showLoading = useState(isLoading);
    final opacityAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 450),
    );
    Animation<double> opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: opacityAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    opacityAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showLoading.value = false;
      }
    });

    useEffect(
      () {
        if (isLoading) {
          showLoading.value = true;
          opacityAnimationController.reverse();
        } else {
          opacityAnimationController.forward();
        }
        return null;
      },
      [isLoading],
    );

    Widget showLoadingCard() {
      return ShimmerLoading(
        isLoading: true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          width: 126,
          height: 172,
        ),
      );
    }

    Widget showCard() {
      return SizedBox(
        child: Column(
          children: [
            Container(
              width: 126,
              height: 172,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 24,
                  offset: Offset(0, 11),
                  spreadRadius: 0,
                )
              ]),
              child: Stack(
                children: [
                  AppInkWell(
                    radius: const BorderRadius.all(Radius.circular(10)),
                    onTap: () => onSelected?.call(!selected),
                    onLongPress: () => onLongPress?.call(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: image != null
                          ? SizedBox(
                              width: 126,
                              height: 172,
                              child: Image.memory(
                                image!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Checkbox(
                      value: onSelected != null ? selected : false,
                      onChanged: onSelected,
                    ),
                  ),
                ],
              ),
            ),
            title != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title!,
                      style: bodyMedium.copyWith(color: blackVariant),
                    ),
                  )
                : Container(),
          ],
        ),
      );
    }

    return Stack(
      children: [
        if (showLoading.value) showLoadingCard(),
        FadeTransition(
          opacity: opacityAnimation,
          child: showCard(),
        ),
      ],
    );
  }
}
