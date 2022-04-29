import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../icons/my_flutter_app_icons.dart';
import '../../models/subscription.dart';

final oCcy = NumberFormat("#,##0", "en_US");

class CardSubscriptionsSlider extends StatefulWidget {
  CardSubscriptionsSlider({Key? key}) : super(key: key);

  List<Subscription> _subscriptionCards = [];

  @override
  _CardSubscriptionsSliderState createState() => _CardSubscriptionsSliderState();
}

class _CardSubscriptionsSliderState extends State<CardSubscriptionsSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 50, bottom: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Monthly Subscriptions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(left: 30), child: SizedBox(
          height: 310,
          child: ListView.builder(
            itemCount: widget._subscriptionCards.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = widget._subscriptionCards[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(color: Colors.white),
                    cardView(item),
                  ],
                ),
              );
            },
          ),
        ),)
      ],
    );
  }

  @override
  void initState() {
    widget._subscriptionCards = [
      Subscription(
          'Spotify Premium',
          'Next payment on 26 May',
          240000,
          const Icon(
            MyFlutterApp.spotify,
            color: Colors.green,
            size: 40,
          )),
      Subscription(
          'Dropbox Extension',
          'Next payment on 15 May',
          468000,
          const Icon(
            MyFlutterApp.dropbox,
            color: Colors.indigo,
            size: 40,
          )),
      Subscription(
          'XBox',
          'Next payment on 10 Jun',
          568000,
          const Icon(
            MyFlutterApp.xbox,
            color: Colors.lightGreen,
            size: 40,
          )),
      Subscription(
          'Film',
          'Next payment on 10 Dec',
          100000,
          const Icon(
            MyFlutterApp.video,
            color: Colors.red,
            size: 40,
          )),
    ];
  }
}

Widget cardView(Subscription subs) {
  return Container(
    width: 300,
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
                color: subs.iconTitle.color?.withOpacity(0.3),
                border: Border.all(color: Colors.grey.withOpacity(0.05), width: 2),
              ),
              child: Align(
                alignment: Alignment.center,
                child: subs.iconTitle,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              subs.title,
              style: const TextStyle(
                color: MyColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              subs.avg,
              style: const TextStyle(
                color: MyColors.gray,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'VND',
                  style: TextStyle(
                    color: MyColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 5)),
                Text(
                  oCcy.format(int.parse(subs.availableMoney.toString())),
                  style: const TextStyle(
                    color: MyColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            myButtonOutline('Pay now', () {}),
          ]),
        ),
      ],
    ),
  );
}

Widget myButtonOutline(String text, Function() callback) {
  return SizedBox(
    height: 45,
    child: OutlinedButton(
      onPressed: () => callback(),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: MyColors.app,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: const BorderSide(width: 2, color: Colors.white),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              text = text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
