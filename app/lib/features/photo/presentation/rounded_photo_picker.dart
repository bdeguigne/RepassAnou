import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/features/photo/application/image_picker_service.dart';

class RoundedPhotoPicker extends HookConsumerWidget {
  const RoundedPhotoPicker({super.key, this.onImagePicked});

  final void Function(XFile image)? onImagePicked;

  Widget buildShowPhoto(XFile? image, WidgetRef ref, bool isLoading) {
    return Container(
      width: 158,
      height: 158,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: image == null
              ? Image.asset('assets/images/empty-dressing.png').image
              : Image.file(File(image.path)).image,
          fit: BoxFit.fill,
        ),
        shape: const OvalBorder(side: BorderSide(width: 4)),
        shadows: const [
          BoxShadow(
            color: Color(0x26646464),
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 44,
              height: 44,
              decoration: ShapeDecoration(
                color: const Color(0xFF1D272F),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x4CA7AEC1),
                    blurRadius: 80,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: AppInkWell(
                onTap: () {
                  ref
                      .read(imagePickerServiceProvider.notifier)
                      .pickImageFromGallery();
                },
                child: const Center(
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(imagePickerServiceProvider);

    return Stack(
      children: [
        imageState.when(
          data: (image) {
            if (onImagePicked != null && image != null) {
              onImagePicked!(image);
            }
            return buildShowPhoto(image, ref, false);
          },
          error: (err, stack) => buildShowPhoto(null, ref, false),
          loading: () => buildShowPhoto(null, ref, true),
        ),
      ],
    );
  }
}
