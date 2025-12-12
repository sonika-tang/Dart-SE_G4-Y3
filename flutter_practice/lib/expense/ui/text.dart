import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_practice/expense/data/expense_data.dart';
import 'package:flutter_practice/expense/model/expense_model.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();


  void onCreate() {
    Expense newExpense = Expense(
      title: _titleController.text,
      amount: double.parse(_valueController.text),
      date: DateTime.now(),
      type: ExpenseType.food,
    );
    Navigator.pop<Expense>(context, newExpense);
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose;
    _valueController.dispose;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Text'),
            maxLength: 50,
          ),

          TextField(
            controller: _valueController,
            decoration: InputDecoration(prefixText: "\$", label: Text("Value")),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLength: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              SizedBox(width: 10),
              ElevatedButton(onPressed: onCreate, child: Text("Create")),
            ],
          ),
        ],
      ),
    );
  }
}
