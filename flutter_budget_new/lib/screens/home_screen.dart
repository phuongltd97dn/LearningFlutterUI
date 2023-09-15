import 'package:flutter/material.dart';

import '../data/data.dart';
import '../helpers/color_helper.dart';
import '../models/category_model.dart';
import '../widgets/bar_chart.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.settings),
              iconSize: 30.0,
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Simple Budget'),
              centerTitle: true,
            ),
            forceElevated: true,
            expandedHeight: 100.0,
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6.0,
                          color: Colors.black12,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child: BarChart(expense: weeklySpending),
                  );
                } else {
                  final Category category = categories[index - 1];
                  final double totalAmountSpent = category.expenses.fold(
                    0,
                    (pre, e) => pre + e.cost,
                  );

                  return _buildCategory(category, totalAmountSpent);
                }
              },
              childCount: 1 + categories.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategory(Category category, double totalAmountSpent) {
    final double remainAmount = category.maxAmount - totalAmountSpent;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryScreen(category: category),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6.0,
              color: Colors.black12,
              offset: Offset(0, 2),
            )
          ],
          color: Colors.white,
        ),
        width: double.infinity,
        height: 100.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${remainAmount.toStringAsFixed(2)} / \$${category.maxAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            LayoutBuilder(
              builder: (context, constraints) {
                final double maxBarWidth = constraints.maxWidth;
                final double percent = remainAmount / category.maxAmount;
                double barWidth = percent * maxBarWidth;
                if (barWidth < 0) barWidth = 0;

                return Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: getColor(context, percent),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      width: barWidth,
                      height: 20.0,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
