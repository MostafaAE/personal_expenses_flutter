import 'package:flutter/material.dart';
import 'package:personal_expenses_flutter/widgets/user_transactions.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.lightGreen,
              child: Text('CHART'),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
