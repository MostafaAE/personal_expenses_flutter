import 'package:flutter/material.dart';

import 'constants.dart';
import 'transaction.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(
          id: 'x1', title: 'New Shoes', amount: 69.69, date: DateTime.now()),
      Transaction(
          id: 'x2', title: 'New Hat', amount: 69.69, date: DateTime.now()),
      Transaction(
          id: 'x3', title: 'Groceries', amount: 69.69, date: DateTime.now()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.lightGreen,
            child: Text('CHART'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: transactions
                .map(
                  (tx) => Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            tx.amount.toString(),
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
                              tx.date.toString(),
                              style: kTxDateStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
