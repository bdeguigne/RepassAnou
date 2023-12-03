import 'package:intl/intl.dart';

String formaterWeekDay(DateTime date) {
  final DateFormat format = DateFormat('EEE', 'fr_FR');
  String jourAbrege = format.format(date).replaceAll('.', '');

  // Capitaliser la première lettre et ajouter le reste de la chaîne
  return jourAbrege[0].toUpperCase() + jourAbrege.substring(1);
}
