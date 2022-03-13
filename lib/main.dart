import 'package:flutter/material.dart';
import 'package:personal_expenses/models/expense_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<ExpenseModel> expensesList = [
    ExpenseModel(
      id: '123',
      title: 'Books',
      amount: 500.52,
      date: DateTime.now(),
    ),
    ExpenseModel(
      id: '456',
      title: 'Shoes',
      amount: 250.10,
      date: DateTime.now(),
    ),
    ExpenseModel(
      id: '789',
      title: 'Shirts',
      amount: 100.20,
      date: DateTime.now(),
    ),
    ExpenseModel(
      id: '159',
      title: 'Laptop',
      amount: 500.00,
      date: DateTime.now(),
    ),
    ExpenseModel(
      id: '987',
      title: 'Bag',
      amount: 30.14,
      date: DateTime.now(),
    ),
    ExpenseModel(
      id: '147',
      title: 'Pent',
      amount: 52.25,
      date: DateTime.now(),
    ),
    ExpenseModel(
      id: '852',
      title: 'Bottle',
      amount: 2.25,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Card for Chat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: expensesList.map((expense) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          expense.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          expense.amount.toString() + ' \$',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          expense.date.toString(),
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ));
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
