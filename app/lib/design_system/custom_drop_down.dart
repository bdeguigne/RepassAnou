import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/chip.dart';
import 'package:repasse_anou/design_system/drop_down.dart';
import 'package:repasse_anou/design_system/theme.dart';

enum CustomDropdownMode { single, multiple, input }

class CustomDropdown<T> extends StatefulWidget {
  final List<AppDropdownMenuItem<T>>? items;
  final T? initialValue;
  final List<T>? initialValues;
  final String Function(T item) selectedLabelBuilder;
  final CustomDropdownMode mode;
  final String? hint;
  final void Function(T?)? onChangedSingle;
  final void Function(List<T?>)? onChangedMultiple;
  final bool isError;
  final String? inputButtonText;
  final String? inputHint;
  final void Function(String)? onValidInputPressed;

  const CustomDropdown._({
    Key? key,
    required this.items,
    this.onChangedSingle,
    this.onChangedMultiple,
    this.initialValue,
    this.initialValues,
    required this.selectedLabelBuilder,
    this.mode = CustomDropdownMode.single,
    this.hint = 'Selectionner un élément',
    this.isError = false,
    this.inputButtonText,
    this.inputHint,
    this.onValidInputPressed,
  }) : super(key: key);

  factory CustomDropdown.single({
    required String Function(T item) selectedLabelBuilder,
    List<AppDropdownMenuItem<T>>? items,
    String hint = 'Selectionner un élément',
    T? initialValue,
    void Function(T?)? onChanged,
    bool isError = false,
    // void Function(T?)? onChanged,
    // String? Function(T?)? validator,
  }) {
    return CustomDropdown<T>._(
      // onChanged: onChanged,
      selectedLabelBuilder: selectedLabelBuilder,
      items: items,
      initialValue: initialValue,
      hint: hint,
      mode: CustomDropdownMode.single,
      onChangedSingle: onChanged,
      isError: isError,
      // validator: validator,
    );
  }

  factory CustomDropdown.multiple({
    required String Function(T item) selectedLabelBuilder,
    List<AppDropdownMenuItem<T>>? items,
    String hint = 'Selectionner un élément',
    List<T>? initialValues,
    void Function(List<T?>)? onChanged,
    bool isError = false,
    // void Function(T?)? onChanged,
    // String? Function(T?)? validator,
  }) {
    return CustomDropdown<T>._(
      // onChanged: onChanged,
      selectedLabelBuilder: selectedLabelBuilder,
      items: items,
      initialValues: initialValues,
      hint: hint,
      mode: CustomDropdownMode.multiple,
      onChangedMultiple: onChanged,
      isError: isError,
      // validator: validator,
    );
  }

  factory CustomDropdown.input({
    required String Function(T item) selectedLabelBuilder,
    List<AppDropdownMenuItem<T>>? items,
    String? hint,
    T? initialValue,
    bool isError = false,
    void Function(T?)? onChanged,
    String? inputButtonText,
    String? inputHint,
    void Function(String)? onValidInputPressed,
    // String? Function(T?)? validator,
  }) {
    return CustomDropdown<T>._(
      onChangedSingle: onChanged,
      selectedLabelBuilder: selectedLabelBuilder,
      items: items,
      initialValue: initialValue,
      hint: hint,
      mode: CustomDropdownMode.input,
      isError: isError,
      inputButtonText: inputButtonText,
      inputHint: inputHint,
      onValidInputPressed: onValidInputPressed,
      // validator: validator,
    );
  }

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _inputController = TextEditingController();

  FocusNode inputFocusNode = FocusNode();
  String? inputValidLabel;

  List<T> selectedValues = [];
  T? singleValue;

  @override
  void initState() {
    super.initState();

    if (widget.items != null) {
      _menuItems = widget.items!;
    }

    if (widget.mode == CustomDropdownMode.multiple) {
      if (widget.initialValues != null) {
        selectedValues = List.from(widget.initialValues!);
      }
    } else {
      singleValue = widget.initialValue;
    }

    _initAnimations();
  }

  void _initAnimations() {
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

  void _toggleSelection(T value) {
    setState(() {
      if (widget.mode == CustomDropdownMode.multiple) {
        if (selectedValues.contains(value)) {
          selectedValues.remove(value);
        } else {
          selectedValues.add(value);
        }
        widget.onChangedMultiple?.call(selectedValues);
      } else {
        // make sure to show the selected value in priority over the input value
        inputValidLabel = null;

        singleValue = value;
        _toggleDropdown(); // Fermer le menu si en mode de sélection unique
        widget.onChangedSingle?.call(value);
      }
    });
  }

  void _inputSelectionValid() {
    setState(() {
      inputValidLabel = _inputController.text;
    });
    _toggleDropdown();
    widget.onValidInputPressed?.call(_inputController.text);
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
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
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
          child: AppTextField.outlined(
            controller: _inputController,
            textInputAction: TextInputAction.done,
            hint: widget.inputHint ?? 'Entrez une valeur...',
            border: appOutlineTransparentInputBorder,
            focusNode: inputFocusNode,
          ),
        ),
        TextButton(
          onPressed: _inputSelectionValid,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              widget.inputButtonText ?? 'Valider',
              style: bodyMedium.copyWith(
                color: const Color(0xFF6E7590),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHint() {
    return Text(
      widget.hint ?? '',
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.hintText,
        fontFamily: 'Nunito',
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    const double padding = 18.0;

    List<Widget> menuContent = [
      if (widget.mode == CustomDropdownMode.input)
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
            if (item.value != null) {
              _toggleSelection(item.value as T);
            }
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
    return Form(
      key: _formKey,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          onTap: () {
            _toggleDropdown();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(isMenuOpen ? 0 : 20),
                bottomRight: Radius.circular(isMenuOpen ? 0 : 20),
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
              border: Border.all(
                color: widget.isError
                    ? Colors.red
                    : const Color(0xffDCE1EF), // Rouge si erreur
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.mode == CustomDropdownMode.multiple
                            ? 14
                            : 0),
                    scrollDirection: Axis.horizontal,
                    child: widget.mode == CustomDropdownMode.multiple
                        ? selectedValues.isEmpty
                            ? _buildHint()
                            : Row(
                                children: selectedValues.map((item) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: AppChip(
                                      label: widget.selectedLabelBuilder(
                                        item,
                                      ),
                                      onPressed: () => _toggleSelection(item),
                                    ),
                                  );
                                }).toList(),
                              )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: inputValidLabel != null
                                ? Text(inputValidLabel!)
                                : singleValue != null
                                    ? Text(widget
                                        .selectedLabelBuilder(singleValue as T))
                                    : _buildHint(),
                          ),
                  ),
                ),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 150),
                    turns: isMenuOpen ? 0.5 : 0.0, // 180 degrés de rotation
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff292D32),
                    ),
                  ),
                ),
              ],
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
