import 'package:finance/home/percent_indicator.dart';
import 'package:finance/models/budget.dart';
import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../icons/my_flutter_app_icons.dart';

final oCcy = NumberFormat("#,##0", "en_US");
late BuildContext _context;

class CardBudgetSlider extends StatefulWidget {
  CardBudgetSlider({Key? key}) : super(key: key);

  late int _index;
  List<Budget> _budgetCards = [];

  @override
  _CardBudgetSliderState createState() => _CardBudgetSliderState();
}

class _CardBudgetSliderState extends State<CardBudgetSlider> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 50, bottom: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Monthly Budget',
              style: TextStyle(
                color: MyColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 350, // card height
          child: PageView.builder(
            itemCount: widget._budgetCards.length,
            scrollDirection: Axis.horizontal,
            controller: PageController(viewportFraction: 0.75),
            onPageChanged: (int index) => setState(() => widget._index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == widget._index ? 1 : 0.9,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      widget._index == i
                          ? Image.asset(
                              'assets/images/budget.jpeg',
                              fit: BoxFit.fill,
                              color: Colors.white.withOpacity(0.8),
                              colorBlendMode: BlendMode.modulate,
                            )
                          : Container(
                              color: MyColors.gray,
                            ),
                      cardView(widget._budgetCards[i]),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    widget._index = 0;

    widget._budgetCards = [
      Budget(
          'Transportation',
          'Your transportation budget on a good condition',
          'AVG spent (VND)30,000 a week',
          64,
          120,
          const Icon(
            Icons.directions_car,
            color: Colors.blue,
            size: 40,
          ),
          const Icon(
            MyFlutterApp.thumbs_up,
            color: Colors.indigo,
            size: 15,
          )),
      Budget(
          'Shopping',
          'Your shopping budget on a great condition',
          'AVG spent (VND)100,000 a week',
          468,
          520,
          const Icon(
            Icons.shopping_bag,
            color: Colors.pinkAccent,
            size: 40,
          ),
          const Icon(
            MyFlutterApp.emo_happy,
            color: Colors.amber,
            size: 15,
          )),
      Budget(
          'Electricity',
          'Your electricity budget on a bad condition',
          'AVG spent (VND)320,000 a week',
          568,
          620,
          const Icon(
            Icons.lightbulb,
            color: Colors.lime,
            size: 40,
          ),
          const Icon(
            MyFlutterApp.heart,
            color: Colors.red,
            size: 15,
          )),
    ];
  }
}

Widget cardView(Budget budget) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.more_horiz, size: 35, color: Colors.grey),
            splashRadius: 20,
            padding: const EdgeInsets.only(bottom: 5),
            onPressed: () {},
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: budget.iconTitle.color?.withOpacity(0.3),
                border: Border.all(color: Colors.grey.withOpacity(0.05), width: 2),
              ),
              child: Align(
                alignment: Alignment.center,
                child: budget.iconTitle,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              budget.title,
              style: const TextStyle(
                color: MyColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              budget.avg,
              style: const TextStyle(
                color: MyColors.gray,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            PercentIndicator(MediaQuery.of(_context).size.width - 170, MyColors.yellow, budget.availableMoney, budget.targetMoney,
                'm(VND)'), // -170 bang khoang cach margin va padding
            const Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: budget.iconSub.color?.withOpacity(0.3),
                  child: IconButton(
                    icon: budget.iconSub,
                    onPressed: () {},
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 10)),
                Flexible(
                  child: Text(
                    budget.description,
                    style: const TextStyle(
                      color: MyColors.gray,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ],
    ),
  );
}
