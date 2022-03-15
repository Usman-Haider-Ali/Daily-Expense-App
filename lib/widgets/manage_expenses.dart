import 'package:flutter/material.dart';

import '../models/expense_model.dart';
import 'add_expenses.dart';
import 'expenses_list.dart';

class ManageExpenses extends StatefulWidget {
  @override
  State<ManageExpenses> createState() => _ManageExpensesState();
}

class _ManageExpensesState extends State<ManageExpenses> {
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
    return Column(
      children: [
        AddExpenses(_addNewExpense),
        SizedBox(
          height: 4,
        ),
        ExpensesList(_expensesList),
      ],
    );
  }
}
