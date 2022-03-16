import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  final Function newExpHandler;

  AddExpenses(this.newExpHandler);

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _addNewExp() {
    String title = titleController.text;
    if (amountController.text.isEmpty) {
      return;
    }
    double amount = double.parse(amountController.text);
    if (title.isEmpty || amount.isNegative || amount.toString().isEmpty) {
      return;
    }
    widget.newExpHandler(
        titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            'Expense Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
              hintText: 'Enter Title',
            ),
            onSubmitted: (_) => _addNewExp(),
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
            onSubmitted: (_) => _addNewExp(),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          OutlinedButton(
            onPressed: () => _addNewExp(),
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
