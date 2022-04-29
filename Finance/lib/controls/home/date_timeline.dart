import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';
import 'date_time_picker.dart';

class DateTimeLine extends StatefulWidget {
  DateTimeLine({Key? key}) : super(key: key);

  late double _width;
  late double _height;
  late DateTime _tStart;
  late DateTime _tFinish;

  @override
  _DateTimeLineState createState() => _DateTimeLineState();
}

class _DateTimeLineState extends State<DateTimeLine> {

  @override
  Widget build(BuildContext context) {
    widget._width = MediaQuery.of(context).size.width / 2 - 50;
    widget._height = 60;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        timeStart(widget._width, widget._height, widget._tStart),
        const SizedBox(
          width: 0.5,
        ),
        timeFinish(widget._width, widget._height, widget._tFinish),
      ],
    );
  }

  @override
  void initState() {
    widget._tStart = DateTime(2020, 1, 1);
    widget._tFinish = DateTime(2020, 2, 1);
  }
}

Widget timeStart(double width, double height, DateTime _tStart) {
  return Container(
    alignment: Alignment.topLeft,
    width: width,
    height: height,
    padding: const EdgeInsets.only(right: 30, left: 30),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      color: MyColors.whiteSmoke,
      border: Border.all(color: Colors.grey.withOpacity(0.1), width: 2),
    ),
    child: DateTimePicker(_tStart),
  );
}

Widget timeFinish(double width, double height, DateTime _tFinish) {
  return Container(
    alignment: Alignment.topLeft,
    width: width,
    height: height,
    padding: const EdgeInsets.only(right: 30, left: 30),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
      color: MyColors.whiteSmoke,
      border: Border.all(color: Colors.grey.withOpacity(0.1), width: 2),
    ),
    child: DateTimePicker(_tFinish),
  );
}



