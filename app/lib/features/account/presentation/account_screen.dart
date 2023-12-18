import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repasse_anou/design_system/app_buttons.dart';
import 'package:repasse_anou/design_system/app_icons.dart';
import 'package:repasse_anou/design_system/app_images.dart';
import 'package:repasse_anou/design_system/ink_well.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/profile_cell.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/features/auth/application/user_controller.dart';

@RoutePage()
class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserController userController = ref.read(userControllerProvider.notifier);

    Widget buildProfilePicture() {
      return Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  backgroundImage: AppImages.defaultAvatar.image,
                ),
                sh(10),
                Text(
                  '${userController.loggedUser?.firstName} ${userController.loggedUser?.lastName}',
                  style: appTheme.textTheme.headlineLarge
                      ?.copyWith(fontFamily: 'Nunito'),
                ),
                Text(
                  '${userController.loggedUser?.email}',
                ).bodyMedium,
              ],
            ),
            Positioned(
              bottom: 0,
              right: -50,
              child: IconButton(onPressed: () {}, icon: AppIcons.edit),
            ),
          ],
        ),
      );
    }

    return AppLayout.withBottomButton(
      appBar: AppAppBar.title('Mon profil'),
      bottomButton: Padding(
        padding: ph(20),
        child: AppButton.secondary(
          text: 'Déconnexion',
          onPressed: () => userController.signOut(),
        ),
      ),
      child: Column(
        children: [
          sh(30),
          buildProfilePicture(),
          sh(15),
          ProfileCell(
            label: 'Mes commandes',
            route: '',
            icon: AppIcons.receiptText,
          ),
          ProfileCell(
            label: 'Messages',
            route: '',
            icon: AppIcons.messageCircle,
          ),
          ProfileCell(
            label: 'FAQ',
            route: '',
            icon: AppIcons.messageQuestion,
          ),
          // Condition general d'utilisation
          ProfileCell(
            label: "Condition Générales d'Utilisation",
            route: '',
            icon: AppIcons.shieldCross,
          ),
          // Nous contacter
          ProfileCell(
            label: 'Nous contacter',
            route: '',
            icon: AppIcons.message,
          ),
          ProfileCell(
            label: 'Changer de mot de passe',
            route: '',
            icon: AppIcons.lock,
          ),
        ],
      ),
    );
  }
}
