import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../utilities/constants.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;
  TransactionList(
      {required this.userTransactions, required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions Added Yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 500,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: kBackgroundColor,
                  elevation: 5,
                  margin: EdgeInsets.all(
                    8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      userTransactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd().format(userTransactions[index].date),
                      style: kTxDateStyle,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () =>
                          deleteTransaction(userTransactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
