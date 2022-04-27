import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0", "en_US");

class BudgetAccount extends StatefulWidget {
  final String _spending;
  final String _income;
  late double _width;
  late double _height;

  BudgetAccount(this._spending, this._income, {Key? key}) : super(key: key);

  @override
  _BudgetAccount createState() => _BudgetAccount();
}

class _BudgetAccount extends State<BudgetAccount> {
  @override
  Widget build(BuildContext context) {
    widget._width = MediaQuery.of(context).size.width / 2 - 50;
    widget._height = 60;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widget._width,
          child: itemView(
              const Icon(
                Icons.arrow_downward_outlined,
                color: MyColors.blue,
                size: 36,
              ),
              'Spending',
              widget._spending),
        ),
        const SizedBox(
          width: 0.5,
        ),
        SizedBox(
          width: widget._width,
          child: itemView(
              const Icon(
                Icons.arrow_upward_outlined,
                color: MyColors.primary,
                size: 36,
              ),
              'Income',
              widget._income),
        ),
      ],
    );
  }
}

Widget itemView(Icon icon, String title, String des) {
  return Row(
    children: [
      Container(
        width: 60,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: icon.color?.withOpacity(0.3),
          border: Border.all(color: Colors.grey.withOpacity(0.05), width: 2),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: icon,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Align(
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: MyColors.gray.withOpacity(0.7),
                fontSize: 18,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'VND',
                  style: TextStyle(
                    color: MyColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 2)),
                Text(
                  oCcy.format(int.parse(des)),
                  style: const TextStyle(
                    color: MyColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ],
  );
}
