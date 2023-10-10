import 'package:flutter/material.dart';
import 'package:repasse_anou/presentation/design_system/app_text_field.dart';
import 'package:repasse_anou/presentation/design_system/label_content.dart';
import 'package:repasse_anou/presentation/design_system/theme.dart';

class AddDressingModal extends StatelessWidget {
  const AddDressingModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(10),
          //   ),
          // ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 65,
                  ),
                  const LabelContent(
                    title: 'Intitulé',
                    child: AppTextField(
                      hint: 'C’est quoi son p’tit nom ? (ex. T-shirt noir)',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LabelContent(
                    title: 'Catégorie',
                    child: AppTextField(
                      hint: 'T-shirt, jupe, short...',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LabelContent(
                    title: 'Matière',
                    child: AppTextField(
                      hint: 'Coton, soie, laine...',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LabelContent(
                    title: 'Couleur',
                    child: AppTextField(
                      hint: 'Noir, blanc ou couleur',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LabelContent(
                    title: 'Appartient à',
                    child: AppTextField(
                      hint: 'Chacun son dressing, pas de jaloux ! ',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LabelContent(
                    title: 'Notes',
                    child: AppTextField(
                      hint:
                          'Une remarque spécifique à ajouter ? Du style : ⚠️ Déteint un max ! ⚠️',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Terminer').headlineLargeWhite,
                    ),
                  ),
                ],
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
                    image: NetworkImage("https://via.placeholder.com/158x158"),
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
                        child: Icon(
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
    );
  }
}
