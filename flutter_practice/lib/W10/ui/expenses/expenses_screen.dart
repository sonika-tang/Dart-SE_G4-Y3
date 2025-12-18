import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_form.dart';
import 'expense_item.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void onAddClicked(BuildContext context) async {
    Expense? newExpense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm()),
    );
    if (newExpense != null) {
      setState(() {
        _expenses.add(newExpense);
      });
    } else {
      print("create has been canceled");
    }
  }

  // EX 2 & EX 5 - Remove expense with undo snackbar
  void _removeExpense(int index) {
    final removedExpense = _expenses[index];
    
    setState(() {
      _expenses.removeAt(index);
    });

    // Clear any existing snackbars
    ScaffoldMessenger.of(context).clearSnackBars();
    
    // Show snackbar with undo action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(index, removedExpense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _expenses.isEmpty
          // EX 5 - Empty list message
          ? Center(
              child: Text(
                'No expenses yet!\nAdd an expense to get started.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            )
          : ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                // EX 2 - Dismissible widget
                return Dismissible(
                  key: Key(_expenses[index].id), // Using expense id as unique key
                  onDismissed: (direction) {
                    _removeExpense(index);
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ExpenseItem(expense: _expenses[index]),
                );
              },
            ),
    );
  }
}