import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function onSubmit;
  NewTransaction({required this.onSubmit});

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
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
          ),
          TextButton(
            child: Text(
              'Add Transaction',
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.deepPurple),
            ),
            onPressed: () {
              onSubmit(
                titleController.text,
                double.parse(amountController.text),
              );
            },
          ),
        ],
      ),
    );
  }
}
