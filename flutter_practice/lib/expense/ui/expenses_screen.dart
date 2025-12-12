import 'package:flutter/material.dart';
import 'package:flutter_practice/expense/ui/text.dart';
import '../model/expense_model.dart';
import '../data/expense_data.dart';
import './expenses_list.dart';
// import './new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = initialExpenses;

  // void _addExpense(Expense expense) {
  //   setState(() {
  //     _registeredExpenses.add(expense);
  //   });
  // }

  // void _openAddExpenseOverlay() async {
  //   await showModalBottomSheet<Expense>(
  //     context: context,
  //     isScrollControlled:
  //         true, // Allows the modal to take full screen height if needed
  //     // builder: (ctx) => NewExpense(onAddExpense: _addExpense),
  //     builder: (ctx) => ExpenseForm(),
  //   );
  // }

  void onAddClicked(BuildContext context) async {
    Expense? newExpense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm()),
    );
    if (newExpense != null) {
      setState(() {
        _registeredExpenses.add(newExpense);
      });
    } else {
      print("created has been canceled");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 218, 253),
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => {onAddClicked(context)},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(height: 10),

            Expanded(
              // Expanded is required because ListView.builder needs bounded height
              child: ExpensesList(expenses: _registeredExpenses),
            ),
          ],
        ),
      ),
    );
  }
}
