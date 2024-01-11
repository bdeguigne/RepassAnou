import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/cart/application/cart_service.dart';
import 'package:repasse_anou/features/commands/models/command_item.dart';

class QuantityButton extends ConsumerStatefulWidget {
  const QuantityButton({
    super.key,
    this.onAddQuentity,
    this.onRemoveQuentity,
    this.commandItem,
  });

  final CommandItem? commandItem;
  final VoidCallback? onAddQuentity;
  final VoidCallback? onRemoveQuentity;

  @override
  ConsumerState<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends ConsumerState<QuantityButton> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartServiceProvider);

    final quantity = cartData
        .where((element) => element.id == widget.commandItem?.id)
        .length;

    return Container(
      width: 70.w,
      height: 30.h,
      decoration: ShapeDecoration(
        color: AppColors.greyButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppInkWell(
              onTap: () {
                if (quantity > 0) {
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
            child: Text(quantity.toString()).displayMedium,
          ),
          Expanded(
              child: AppInkWell(
            onTap: () {
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
