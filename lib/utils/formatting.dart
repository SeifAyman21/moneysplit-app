import 'package:intl/intl.dart';

String formatCurrency(double value, String currency) {
  final f = NumberFormat('#,##0.00', 'en_US');
  return ' ';
}

String monthName(int month) {
  const names = [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  return names[month.clamp(1, 12)];
}

int monthIndex(String name) {
  const map = {
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12,
  };
  return map[name] ?? 1;
}
