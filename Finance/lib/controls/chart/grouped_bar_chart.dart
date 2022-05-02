import 'package:charts_flutter/flutter.dart' hide TextStyle;
import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../models/ordinalMoney.dart';

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<OrdinalMoney, String>> seriesList;
  final bool animate;

  const GroupedBarChart({required this.seriesList, required this.animate});

  factory GroupedBarChart.withSampleData() {
    return GroupedBarChart(
      seriesList: _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(30),
        maxBarWidthPx: 10,
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalMoney, String>> _createSampleData() {
    final spendingData = [
      OrdinalMoney('Apr 22', 11508),
      OrdinalMoney('Apr 23', 12509),
      OrdinalMoney('Apr 24', 11007),
      OrdinalMoney('Apr 25', 13750),
      OrdinalMoney('Apr 26', 11875),
      OrdinalMoney('Apr 27', 20035),
      OrdinalMoney('Apr 28', 23753),
    ];

    final incomeData = [
      OrdinalMoney('Apr 22', 12253),
      OrdinalMoney('Apr 23', 17507),
      OrdinalMoney('Apr 24', 13100),
      OrdinalMoney('Apr 25', 21120),
      OrdinalMoney('Apr 26', 21120),
      OrdinalMoney('Apr 27', 46271),
      OrdinalMoney('Apr 28', 10278),
    ];

    return [
      charts.Series<OrdinalMoney, String>(
        id: 'Spending',
        domainFn: (OrdinalMoney sales, _) => sales.time,
        measureFn: (OrdinalMoney sales, _) => sales.money,
        colorFn: (OrdinalMoney sales, _) => charts.ColorUtil.fromDartColor(MyColors.blue),
        radiusPxFn: (OrdinalMoney sales, _) => 50,
        data: spendingData,
      ),
      charts.Series<OrdinalMoney, String>(
        id: 'Income',
        domainFn: (OrdinalMoney sales, _) => sales.time,
        measureFn: (OrdinalMoney sales, _) => sales.money,
        colorFn: (OrdinalMoney sales, _) => charts.ColorUtil.fromDartColor(Colors.green),
        data: incomeData,
      ),
    ];
  }
}
