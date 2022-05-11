import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../controls/home/bugget.dart';
import '../controls/home/card_budget_slider.dart';
import '../controls/home/card_slider.dart';
import '../controls/home/card_subscriptions_slider.dart';
import '../controls/home/date_timeline.dart';
import '../controls/home/transaction_view.dart';
import '../shares/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              child: body(),
            ),
          ),
        ],
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

Widget body() {
  return Column(
    children: [
      CardSlider(),
      const Padding(padding: EdgeInsets.only(top: 20)),
      DateTimeLine(),
      const Padding(padding: EdgeInsets.only(top: 20)),
      BudgetAccount('18600', '24800'),
      const Padding(padding: EdgeInsets.only(top: 30)),
      Container(
        margin: const EdgeInsets.only(right: 30, left: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 15),
              child: titleTransaction(),
            ),
            TransactionView(numberItemShow: 3),
          ],
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 30)),
      CardBudgetSlider(),
      const Padding(padding: EdgeInsets.only(top: 30)),
      Container(
        color: MyColors.blue,
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: CardSubscriptionsSlider(),
      )
    ],
  );
}
