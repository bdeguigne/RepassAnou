import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/drop_down.dart';
import 'package:repasse_anou/design_system/label_content.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/dressing/application/add_dressing_modal_controller.dart';
import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/features/photo/presentation/rounded_photo_picker.dart';
import 'package:repasse_anou/utils/input_validator.dart';
import 'package:repasse_anou/utils/messenger_controller.dart';

class AddDressingModal extends HookConsumerWidget {
  AddDressingModal({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<DressingCategory>> dressingCategories =
        ref.watch(dressingCategoriesProvider);
    final AsyncValue<List<DressingColor>> dressingColors =
        ref.watch(dressingColorsProvider);
    final AsyncValue<List<DressingMaterial>> dressingMaterials =
        ref.watch(dressingMaterialsProvider);
    final AsyncValue<void> addDressingState =
        ref.watch(addDressingModalControllerProvider);

    final titleController = useTextEditingController();
    final belongsToController = useTextEditingController();
    final notesController = useTextEditingController();
    final selectedCategory = useState<DressingCategory?>(null);
    final selectedMaterial = useState<DressingMaterial?>(null);
    final selectedColor = useState<DressingColor?>(null);
    final imageTaken = useState<XFile?>(null);

    Future<void> saveDressingAndCloseModal() async {
      final success = await ref
          .read(addDressingModalControllerProvider.notifier)
          .saveDressingItem(
            titleController.text,
            selectedCategory.value!,
            selectedMaterial.value!,
            selectedColor.value!,
            belongsToController.text,
            notesController.text,
            File(imageTaken.value!.path),
          );

      if (success == true && context.mounted) {
        // ignore: unused_result
        ref.refresh(usersDressingsProvider);
        Navigator.pop(context);
      }
    }

    Widget buildContent() {
      if (dressingCategories.isLoading ||
          dressingColors.isLoading ||
          dressingMaterials.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (dressingCategories.hasError ||
          dressingColors.hasError ||
          dressingMaterials.hasError) {
        return Center(
          child: const Text('Une erreur est survenue').bodyMedium,
        );
      }
      return SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 65,
              ),
              LabelContent(
                title: 'Intitulé',
                child: AppTextField(
                  hint: 'C’est quoi son p’tit nom ? (ex. T-shirt noir)',
                  validator: InputValidator.notEmpty,
                  controller: titleController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              LabelContent(
                title: 'Catégorie',
                child: DropDown<DressingCategory?>(
                    onChanged: (value) => selectedCategory.value = value,
                    validator: (value) => value == null
                        ? 'Veuillez sélectionner une catégorie'
                        : null,
                    hint: 'T-shirt, jupe, short...',
                    value: selectedCategory.value?.label,
                    items: dressingCategories.value!
                        .map(
                          (category) => DropdownMenuItem<DressingCategory?>(
                            value: category,
                            child: Text(
                              category.label,
                              style: bodyMedium.copyWith(
                                color: const Color(0xff6E7590),
                              ),
                            ),
                          ),
                        )
                        .toList()),
              ),
              const SizedBox(
                height: 10,
              ),
              LabelContent(
                title: 'Matière',
                child: DropDown<DressingMaterial?>(
                  validator: (value) => value == null
                      ? 'Veuillez sélectionner une matière'
                      : null,
                  value: selectedMaterial.value?.label,
                  onChanged: (value) => selectedMaterial.value = value,
                  hint: 'Coton, soie, laine...',
                  items: dressingMaterials.value!
                      .map(
                        (category) => DropdownMenuItem<DressingMaterial?>(
                          value: category,
                          child: Text(
                            category.label,
                            style: bodyMedium.copyWith(
                              color: const Color(0xff6E7590),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              LabelContent(
                title: 'Couleur',
                child: DropDown<DressingColor?>(
                  onChanged: (value) => selectedColor.value = value,
                  validator: (value) => value == null
                      ? 'Veuillez sélectionner une couleur'
                      : null,
                  value: selectedColor.value?.label,
                  hint: 'Noir, blanc ou couleur',
                  items: dressingColors.value!
                      .map(
                        (category) => DropdownMenuItem<DressingColor?>(
                          value: category,
                          child: Text(
                            category.label,
                            style: bodyMedium.copyWith(
                              color: const Color(0xff6E7590),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              LabelContent(
                title: 'Appartient à',
                child: AppTextField(
                  hint: 'Chacun son dressing, pas de jaloux ! ',
                  controller: belongsToController,
                  // validator: InputValidator.notEmpty,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              LabelContent(
                title: 'Notes',
                child: AppTextField(
                  hint:
                      'Une remarque spécifique à ajouter ? Du style : ⚠️ Déteint un max ! ⚠️',
                  controller: notesController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (addDressingState.isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (imageTaken.value == null) {
                      ref
                          .read(messengerControllerProvider)
                          .showErrorSnackbar("L'image est obligatoire");
                    }
                    if (_formKey.currentState!.validate() &&
                        imageTaken.value != null) {
                      saveDressingAndCloseModal();
                    }
                  },
                  child: const Text('Terminer').headlineLargeWhite,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget buildPhoto() {
      return RoundedPhotoPicker(onImagePicked: (image) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          imageTaken.value = image;
        });
      });
    }

    return Stack(
      children: [
        Dialog(
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.70,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: buildContent(),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: buildPhoto(),
        )
      ],
    );
  }
}
