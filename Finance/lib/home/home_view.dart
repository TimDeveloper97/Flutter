import 'package:finance/home/bugget.dart';
import 'package:finance/home/card_slider.dart';
import 'package:finance/home/date_timeline.dart';
import 'package:finance/home/transaction_view.dart';
import 'package:flutter/material.dart';
import '../shares/my_colors.dart';
import 'package:badges/badges.dart';

final _pageController = PageController(
  viewportFraction: 0.3,
);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  // List<CreditCard> _creditCards = [];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Header Container
            header(),

            //Body Container
            Expanded(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                child: body(context),
              ),
            ),

            //Footer Container
            footer(),
          ],
        ),
      ),
    );
  }
}

Widget header() {
  return Container(
    padding: const EdgeInsets.only(left: 50, top: 20, right: 30, bottom: 10),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning,',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: MyColors.gray.withOpacity(0.8),
              ),
            ),
            const Text(
              'Tim Developer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // notification
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Badge(
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications, size: 35, color: MyColors.primary),
                splashRadius: 20,
                padding: const EdgeInsets.only(bottom: 5),
                onPressed: () {},
              ),
              toAnimate: true,
              badgeColor: MyColors.blue,
            ),
            const Padding(padding: EdgeInsets.only(right: 20)),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/cat.jpg'),
            )
          ],
        )
      ],
    ),
  );
}

Widget body(BuildContext context) {
  return Column(
    children: [
      CardSlider(),
      const Padding(padding: EdgeInsets.only(top: 20)),
      DateTimeLine(),
      const Padding(padding: EdgeInsets.only(top: 20)),
      BudgetAccount('18600', '24800'),
      const Padding(padding: EdgeInsets.only(top: 30)),
      Container(
        margin: const EdgeInsets.only(right: 50, left: 50),
        child: TransactionView(),
      ),
    ],
  );
}

Widget footer() {
  return Container(
    padding: const EdgeInsets.all(20),
  );
}