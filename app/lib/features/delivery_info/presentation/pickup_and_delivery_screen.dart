import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:repasse_anou/design_system/app_text_field.dart';
import 'package:repasse_anou/design_system/layouts.dart';

@RoutePage()
class PickupAndDeliveryScreen extends StatelessWidget {
  const PickupAndDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        title: 'Récupération & livraison',
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppTextField.filled(
                hint: 'Appartement, bureau ou étage',
              )
            ],
          ),
        ));
  }
}
