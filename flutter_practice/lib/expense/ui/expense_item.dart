import 'package:flutter/material.dart';
import '../model/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                // Amount
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),

                // Icon and Date
                Row(
                  children: [
                    Icon(_getIcon(expense.type)),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(ExpenseType type) {
    switch (type) {
      case ExpenseType.food:
        return Icons.lunch_dining;
      case ExpenseType.travel:
        return Icons.flight_takeoff;
      case ExpenseType.leisure:
        return Icons.movie;
      case ExpenseType.work:
        return Icons.work;
    }
  }
}
