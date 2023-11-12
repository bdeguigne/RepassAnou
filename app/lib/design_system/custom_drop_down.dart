import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/drop_down.dart';
import 'package:repasse_anou/design_system/theme.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<AppDropdownMenuItem<T>>? items;

  const CustomDropdown({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late AnimationController _menuAnimationController;
  late Animation<double> menuAnimation;
  bool isMenuOpen = false;
  late List<AppDropdownMenuItem<T>> _menuItems;
  bool showInput = false;
  FocusNode inputFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.items != null) {
      _menuItems = widget.items!;
    }
    _menuAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    menuAnimation = Tween(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: _menuAnimationController, curve: Curves.easeInOut),
    );
  }

  void _toggleDropdown() {
    if (isMenuOpen) {
      _menuAnimationController
          .reverse()
          .then((value) => _overlayEntry?.remove());
      setState(() {
        showInput = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      _menuAnimationController.forward();
    }
    isMenuOpen = !isMenuOpen;
  }

  void _changeMenuItems() {
    setState(() {
      showInput = true;
      inputFocusNode.requestFocus();
    });
    _rebuildOverlay();
  }

  void _rebuildOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildInput() {
    return Row(
      children: [
        Flexible(
          child: AppTextField(
            textInputAction: TextInputAction.done,
            hint: 'Nom du nouveau membre',
            border: false,
            focusNode: inputFocusNode,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Ajouter',
              style: bodyMedium.copyWith(
                color: const Color(0xFF6E7590),
              ),
            ),
          ),
        ),
      ],
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    const double padding = 18.0;

    List<Widget> menuContent = [
      GestureDetector(
        onTap: _changeMenuItems,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              height: 32,
              child: TextButton(
                onPressed: () {
                  _changeMenuItems();
                },
                // Style du bouton
                child: Text(
                  '+ Ajouter un membre',
                  style: bodyMedium.copyWith(
                    color: const Color(0xFF6E7590),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      ..._menuItems.map((item) {
        return InkWell(
          onTap: () {
            // ... logique de sélection de l'élément
          },
          child: ListTile(
            visualDensity: const VisualDensity(vertical: -2),
            dense: true,
            title: Text(
              item.label,
              style: bodyMedium.copyWith(
                color: const Color(0xff6E7590),
              ),
            ),
          ),
        );
      }).toList(),
    ];

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _toggleDropdown,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors
                    .transparent, // Transparent pour détecter les taps en dehors du menu
              ),
            ),
            Positioned(
              width: size.width + (padding * 2),
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(-padding, size.height - (padding)),
                child: SizeTransition(
                  sizeFactor: menuAnimation,
                  axis: Axis.vertical,
                  axisAlignment: -1,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      padding,
                    ),
                    child: Material(
                      elevation: 7,
                      shadowColor: Colors.black.withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: showInput ? [_buildInput()] : menuContent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            border: Border.fromBorderSide(
              BorderSide(
                color: Color(0xffDCE1EF),
              ),
            ),
          ),
          // Style your dropdown button here
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 14),
              child: Text(
                'Ouvrir',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: hintText,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.dispose();
    _menuAnimationController.dispose();
    super.dispose();
  }
}
