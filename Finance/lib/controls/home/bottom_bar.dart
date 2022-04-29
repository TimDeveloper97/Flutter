import 'package:flutter/material.dart';
import '../../shares/my_colors.dart';

late ButtonList _bars;
late List<ButtonIcon> _buttonsIcon;

class BottomBars extends StatefulWidget {

  @override
  _BottomBarsState createState() => _BottomBarsState();
}

class _BottomBarsState extends State<BottomBars> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Row(children: <Widget>[for (int i = 0; i < _buttonsIcon.length; i++) Expanded(child: _buttonsIcon[i], flex: 1,)]),
    );
  }

  @override
  void initState() {
    final item = _bars = ButtonList();
    item.middle = 2;
    item.index = 0;
    item.pages = [
      Icon(Icons.home_filled),
      Icon(Icons.home_filled),
      Icon(Icons.home_filled),
      Icon(Icons.home_filled),
      Icon(Icons.home_filled),
    ];

    item.isSelected = [];
    for (var i in item.pages) {
      item.isSelected.add(false);
    }

    item.isSelected[item.index] = true;

    _buttonsIcon = [];
    for (int i = 0; i < _bars.pages.length; i++) {
      _buttonsIcon.add(ButtonIcon(i));
    }
  }
}

class ButtonIcon extends StatefulWidget {
  final int _index;
  late Color _color;
  ButtonIcon(this._index, {Key? key}) : super(key: key);

  void setColor(bool state){
    _color = state ? MyColors.blue : Colors.black.withOpacity(0.60);
    print('$_color');
  }

  @override
  _ButtonIcon createState() => _ButtonIcon();
}

class _ButtonIcon extends State<ButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        color: Colors.black.withOpacity(0.60),
        selectedColor: MyColors.blue,
        selectedBorderColor: MyColors.gray.withOpacity(0.6),
        fillColor: MyColors.blue.withOpacity(0.08),
        splashColor: MyColors.blue.withOpacity(0.12),
        hoverColor: MyColors.blue.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8.0),
        isSelected: <bool> [_bars.isSelected[widget._index]],
        highlightColor: Colors.transparent,

        onPressed: (index) {
          setState(() {

            for (int i = 0; i < _bars.isSelected.length; i++) {
              _buttonsIcon[i].setColor(widget._index == i);
              _bars.isSelected[i] = widget._index == i;
            }
            _bars.index = widget._index;
          });

          print('new');
          for (int i = 0; i < _bars.isSelected.length; i++) {
            print('$i: ${_bars.isSelected[i]}');
          }
          print('index: ${_bars.index}');
        },
        children: <Widget>[
          _bars.pages[widget._index]
        ],
      ),
    );
  }

  @override
  void initState() {
    widget._color = Colors.black.withOpacity(0.60);
  }
}

class ButtonList {
  late int middle;
  late int index;
  late List<Icon> pages;
  late List<bool> isSelected;
}
