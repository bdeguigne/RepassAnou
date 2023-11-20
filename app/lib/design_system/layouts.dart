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
      centerTitle: false,
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
      title: Text(title!).headlineLarge,
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
    required this.child,
    this.actions,
  }) : super(key: key);

  final String? address;
  final double _offset = 12;
  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: child,
      ),
      toolbarHeight: AppBar().preferredSize.height + _offset,
      // title: Text(title!.toUpperCase()).headlineLarge,
      leadingWidth: double.infinity,
      actions: actions != null
          ? [
              Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  top: 20,
                  bottom: _offset,
                ),
                child: Row(
                  children: actions!,
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + _offset);
}

// class AppLayout extends StatelessWidget {
//   const AppLayout.standard({
//     required this.child,
//     super.key,
//     this.title,
//     this.onNavigateBack,
//     this.leading,
//     this.isLoading = false,
//     this.customAppBar,
//     this.fabContent,
//     this.onFabPressed,
//   });

// final String? title;
// final PreferredSizeWidget? customAppBar;
// final Widget child;
// final VoidCallback? onNavigateBack;
// final Widget? leading;
// final bool isLoading;
// final Widget? fabContent;
// final VoidCallback? onFabPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: customAppBar ??
//           (title != null
//               ? AppAppBar(
//                   leading: leading,
//                   title: title,
//                 )
//               : null),
//       floatingActionButton: onFabPressed != null && fabContent != null
//           ? FloatingActionButton(
//               onPressed: onFabPressed,
//               child: fabContent,
//             )
//           : null,
//       body: SafeArea(
//         child: Shimmer(
//           linearGradient: shimmerGradient,
//           child: Stack(
//             children: [
//               IgnorePointer(
//                 ignoring: isLoading,
//                 child: child,
//               ),
//               if (isLoading) ...[
//                 Container(
//                   color: Colors.black.withOpacity(0.5), // Fond transparent noir
//                   child: const Center(
//                     child:
//                         CircularProgressIndicator(), // Indicateur de progression
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class AppLayout extends StatelessWidget {
  final String? title;
  final PreferredSizeWidget? customAppBar;
  final Widget child;
  final VoidCallback? onNavigateBack;
  final Widget? leading;
  final bool isLoading;
  final Widget? fabContent;
  final VoidCallback? onFabPressed;
  final Widget? bottomButton;
  final EdgeInsetsGeometry? padding;
  final bool scrollable;

  const AppLayout._({
    required this.child,
    super.key,
    this.title,
    this.onNavigateBack,
    this.leading,
    this.isLoading = false,
    this.customAppBar,
    this.fabContent,
    this.onFabPressed,
    this.bottomButton,
    this.padding,
    this.scrollable = true,
  });

  factory AppLayout.standard({
    required Widget child,
    Key? key,
    String? title,
    VoidCallback? onNavigateBack,
    Widget? leading,
    bool isLoading = false,
    PreferredSizeWidget? customAppBar,
    Widget? fabContent,
    VoidCallback? onFabPressed,
    EdgeInsetsGeometry? padding,
    bool scrollable = true,
  }) {
    return AppLayout._(
      key: key,
      title: title,
      onNavigateBack: onNavigateBack,
      leading: leading,
      isLoading: isLoading,
      customAppBar: customAppBar,
      fabContent: fabContent,
      onFabPressed: onFabPressed,
      padding: padding,
      scrollable: scrollable,
      child: child,
    );
  }

  factory AppLayout.withBottomButton({
    required Widget child,
    required Widget bottomButton,
    Key? key,
    String? title,
    VoidCallback? onNavigateBack,
    Widget? leading,
    bool isLoading = false,
    PreferredSizeWidget? customAppBar,
    Widget? fabContent,
    VoidCallback? onFabPressed,
    EdgeInsetsGeometry? padding,
  }) {
    return AppLayout._(
      bottomButton: bottomButton,
      key: key,
      title: title,
      onNavigateBack: onNavigateBack,
      leading: leading,
      isLoading: isLoading,
      customAppBar: customAppBar,
      fabContent: fabContent,
      onFabPressed: onFabPressed,
      padding: padding,
      child: child,
    );
  }

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
        child: Stack(
          children: [
            Shimmer(
              linearGradient: shimmerGradient,
              child: LayoutBuilder(builder: (context, constraints) {
                Widget content = scrollable
                    ? SingleChildScrollView(
                        child: _buildScrollableContent(constraints),
                      )
                    : _buildNonScrollableContent();

                return content;
              }),
            ),
            if (isLoading) ...[
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableContent(BoxConstraints constraints) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: constraints.maxHeight),
      child: IntrinsicHeight(
        child: _buildContentColumn(),
      ),
    );
  }

  Widget _buildNonScrollableContent() {
    return _buildContentColumn();
  }

  Column _buildContentColumn() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: IgnorePointer(
            ignoring: isLoading,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(0),
              child: child,
            ),
          ),
        ),
        if (bottomButton != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(0),
              child: bottomButton,
            ),
          ),
      ],
    );
  }
}

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
