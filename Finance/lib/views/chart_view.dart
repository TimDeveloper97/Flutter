import 'package:finance/controls/chart/spending_breakdown.dart';
import 'package:flutter/material.dart';
import '../controls/chart/grouped_bar_chart.dart';
import '../controls/chart/timeline.dart';
import '../controls/home/bugget.dart';
import 'package:intl/intl.dart';
import '../shares/my_colors.dart';

late BuildContext _context;

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPage createState() => _ChartPage();
}

class _ChartPage extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Header Container
          Header(),

          //Body Container
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.only(top: 20),
              child: body(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget body() {
  return Container(
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: BudgetAccount('18600', '24800'),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, top: 20),
          height: MediaQuery.of(_context).size.height / 2.5,
          child: GroupedBarChart.withSampleData(),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        SpendingBreakdown(),
      ],
    ),
  );
}
