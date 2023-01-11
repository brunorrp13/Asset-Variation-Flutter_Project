import 'package:flutter/material.dart';

class DayItem extends StatelessWidget {
  final String day;
  final String date;
  final String amount;
  final String dOneVariation;
  final String firstDayVariation;

  const DayItem(
      {super.key,
      required this.day,
      required this.date,
      required this.amount,
      required this.dOneVariation,
      required this.firstDayVariation});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 22,
      children: [
        Text(day),
        Text(date),
        Text(amount),
        Text(dOneVariation),
        Text(firstDayVariation),
      ],
    );
  }
}
