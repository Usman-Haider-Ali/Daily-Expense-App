import 'package:flutter/material.dart';

class ExpensesGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Text(
          'Card for Chat',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
