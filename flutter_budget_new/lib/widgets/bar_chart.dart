import 'dart:math';

import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expense;

  const BarChart({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mostExp = expense.reduce(max);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 30.0,
                onPressed: () {},
              ),
              const Text(
                'Sep 13, 2023 - Sep 14, 2023',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  // letterSpacing: 1.2,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Bar(
                  label: 'Sun',
                  amountSpent: expense[0],
                  mostExpensive: mostExp),
              Bar(
                  label: 'Mon',
                  amountSpent: expense[1],
                  mostExpensive: mostExp),
              Bar(
                  label: 'Tue',
                  amountSpent: expense[2],
                  mostExpensive: mostExp),
              Bar(
                  label: 'Wed',
                  amountSpent: expense[3],
                  mostExpensive: mostExp),
              Bar(
                  label: 'Thu',
                  amountSpent: expense[4],
                  mostExpensive: mostExp),
              Bar(
                  label: 'Fri',
                  amountSpent: expense[5],
                  mostExpensive: mostExp),
              Bar(
                  label: 'Sat',
                  amountSpent: expense[6],
                  mostExpensive: mostExp),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;

  const Bar({
    Key? key,
    required this.label,
    required this.amountSpent,
    required this.mostExpensive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double barHeight = (amountSpent / mostExpensive) * _maxBarHeight;

    return Column(
      children: <Widget>[
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Theme.of(context).primaryColor,
          ),
          height: barHeight,
          width: 18.0,
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
