import 'package:flutter/material.dart';

import '../widgets/expenses_graph.dart';
import '../widgets/manage_expenses.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Personal Expenses'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin:  EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ExpensesGraph(),
                 SizedBox(
                  height: 4,
                ),
                 ManageExpenses(),
              ],
            ),
          ),
        ));
  }
}
