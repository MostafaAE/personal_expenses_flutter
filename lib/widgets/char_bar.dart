import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPct;

  ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.spendingPct});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              '\$$spendingAmount',
              style: kChartBarStyle,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  border: Border.all(
                    color: kBackgroundColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPct,
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    border: Border.all(
                      color: kBackgroundColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: kChartBarStyle,
        ),
      ],
    );
  }
}
