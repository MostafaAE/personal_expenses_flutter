import 'package:flutter/material.dart';

import 'home.dart';
import 'utilities/constants.dart';

void main() => runApp(PersonalExpenses());

class PersonalExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Planner',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        highlightColor: kPrimaryColor,
        accentColor: kSecondaryColor,
        scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.dark().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.dark().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: HomePage(),
    );
  }
}
