import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../utilities/constants.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction({required this.addTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(BuildContext ctx) {
    final enteredTitle;
    final enteredAmount;

    try {
      enteredTitle = titleController.text;
      enteredAmount = double.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0) throw FormatException();
    } catch (e) {
      Alert(
        context: context,
        title: 'Invalid transaction data',
        desc: "Enter valid title and amount.",
      ).show();
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kDarkGrey,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: Theme.of(context).textTheme.title,
            ),
            controller: titleController,
            onSubmitted: (_) => submitData(context),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: Theme.of(context).textTheme.title,
            ),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(context),
          ),
          TextButton(
            child: Text('Add Transaction',
                style: Theme.of(context).textTheme.title),
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
