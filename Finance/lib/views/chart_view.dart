import 'package:finance/controls/chart/spending_breakdown.dart';
import 'package:flutter/material.dart';
import '../controls/chart/grouped_bar_chart.dart';
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

class Header extends StatefulWidget {
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();

  @override
  State<StatefulWidget> createState() => _Header();
}

class _Header extends State<Header> {
  String dropdownValue = '1 Month';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30,20,30,10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${DateTime.now().year}',
                  style: TextStyle(
                    fontSize: 16,
                    color: MyColors.gray.withOpacity(0.8),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      DateFormat('MMM dd').format(widget.start),
                      style: const TextStyle(
                        fontSize: 22,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat(' - MMM dd').format(widget.end),
                      style: const TextStyle(
                        fontSize: 22,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 150,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    fillColor: MyColors.gray.withOpacity(0.1),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: MyColors.gray.withOpacity(0.2))),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: MyColors.gray.withOpacity(0.2))),
                    contentPadding:
                        const EdgeInsets.only(bottom: 5.0, top: 5.0, left: 10.0, right: 10.0),
                  ),
                  value: dropdownValue,
                  items: ['1 Month', '2 Month', '6 Month', '1 Year', '2 Year']
                      .map((label) => DropdownMenuItem(
                            child: Text(label.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, color: MyColors.primary)),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }
}

Widget body() {
  return Container(
    child: Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 10)),
        BudgetAccount('18600', '24800'),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: MediaQuery.of(_context).size.height / 2.5,
          child: GroupedBarChart.withSampleData(),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        SpendingBreakdown(),
      ],
    ),
  );
}

