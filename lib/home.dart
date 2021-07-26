import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './utilities/constants.dart';
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.69, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Hat', amount: 69.69, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Groceries', amount: 69.69, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    final lastWeek = DateTime.now().subtract(Duration(days: 7));
    return _userTransactions.where((tx) {
      return tx.date.isAfter(lastWeek);
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount, DateTime txDate) {
    var newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: txDate);

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(addTx: _addTransaction);
      },
      backgroundColor: kDarkGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Planner'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: _startAddNewTransaction,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            Column(
              children: [
                TransactionList(
                  userTransactions: _userTransactions,
                  deleteTransaction: _deleteTransaction,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _startAddNewTransaction,
      ),
    );
  }
}
