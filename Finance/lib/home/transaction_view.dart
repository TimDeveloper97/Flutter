import 'package:finance/models/transaction.dart';
import 'package:flutter/material.dart';
import '../icons/my_flutter_app_icons.dart';
import '../shares/my_colors.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0", "en_US");

class TransactionView extends StatefulWidget {
  TransactionView({Key? key}) : super(key: key);
  List<Transaction> _transactions = [];

  @override
  _TransactionView createState() => _TransactionView();
}

class _TransactionView extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Transactions',
                style: TextStyle(
                  color: MyColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () { print('see all click'); },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: MyColors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        ListView.builder(
          itemCount: widget._transactions.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = widget._transactions[index];
            return itemView(
                item.icon,
                item.title,
                item.description,
                item.money);
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    widget._transactions = [
      Transaction(const Icon(
        Icons.work,
        color: Colors.green,
        size: 25,
      ),'Freelance Work', 'Apr 28', '26000'),
      Transaction(const Icon(
        Icons.fastfood,
        color: Colors.amber,
        size: 25,
      ),'Food & Baverages', 'Apr 26', '48000'),
      Transaction(const Icon(
        MyFlutterApp.dropbox,
        color: Colors.indigo,
        size: 25,
      ),'Dropbox', 'Next payment 28 May 2019', '26999'),
    ];
  }
}

Widget itemView(Icon icon, String title, String des, String money) {
  return Row(
    children: [
      Container(
        width: 47,
        height: 47,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: icon.color?.withOpacity(0.3),
          border: Border.all(color: Colors.grey.withOpacity(0.05), width: 2),
        ),
        child: Align(
          alignment: Alignment.center,
          child: icon,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Expanded(
        child: Align(
          alignment: Alignment.topRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
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
                          oCcy.format(int.parse(money)),
                          style: const TextStyle(
                            color: MyColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 5)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  des,
                  style: TextStyle(
                    color: MyColors.gray.withOpacity(0.7),
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}
