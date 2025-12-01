import '../model/expense_model.dart';

final List<Expense> initialExpenses = [
  Expense(
    title: 'Pizza dinner',
    amount: 14,
    date: DateTime(2025, 11, 20),
    type: ExpenseType.food,
  ),
  Expense(
    title: 'Gas',
    amount: 7,
    date: DateTime(2025, 11, 25),
    type: ExpenseType.travel,
  ),
  Expense(
    title: 'Icecream',
    amount: 2,
    date: DateTime(2025, 11, 26),
    type: ExpenseType.leisure,
  ),
  Expense(
    title: 'WalkStreet',
    amount: 20,
    date: DateTime(2025, 11, 27),
    type: ExpenseType.travel,
  ),
];
