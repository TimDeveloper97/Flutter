import 'package:finance/models/credit_card.dart';
import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0", "en_US");

class CardSlider extends StatefulWidget {
  CardSlider({Key? key}) : super(key: key);

  late int _index;
  List<CreditCard> _creditCards = [];

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250, // card height
      child: PageView.builder(
        itemCount: widget._creditCards.length,
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
                  widget._index == i ? Image.asset(
                    'assets/images/card1.png',
                    fit: BoxFit.fill,
                  ) : Container(color: MyColors.gray,),
                  cardview(widget._creditCards[i]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    widget._index = 0;

    widget._creditCards = [
      CreditCard(TextEditingController(text: 'Visa'), TextEditingController(text: '20000000'), TextEditingController(text: 'TechcomBank')),
      CreditCard(TextEditingController(text: 'VIP'), TextEditingController(text: '20000000'), TextEditingController(text: 'BIDV')),
      CreditCard(TextEditingController(text: 'Sliver'), TextEditingController(text: '20000000'), TextEditingController(text: 'VietcomBank')),
      CreditCard(TextEditingController(text: 'Gold'), TextEditingController(text: '20000000'), TextEditingController(text: 'MB')),
    ];
  }
}

Widget cardview(CreditCard card) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            card.type.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            card.bank.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Balance',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'VND',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 5)),
                  Text(
                    oCcy.format(int.parse(card.money.text)),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          )
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Icon(Icons.info, size: 35, color: Colors.white.withOpacity(0.5)),
            splashRadius: 20,
            padding: const EdgeInsets.only(bottom: 5),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}
