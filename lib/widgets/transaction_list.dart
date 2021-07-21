import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_flutter/models/transaction.dart';

import '../utilities/constants.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionList({required this.userTransactions});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: userTransactions
          .map(
            (tx) => Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${tx.amount}',
                      style: kTxAmountStyle,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: kTxTitleStyle,
                      ),
                      Text(
                        DateFormat.yMMMEd().format(tx.date),
                        style: kTxDateStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
