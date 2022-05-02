import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';
import '../../icons/my_flutter_app_icons.dart';
import '../../models/transaction.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0", "en_US");

class SpendingBreakdown extends StatefulWidget {
  SpendingBreakdown({Key? key}) : super(key: key);

  List<Transaction> _transactions = [];

  @override
  _SpendingBreakdownState createState() => _SpendingBreakdownState();
}

class _SpendingBreakdownState extends State<SpendingBreakdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, bottom: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Spending Breakdown',
              style: TextStyle(
                color: MyColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        slider(MediaQuery.of(context).size.width - 100, 20, widget._transactions),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 25,
              mainAxisExtent: 50, // height
            ),
            itemCount: widget._transactions.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: cardItem(widget._transactions[index]),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    widget._transactions = [
      Transaction(
          const Icon(
            Icons.work,
            color: Colors.green,
            size: 25,
          ),
          'Freelance Work',
          'Apr 28',
          '26000'),
      Transaction(
          const Icon(
            Icons.fastfood,
            color: Colors.amber,
            size: 25,
          ),
          'Food & Baverages',
          'Apr 26',
          '48000'),
      Transaction(
          const Icon(
            MyFlutterApp.dropbox,
            color: Colors.indigo,
            size: 25,
          ),
          'Dropbox',
          'Next payment 28 May 2019',
          '26999'),
      Transaction(
          const Icon(
            MyFlutterApp.xbox,
            color: Colors.deepOrangeAccent,
            size: 25,
          ),
          'XBox',
          'Apr 28',
          '11000'),
      Transaction(
          const Icon(
            MyFlutterApp.spotify,
            color: MyColors.violet,
            size: 25,
          ),
          'Spotify',
          'Apr 26',
          '67110'),
      Transaction(
          const Icon(
            Icons.more_horiz,
            color: Colors.grey,
            size: 25,
          ),
          'Other',
          'Next payment 28 May 2019',
          '19020'),
    ];
  }
}

Widget slider(double width, double height, List<Transaction> transactions) {
  double total = 0.0;
  for (var item in transactions) {
    total += double.parse(item.money);
  }

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (var item in transactions)
        Container(
          width: (double.parse(item.money) / total) * width,
          height: height,
          color: item.icon.color,
        )
    ],
  );
}

Widget cardItem(Transaction transaction) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.topLeft,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: transaction.icon.color?.withOpacity(0.3),
          border: Border.all(color: Colors.grey.withOpacity(0.05), width: 2),
        ),
        child: Align(
          alignment: Alignment.center,
          child: transaction.icon,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    transaction.title,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                      color: MyColors.gray.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'VND',
                    style: TextStyle(
                      color: MyColors.primary,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 2)),
                  Text(
                    oCcy.format(int.parse(transaction.money)),
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
