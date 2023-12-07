import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/quantity_state_controller.dart';
import 'package:repasse_anou/design_system/theme.dart';

class QuantityButton extends ConsumerStatefulWidget {
  const QuantityButton({
    super.key,
    required this.persitenceKey,
    this.onAddQuentity,
    this.onRemoveQuentity,
  });

  final String persitenceKey;
  final VoidCallback? onAddQuentity;
  final VoidCallback? onRemoveQuentity;

  @override
  ConsumerState<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends ConsumerState<QuantityButton> {
  // late int _quantity;

  @override
  Widget build(BuildContext context) {
    final quantityState =
        ref.watch(quantityStateControllerProvider(widget.persitenceKey));
    final quantityStateController = ref
        .read(quantityStateControllerProvider(widget.persitenceKey).notifier);

    return Container(
      width: 70.w,
      height: 30.h,
      decoration: ShapeDecoration(
        color: greyButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppInkWell(
              onTap: () {
                if (quantityState > 0) {
                  quantityStateController.decrement();
                  widget.onRemoveQuentity?.call();
                }
              },
              radius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: SizedBox(
                height: double.infinity,
                child: Center(child: const Text('-').displayMedium),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(quantityState.toString()).displayMedium,
          ),
          Expanded(
              child: AppInkWell(
            onTap: () {
              quantityStateController.increment();
              widget.onAddQuentity?.call();
            },
            radius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: SizedBox(
              height: double.infinity,
              child: Center(child: const Text('+').displayMedium),
            ),
          )),
        ],
      ),
    );
  }
}
