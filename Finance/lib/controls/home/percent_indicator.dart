import 'package:flutter/material.dart';

class PercentIndicator extends StatefulWidget {
  final Color _color;
  final double _value;
  final double _max;
  final String _unit;
  final double _width;

  const PercentIndicator(this._width, this._color, this._value, this._max, this._unit);

  @override
  _PercentIndicator createState() => _PercentIndicator();
}

class _PercentIndicator extends State<PercentIndicator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget._width,
          height: 40,
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.grey,
            border: Border.all(color: Colors.transparent, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2, bottom: 5),
                child: Text(
                  widget._unit,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                widget._max.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: widget._width * (widget._value / widget._max),
          height: 40,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: widget._color,
            border: Border.all(color: Colors.transparent, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2, bottom: 5),
                child: Text(
                  widget._unit,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                widget._value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
