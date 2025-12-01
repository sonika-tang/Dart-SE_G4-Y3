import 'package:flutter/material.dart';
import '../model/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  ExpenseType _selectedCategory = ExpenseType.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    // showDatePicker returns a Future, so we use async/await
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: 'Title'),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                ),
              ),
              const SizedBox(width: 16),

              //Date Picker
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : _selectedDate!.toLocal().toString().split(' ')[0],
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              //Category Dropdown
              DropdownButton(
                value: _selectedCategory,
                items: ExpenseType.values
                    .map(
                      (type) => DropdownMenuItem(
                        value: type,
                        child: Text(type.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),

              const Spacer(),

              //Action Buttons
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),

              ElevatedButton(
                onPressed: () {
                  final enteredAmount = double.tryParse(_amountController.text);
                  final amountIsInvalid =
                      enteredAmount == null || enteredAmount <= 0;

                  if (_titleController.text.trim().isEmpty ||
                      amountIsInvalid ||
                      _selectedDate == null) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Invalid Input'),
                        content: const Text(
                          'Please ensure a valid title, amount, and date were entered.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Okay'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  final newExpense = Expense(
                    title: _titleController.text,
                    amount: enteredAmount,
                    date: _selectedDate!,
                    type: _selectedCategory,
                  );

                  widget.onAddExpense(newExpense);
                  Navigator.pop(context);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
