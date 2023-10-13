import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/drop_down.dart';
import 'package:repasse_anou/design_system/label_content.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/dressing/application/dressing_categories_controller.dart';
import 'package:repasse_anou/features/dressing/application/dressing_colors_controller.dart';
import 'package:repasse_anou/features/dressing/application/dressing_materials_controller.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';
import 'package:repasse_anou/features/dressing/presentation/add_dressing_modal_controller.dart';
import 'package:repasse_anou/utils/input_validator.dart';

class AddDressingModal extends HookConsumerWidget {
  AddDressingModal({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final belongsToController = useTextEditingController();
    final notesController = useTextEditingController();
    final selectedCategory = useState<DressingCategory?>(null);
    final selectedMaterial = useState<DressingMaterial?>(null);
    final selectedColor = useState<DressingColor?>(null);

    final List<DressingCategory>? dressingCategories =
        ref.watch(dressingCategoriesControllerProvider);
    final List<DressingColor>? dressingColors =
        ref.watch(dressingColorsControllerProvider);
    final List<DressingMaterial>? dressingMaterials =
        ref.watch(dressingMaterialsControllerProvider);
    final AsyncValue<void> state =
        ref.watch(addDressingModalControllerProvider);

    return Center(
      child: Stack(
        children: [
          Dialog(
            alignment: Alignment.center,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: state.isLoading
                ? const CircularProgressIndicator()
                : Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: SingleChildScrollView(
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
                                hint:
                                    'C’est quoi son p’tit nom ? (ex. T-shirt noir)',
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
                                onChanged: (value) =>
                                    selectedCategory.value = value,
                                validator: (value) => value == null
                                    ? 'Veuillez sélectionner une catégorie'
                                    : null,
                                hint: 'T-shirt, jupe, short...',
                                items: dressingCategories
                                    ?.map(
                                      (category) =>
                                          DropdownMenuItem<DressingCategory?>(
                                        value: category,
                                        child: Text(category.label).bodyMedium,
                                      ),
                                    )
                                    .toList(),
                              ),
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
                                onChanged: (value) =>
                                    selectedMaterial.value = value,
                                hint: 'Coton, soie, laine...',
                                items: dressingMaterials
                                    ?.map(
                                      (category) =>
                                          DropdownMenuItem<DressingMaterial?>(
                                        value: category,
                                        child: Text(category.label).bodyMedium,
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
                                onChanged: (value) =>
                                    selectedColor.value = value,
                                validator: (value) => value == null
                                    ? 'Veuillez sélectionner une couleur'
                                    : null,
                                hint: 'Noir, blanc ou couleur',
                                items: dressingColors
                                    ?.map(
                                      (category) =>
                                          DropdownMenuItem<DressingColor?>(
                                        value: category,
                                        child: Text(category.label).bodyMedium,
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
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ref
                                        .read(addDressingModalControllerProvider
                                            .notifier)
                                        .saveDressingItem(
                                          titleController.text,
                                          selectedCategory.value!,
                                          selectedMaterial.value!,
                                          selectedColor.value!,
                                          belongsToController.text,
                                          notesController.text,
                                        );
                                  }
                                },
                                child:
                                    const Text('Terminer').headlineLargeWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  width: 158,
                  height: 158,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage('https://via.placeholder.com/158x158'),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(side: BorderSide(width: 4)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x26646464),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1D272F),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x4CA7AEC1),
                                blurRadius: 80,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
