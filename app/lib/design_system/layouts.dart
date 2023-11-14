import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/shimmer.dart';
import 'package:repasse_anou/design_system/shimmer_loading.dart';

import 'package:repasse_anou/design_system/theme.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    Key? key,
    this.title,
    this.leading,
    this.leadingWidth = 56.0,
    this.actions,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final double? leadingWidth;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      // leading: leading ??
      //     IconButton(
      //       icon: const Icon(
      //         Icons.arrow_back_ios_new,
      //         weight: 50,
      //         size: 30,
      //       ),
      //       onPressed: onNavigateBack ?? () => Navigator.of(context).pop(),
      //     ),
      // leadingWidth: 70,
      title: Text(title!.toUpperCase()).headlineLarge,
      leadingWidth: leadingWidth,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class LoggedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoggedAppBar({
    Key? key,
    this.address,
  }) : super(key: key);

  final String? address;
  final double _offset = 12;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Votre adresse').bodyMedium,
                Flexible(
                  child: Text(address ?? '22 Lot. Citronnelles').bodyLarge,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: _offset - 3),
                child: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: grey,
                ),
              ),
            ),
          ],
        ),
      ),
      toolbarHeight: AppBar().preferredSize.height + _offset,
      // title: Text(title!.toUpperCase()).headlineLarge,
      leadingWidth: double.infinity,
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: 20,
            top: 20,
            bottom: _offset,
          ),
          child: Container(
            width: 30,
            height: 30,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0x21000000),
                  blurRadius: 17,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/icons/bag.png',
                  width: 14,
                  height: 14,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + _offset);
}

class AppLayout extends StatelessWidget {
  const AppLayout({
    required this.child,
    super.key,
    this.title,
    this.onNavigateBack,
    this.leading,
    this.isLoading = false,
    this.customAppBar,
    this.fabContent,
    this.onFabPressed,
  });

  final String? title;
  final PreferredSizeWidget? customAppBar;
  final Widget child;
  final VoidCallback? onNavigateBack;
  final Widget? leading;
  final bool isLoading;
  final Widget? fabContent;
  final VoidCallback? onFabPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar ??
          (title != null
              ? AppAppBar(
                  leading: leading,
                  title: title,
                )
              : null),
      floatingActionButton: onFabPressed != null && fabContent != null
          ? FloatingActionButton(
              onPressed: onFabPressed,
              child: fabContent,
            )
          : null,
      body: SafeArea(
        child: Shimmer(
          linearGradient: shimmerGradient,
          child: Stack(
            children: [
              IgnorePointer(
                ignoring: isLoading,
                child: child,
              ),
              if (isLoading) ...[
                Container(
                  color: Colors.black.withOpacity(0.5), // Fond transparent noir
                  child: const Center(
                    child:
                        CircularProgressIndicator(), // Indicateur de progression
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// class AppLayoutWithBottomAction extends StatelessWidget {
//   const AppLayoutWithBottomAction({
//     super.key,
//     this.title,
//     this.actionLabel,
//     this.onActionPressed,
//     this.isActionLoading = false,
//     this.onNavigateBack,
//     this.leading,
//     this.crossAxisAlignment = CrossAxisAlignment.center,
//     this.actionWidth,
//     this.actionHeight,
//     this.actionPadding,
//     this.hideActionTextWhenLoading = false,
//     this.customAction,
//     this.onRefresh,
//     required this.child,
//   });

//   final String? title;
//   final Widget child;
//   final String? actionLabel;
//   final VoidCallback? onActionPressed;
//   final bool isActionLoading;
//   final bool hideActionTextWhenLoading;
//   final VoidCallback? onNavigateBack;
//   final Widget? leading;
//   final CrossAxisAlignment crossAxisAlignment;
//   final double? actionWidth;
//   final double? actionHeight;
//   final EdgeInsetsGeometry? actionPadding;
//   final Widget? customAction;
//   final Future<void> Function()? onRefresh;

//   @override
//   Widget build(BuildContext context) {
//     return AppLayout(
//       title: title,
//       onNavigateBack: onNavigateBack,
//       leading: leading,
//       child: onRefresh != null
//           ? RefreshIndicator(
//               onRefresh: onRefresh!,
//               child: buildContent(),
//             )
//           : buildContent(),
//     );
//   }

//   Widget buildContent() {
//     return CustomScrollView(
//       physics: const AlwaysScrollableScrollPhysics(),
//       slivers: [
//         SliverFillRemaining(
//           hasScrollBody: false,
//           child: Column(
//             crossAxisAlignment: crossAxisAlignment,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               Expanded(
//                 child: child,
//               ),
//               const SizedBox().medium(),
//               if (actionLabel != null && customAction == null) ...[
//                 Container(
//                   width: actionWidth,
//                   height: actionHeight,
//                   padding: actionPadding,
//                   child: AppSecondaryTextButton(
//                     text: actionLabel!,
//                     onPressed: onActionPressed,
//                     isLoading: isActionLoading,
//                     hideTextWhenLoading: hideActionTextWhenLoading,
//                     disabled: onActionPressed == null,
//                   ),
//                 ),
//               ],
//               if (customAction != null) ...[
//                 customAction!,
//               ],
//               const SizedBox().large(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

class AppCenteredLayout extends StatelessWidget {
  const AppCenteredLayout({
    super.key,
    this.backgroundColor,
    required this.child,
  });

  final Color? backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: SafeArea(
                child: Center(
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
