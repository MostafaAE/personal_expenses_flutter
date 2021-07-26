import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../utilities/constants.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionList({required this.userTransactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                  height: 200,
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
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}

// Row(
// children: [
// Container(
// margin:
// EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// padding: EdgeInsets.all(10),
// child: Text(
// '\$${userTransactions[index].amount.toStringAsFixed(2)}',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 22,
// color: kSecondaryColor,
// ),
// ),
// decoration: BoxDecoration(
// border: Border.all(
// color: kSecondaryColor,
// width: 2,
// ),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// userTransactions[index].title,
// style: Theme.of(context).textTheme.title,
// ),
// Text(
// DateFormat.yMMMEd()
// .format(userTransactions[index].date),
// style: kTxDateStyle,
// ),
// ],
// )
// ],
// ),
