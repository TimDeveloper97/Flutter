import 'package:finance/views/history_view.dart';
import 'package:flutter/material.dart';
import '../controls/bottom_bar_navigator.dart';
import '../shares/my_colors.dart';
import 'account_view.dart';
import 'chart_view.dart';
import 'home_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<Widget> _widgetOptions = const <Widget>[
  HomePage(),
  ChartPage(),
  HistoryPage(),
  AccountPage(),
];

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.appBackground,
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavBar(index: _currentIndex, onClicked: (index) {
        setState(() {
          _currentIndex = index;
        });
        // print('_currentIndex: $_currentIndex');
        // print('_widgetOptions.elementAt(_currentIndex): ${_widgetOptions.elementAt(_currentIndex)}');
      }),
    );
  }
}

