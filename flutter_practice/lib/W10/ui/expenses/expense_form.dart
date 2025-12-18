import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // EX 3 - State for dropdown
  Category _selectedCategory = Category.food;

  // EX 4 - State for date picker
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormatter = DateFormat('dd/MM/yyyy');

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  // EX 4 - Date picker function
  Future<void> _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void onCreate() {
    // Validate inputs
    if (_titleController.text.isEmpty || _amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    String title = _titleController.text;
    double amount = double.parse(_amountController.text);

    // EX 3 - Use selected category instead of hardcoded
    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate, // EX 4 - Use selected date
      category: _selectedCategory,
    );
    Navigator.pop<Expense>(context, newExpense);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _amountController,
                      decoration: const InputDecoration(
                        prefixText: "\$",
                        label: Text("Value"),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    // EX 4 - Date Picker
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _dateFormatter.format(_selectedDate),
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.calendar_today, size: 20),
                            onPressed: _showDatePicker,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // EX 3 - Dropdown Button
          DropdownButton<Category>(
            value: _selectedCategory,
            isExpanded: true,
            items: Category.values.map((Category category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.name.toUpperCase()),
              );
            }).toList(),
            onChanged: (Category? newValue) {
              setState(() {
                _selectedCategory = newValue ?? Category.food;
              });
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text("Cancel")),
              ElevatedButton(
                onPressed: onCreate,
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
