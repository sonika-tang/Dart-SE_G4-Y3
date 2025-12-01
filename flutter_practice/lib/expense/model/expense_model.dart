import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

var uuid = const Uuid();
final formatter = DateFormat.yMd();

enum ExpenseType { food, travel, leisure, work }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType type;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}
