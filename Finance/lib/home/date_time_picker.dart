import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../shares/my_colors.dart';

class DateTimePicker extends StatefulWidget {
  late DateTime _time;

  DateTimePicker(DateTime t, {Key? key}) : super(key: key){
    _time = t;
  }

  @override
  _DateTimePicker createState() => _DateTimePicker();
}

class _DateTimePicker extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat('MMM dd, yyyy').format(widget._time),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(Icons.arrow_drop_down_sharp, size: 25, color: Colors.grey),
            splashRadius: 20,
            color: Colors.transparent,
            padding: const EdgeInsets.only(bottom: 5),
            hoverColor: MyColors.gray.withOpacity(0.5),
            focusColor: MyColors.gray.withOpacity(0.5),
            onPressed: () {
              DatePicker.showDatePicker(context, showTitleActions: true, minTime: DateTime(2020, 1, 1), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                print('confirm $date');

                setState(() {
                  widget._time = date;
                  print('time confirm: ${widget._time}');
                });
              }, currentTime: DateTime.now(), locale: LocaleType.en);

            },
          ),
        ),
      ],
    );
  }
}

