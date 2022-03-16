import 'package:flutter/material.dart';

import '../models/expense_model.dart';
import '../widgets/add_expenses.dart';
import '../widgets/expenses_graph.dart';
import '../widgets/expenses_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ExpenseModel> _expensesList = [
    ExpenseModel(
      id: '123',
      title: 'Books',
      amount: 56.52,
      date: DateTime.now(),
    ),
    ExpenseModel(
      id: '789',
      title: 'Shirts',
      amount: 26.20,
      date: DateTime.now(),
    ),
    ExpenseModel(
      id: '987',
      title: 'Bag',
      amount: 30.14,
      date: DateTime.now(),
    ),
    ExpenseModel(
      id: '852',
      title: 'Bottle',
      amount: 22.25,
      date: DateTime.now(),
    ),
  ];

  void _startAddNewExpense(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AddExpenses(_addNewExpense);
      },
    );
  }

  void _addNewExpense(String title, double amount) {
    final newExp = ExpenseModel(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _expensesList.add(newExp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
            onPressed: (() => _startAddNewExpense(context)),
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ExpensesGraph(),
              SizedBox(
                height: 4,
              ),
              ExpensesList(_expensesList),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => _startAddNewExpense(context)),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
