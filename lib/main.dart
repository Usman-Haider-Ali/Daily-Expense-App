import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/models/expense_model.dart';
import 'package:intl/intl.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
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
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _addExpenses() {
    setState(() {
      expensesList.add(ExpenseModel(
        id: '963',
        amount: double.parse(amountController.text),
        title: titleController.text,
        date: DateTime.now(),
      ));
      titleController.clear();
      amountController.clear();
    });
  }

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
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            label: Text('Title'),
                            // border: OutlineInputBorder(),
                            hintText: 'Enter Title',
                          ),
                          controller: titleController,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            label: Text('Amount'),
                            // border: OutlineInputBorder(),
                            hintText: 'Enter Amount',
                          ),
                          controller: amountController,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            _addExpenses();
                            print(titleController.text);
                            print(amountController.text);
                          },
                          child: Text('Add Expense'),
                        ),
                      ]),
                ),
              ),
              (expensesList.length > 0)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: expensesList.map((expense) {
                        return Card(
                            child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  '${expense.amount}\$',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16),
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
                                    Text(
                                      DateFormat.yMMMd().format(expense.date),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                      }).toList(),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 32),
                      child: Text(
                        'Add and Manage Your Daily Life Expenses',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
