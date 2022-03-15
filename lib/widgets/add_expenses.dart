import 'package:flutter/material.dart';

class AddExpenses extends StatelessWidget {
  final Function newExpHandler;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  AddExpenses(this.newExpHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
              hintText: 'Enter Title',
            ),
            controller: titleController,
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('Amount'),
              border: OutlineInputBorder(),
              hintText: 'Enter Amount',
            ),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(),
          ),
          SizedBox(
            height: 4,
          ),
          OutlinedButton(
            onPressed: () => newExpHandler(
                titleController.text, double.parse(amountController.text)),
            child: Text(
              'Add Expense',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
