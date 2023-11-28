import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/theme.dart';

@RoutePage()
class PlanificationScreen extends StatelessWidget {
  const PlanificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout.standard(
      appBar: AppAppBar.title('Planification'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text('Récupération de votre linge').headlineMedium,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              children: [
                DateSelect(
                  date: DateTime.now(),
                  selected: true,
                ),
                const SizedBox(
                  width: 27,
                ),
                DateSelect(
                  date: DateTime.now().add(
                    const Duration(days: 1),
                  ),
                ),
                const SizedBox(
                  width: 27,
                ),
                DateSelect(
                  date: DateTime.now().add(
                    const Duration(days: 2),
                  ),
                ),
                const SizedBox(
                  width: 27,
                ),
                DateSelect(
                  date: DateTime.now().add(
                    const Duration(days: 3),
                  ),
                ),
                const SizedBox(
                  width: 27,
                ),
                DateSelect(
                  date: DateTime.now().add(
                    const Duration(days: 4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: RadioListTile<String>(
                value: 'value',
                groupValue: 'groupValue',
                onChanged: (value) {},
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('Entre 8h et 12h'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateSelect extends StatelessWidget {
  const DateSelect({
    super.key,
    required this.date,
    this.selected = false,
  });

  final DateTime date;
  final bool selected;

  String formaterWeekDay(DateTime date) {
    final DateFormat format = DateFormat('EEE', 'fr_FR');
    String jourAbrege = format.format(date).replaceAll('.', '');

    // Capitaliser la première lettre et ajouter le reste de la chaîne
    return jourAbrege[0].toUpperCase() + jourAbrege.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: selected ? Colors.black : greyButton,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date.day.toString(),
            style: headlineLarge.copyWith(
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          // day as letter (ex: M for Monday)
          Text(
            formaterWeekDay(date),
            style: bodyLarge.copyWith(
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
