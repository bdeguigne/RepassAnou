import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/app_images.dart';
import 'package:repasse_anou/design_system/drop_down.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/label_content.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/dressing/application/dressing_filter_controller.dart';
import 'package:repasse_anou/features/dressing/data/dressing_belongs_to_repository.dart';
import 'package:repasse_anou/features/dressing/data/dressing_repository.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_filter.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';

class DressingFilterDrawer extends HookConsumerWidget {
  const DressingFilterDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<DressingCategory>> dressingCategories =
        ref.watch(dressingCategoriesProvider);
    final AsyncValue<List<DressingMaterial>> dressingMaterials =
        ref.watch(dressingMaterialsProvider);
    final AsyncValue<List<DressingColor>> dressingColors =
        ref.watch(dressingColorsProvider);

    final DressingFilter filter = ref.watch(dressingFilterControllerProvider);

    final selectedCategory = useState<DressingCategory?>(filter.category);
    final selectedMaterials =
        useState<List<DressingMaterial>>(filter.material ?? []);
    final selectedColor = useState<DressingColor?>(filter.color);

    final DropDownController<DressingCategory?> categoryFilterController =
        DropDownController();
    final DropDownController<DressingMaterial?> materialFilterController =
        DropDownController();

    bool isFilterModified() =>
        selectedCategory.value != null ||
        selectedMaterials.value.isNotEmpty ||
        selectedColor.value != null;

    void resetFilter() {
      selectedCategory.value = null;
      selectedMaterials.value = [];
      selectedColor.value = null;
      categoryFilterController.reset();
      materialFilterController.reset();
      ref.read(dressingFilterControllerProvider.notifier).resetFilter();
      ref.invalidate(usersDressingsBelongsToProvider);
    }

    void applyFilter() {
      ref.read(dressingFilterControllerProvider.notifier).setFilter(
            DressingFilter(
              category: selectedCategory.value,
              material: selectedMaterials.value,
              color: selectedColor.value,
            ),
          );
    }

    Widget handleColor(DressingColor color) {
      if (color.label == DressingColorLabels.black) {
        return Container(
          width: 22,
          height: 22,
          margin: const EdgeInsets.all(10),
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            color: Colors.black,
          ),
          child: selectedColor.value?.id == color.id
              ? Center(
                  child: AppIcons.checkWhite,
                )
              : Container(),
        );
      } else if (color.label == DressingColorLabels.white) {
        return Container(
          width: 22,
          height: 22,
          margin: const EdgeInsets.all(10),
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            color: Color(0xFFE4E4E4),
          ),
          child: selectedColor.value?.id == color.id
              ? Center(
                  child: AppIcons.check,
                )
              : Container(),
        );
      } else {
        return Container(
          width: 22,
          height: 22,
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: [
              AppImages.color,
              if (selectedColor.value?.id == color.id)
                Center(
                  child: AppIcons.check,
                ),
            ],
          ),
        );
      }
    }

    if (dressingCategories.isLoading ||
        dressingMaterials.isLoading ||
        dressingColors.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (dressingCategories.hasError ||
        dressingMaterials.hasError ||
        dressingColors.hasError) {
      return Center(
        child: const Text('Une erreur est survenue').bodyMedium,
      );
    }

    return Padding(
      padding: pwh(10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Filtrer').bodyLarge,
              AppButton.tertiary(
                text: 'Reinitialiser',
                onPressed: () => resetFilter(),
              ),
            ],
          ),
          sh(20),
          const Divider(
            color: Color.fromARGB(255, 231, 231, 231),
          ),
          sh(20),
          LabelContent(
            title: 'Catégorie',
            child: DropDown<DressingCategory?>.simple(
              controller: categoryFilterController,
              onChanged: (value) => selectedCategory.value = value,
              validator: (value) =>
                  value == null ? 'Veuillez sélectionner une catégorie' : null,
              hint: 'T-shirt, jupe, short...',
              value: selectedCategory.value,
              items: dressingCategories.value!
                  .map(
                    (category) => AppDropdownMenuItem<DressingCategory?>(
                      value: category,
                      label: category.label,
                    ),
                  )
                  .toList(),
            ),
          ),
          sh(10),
          LabelContent(
            title: 'Matière',
            child: DropDown<DressingMaterial?>.multiple(
              controller: materialFilterController,
              validator: (value) =>
                  value == null ? 'Veuillez sélectionner une matière' : null,
              onChanged: (value) => selectedMaterials.value =
                  value.whereType<DressingMaterial>().toList(),
              hint: 'Coton, soie, laine...',
              initialValues:
                  selectedMaterials.value.map((e) => e.label).toList(),
              items: dressingMaterials.value!
                  .map(
                    (category) => AppDropdownMenuItem<DressingMaterial?>(
                      value: category,
                      label: category.label,
                    ),
                  )
                  .toList(),
            ),
          ),
          sh(10),
          LabelContent(
            title: 'Couleur',
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: dressingColors.value!
                    .map(
                      (color) => AppInkWell(
                        onTap: () {
                          selectedColor.value = color;
                        },
                        child: handleColor(color),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const Spacer(),
          AppButton.primary(
            onPressed: isFilterModified() ? applyFilter : null,
            text: 'Appliquer',
            expanded: true,
          ),
        ],
      ),
    );
  }
}
