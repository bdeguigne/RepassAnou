import 'package:flutter/widgets.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';

// add spacing between widgets in a column or row except the last one

class ColumnSpacing extends StatelessWidget {
  final List<Widget> children;
  final int spacing;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  const ColumnSpacing({
    Key? key,
    required this.children,
    this.spacing = 10,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spacedChildren =
        children.expand((widget) => [widget, sh(spacing.toDouble())]).toList();

    if (spacedChildren.isNotEmpty) {
      spacedChildren.removeLast();
    }

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}

class RowSpacing extends StatelessWidget {
  final List<Widget> children;
  final int spacing;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  const RowSpacing({
    Key? key,
    required this.children,
    this.spacing = 10,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spacedChildren =
        children.expand((widget) => [widget, sw(spacing.toDouble())]).toList();

    if (spacedChildren.isNotEmpty) {
      spacedChildren.removeLast();
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}
