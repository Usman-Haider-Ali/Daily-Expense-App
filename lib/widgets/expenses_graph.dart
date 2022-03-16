import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/expense_model.dart';

class ExpensesGraph extends StatelessWidget {
  final List<ExpenseModel> _recentExpensesList;
  ExpensesGraph(this._recentExpensesList);

  List<Map<String, Object>> get groupedExpensesValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum;
      for (var i = 0; i < _recentExpensesList.length; i++) {
        if (_recentExpensesList[i].date.day == weekDay.day &&
            _recentExpensesList[i].date.month == weekDay.month &&
            _recentExpensesList[i].date.year == weekDay.year) {
          totalSum += _recentExpensesList[i].amount;
        }
      }
      return {'day': DateFormat.E(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
