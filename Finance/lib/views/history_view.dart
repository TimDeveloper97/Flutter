import 'package:flutter/material.dart';
import '../controls/chart/timeline.dart';
import '../controls/home/bugget.dart';
import '../controls/home/transaction_view.dart';
import '../shares/my_colors.dart';

late BuildContext _context;
final tabs = [
  'All',
  'Income',
  'Expense',
];

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Header Container
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 20, left: 30),
                child: const Text(
                  'Transactions History',
                  style: TextStyle(
                    color: MyColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Header(),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: BudgetAccount('18600', '24800'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Divider(),
              )
            ],
          ),

          //Body Container
          body(),
        ],
      ),
    );
  }
}

Widget body() {
  return Container(
    padding: const EdgeInsets.only(right: 10, left: 10),
    child: tabSection(_context),
  );
}

Widget tabSection(BuildContext context) {
  return DefaultTabController(
    length: tabs.length,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: TabBar(
            tabs: [
              for (final tab in tabs) Tab(text: tab),
            ],
            unselectedLabelColor: MyColors.gray.withOpacity(0.8),
            indicatorColor: MyColors.whiteSmoke,
            labelColor: MyColors.primary,
            labelStyle: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 0.1,
            isScrollable: true,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 400,
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: TabBarView(children: [
            tabAll(),
            tabIncome(),
            tabExpense(),
          ]),
        )
      ],
    ),
  );
}

Widget tabAll() {
  return TransactionView(numberItemShow: 10);
}

Widget tabIncome() {
  return Container(
    color: Colors.red,
  );
}

Widget tabExpense() {
  return Container(
    color: Colors.green,
  );
}
