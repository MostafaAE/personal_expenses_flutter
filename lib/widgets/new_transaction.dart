import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction({required this.addTx});

  void submitData(BuildContext ctx) {
    final enteredTitle;
    final enteredAmount;

    try {
      enteredTitle = titleController.text;
      enteredAmount = double.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0) throw FormatException();
    } catch (e) {
      Alert(
              context: ctx,
              title: 'Invalid transaction data',
              desc: "Enter valid title and amount.")
          .show();
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: titleController,
            onSubmitted: (_) => submitData(context),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(context),
          ),
          TextButton(
            child: Text(
              'Add Transaction',
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.deepPurple),
            ),
            onPressed: () => submitData(context),
          ),
        ],
      ),
    );
  }
}
