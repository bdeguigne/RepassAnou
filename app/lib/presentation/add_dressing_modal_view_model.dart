// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/controllers/messenger_controller.dart';
import 'package:repasse_anou/data/dressing_service.dart';

import 'package:repasse_anou/shared/models/dressing_category/dressing_category.dart';
import 'package:repasse_anou/shared/models/dressing_color/dressing_color.dart';
import 'package:repasse_anou/shared/models/dressing_material/dressing_material.dart';

class AddDressingModalState {
  AddDressingModalState({
    this.selectedCategory,
    this.selectedMaterial,
    this.selectedColor,
    this.title,
    this.notes,
  });

  final String? title;
  final DressingCategory? selectedCategory;
  final DressingMaterial? selectedMaterial;
  final DressingColor? selectedColor;
  final String? notes;

  AddDressingModalState copyWith({
    String? title,
    DressingCategory? selectedCategory,
    DressingMaterial? selectedMaterial,
    DressingColor? selectedColor,
    String? notes,
  }) {
    return AddDressingModalState(
      title: title ?? this.title,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedMaterial: selectedMaterial ?? this.selectedMaterial,
      selectedColor: selectedColor ?? this.selectedColor,
      notes: notes ?? this.notes,
    );
  }
}

class AddDressingModalViewModel extends StateNotifier<AddDressingModalState> {
  AddDressingModalViewModel(
    this._dressingService,
    this._messengerController,
  ) : super(AddDressingModalState());

  final DressingService _dressingService;
  final MessengerController _messengerController;

  final formKey = GlobalKey<FormState>();

  void setTitle(String? title) {
    state = state.copyWith(title: title);
  }

  void setSelectedCategory(DressingCategory? selectedCategory) {
    state = state.copyWith(selectedCategory: selectedCategory);
  }

  void setSelectedMaterial(DressingMaterial? selectedMaterial) {
    state = state.copyWith(selectedMaterial: selectedMaterial);
  }

  void setSelectedColor(DressingColor? selectedColor) {
    state = state.copyWith(selectedColor: selectedColor);
  }

  void setNotes(String? notes) {
    state = state.copyWith(notes: notes);
  }

  void saveDressingItem() async {
    if (!formKey.currentState!.validate() ||
        state.selectedCategory == null ||
        state.selectedColor == null ||
        state.selectedMaterial == null ||
        state.title == null) return;

    final saveDressingRequest = await _dressingService.saveDressingItem(
      state.title!,
      state.selectedCategory!,
      state.selectedMaterial!,
      state.selectedColor!,
      null,
      state.notes,
    );

    saveDressingRequest.fold(
      (failure) => _messengerController.showErrorSnackbar(failure.message),
      (r) => print('OKOKOKOKOK'),
    );
  }
}

final addDressingModalViewModelProvider =
    StateNotifierProvider<AddDressingModalViewModel, AddDressingModalState>(
        (ref) {
  return AddDressingModalViewModel(
    ref.watch(dressingServiceProvider),
    ref.watch(messengerControllerProvider),
  );
});
