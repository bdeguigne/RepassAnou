import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/shimmer.dart';
import 'package:repasse_anou/design_system/shimmer_loading.dart';

import 'package:repasse_anou/design_system/theme.dart';

enum AppLayoutType {
  title,
  searchBar,
}

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar._({
    Key? key,
    this.title,
    this.leadingWidth = 54.0,
    required this.type,
    this.searchHint,
    this.onSearchFieldChanged,
    this.isLoading = false,
    this.controller,
  }) : super(key: key);

  final String? title;
  final double? leadingWidth;
  final AppLayoutType type;
  final String? searchHint;
  final void Function(String? value)? onSearchFieldChanged;
  final bool isLoading;
  final TextEditingController? controller;

  factory AppAppBar.title(
    String title,
  ) {
    return AppAppBar._(
      title: title,
      leadingWidth: 54,
      type: AppLayoutType.title,
      isLoading: false,
    );
  }

  factory AppAppBar.searchBar({
    required String searchHint,
    void Function(String? value)? onSearchFieldChanged,
    bool isLoading = false,
    TextEditingController? controller,
  }) {
    return AppAppBar._(
      searchHint: searchHint,
      leadingWidth: 54,
      type: AppLayoutType.searchBar,
      onSearchFieldChanged: onSearchFieldChanged,
      isLoading: isLoading,
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: type == AppLayoutType.title
          ? Text(title!).headlineLarge
          : Padding(
              padding: const EdgeInsets.only(right: 24),
              child: AppTextField.filled(
                hint: searchHint!,
                prefixIcon: AppIcons.search,
                onChanged: onSearchFieldChanged,
                isSearchLoading: isLoading,
                controller: controller,
              ),
            ),
      leadingWidth: leadingWidth,
      titleSpacing: 0,
      leading: AppInkWell(
        transparent: true,
        onTap: () => Navigator.of(context).pop(),
        child: Center(child: AppIcons.arrowBack),
      ),
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

class AppLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final VoidCallback? onNavigateBack;
  final bool isLoading;
  final Widget? fabContent;
  final VoidCallback? onFabPressed;
  final Widget? bottomButton;
  final EdgeInsetsGeometry? padding;
  final bool scrollable;

  const AppLayout._({
    required this.child,
    super.key,
    this.appBar,
    this.onNavigateBack,
    this.isLoading = false,
    this.fabContent,
    this.onFabPressed,
    this.bottomButton,
    this.padding,
    this.scrollable = true,
  });

  factory AppLayout.standard({
    required Widget child,
    Key? key,
    PreferredSizeWidget? appBar,
    VoidCallback? onNavigateBack,
    bool isLoading = false,
    PreferredSizeWidget? customAppBar,
    Widget? fabContent,
    VoidCallback? onFabPressed,
    EdgeInsetsGeometry? padding,
    bool scrollable = true,
  }) {
    return AppLayout._(
      key: key,
      appBar: appBar,
      onNavigateBack: onNavigateBack,
      isLoading: isLoading,
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
    PreferredSizeWidget? appBar,
    VoidCallback? onNavigateBack,
    bool isLoading = false,
    PreferredSizeWidget? customAppBar,
    Widget? fabContent,
    VoidCallback? onFabPressed,
    EdgeInsetsGeometry? padding,
  }) {
    return AppLayout._(
      bottomButton: bottomButton,
      key: key,
      appBar: appBar,
      onNavigateBack: onNavigateBack,
      isLoading: isLoading,
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
      appBar: appBar,
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
