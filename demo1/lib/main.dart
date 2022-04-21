import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(const MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: SafeArea(
      child: MyScaffold(),
    ),
  ),);
}


class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}


double value = 0;
void _onSearchButtonPressed() {
  print("search button clicked $value");

}
class MyStateAppBar extends StatefulWidget{
  const MyStateAppBar({Key? key}) : super(key: key);

  @override
  State<MyStateAppBar> createState() => MyAppBar();
}


class MyAppBar extends State<MyStateAppBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: () { _onSearchButtonPressed();
                setState(() {
                  value++;
                });
              },
            splashRadius: 10,
          ),
          // Expanded expands its child
          // to fill the available space.
          Expanded(
            child: Center(
              child: Text('value: $value'),
            ),
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: [
          MyStateAppBar(),
          Expanded(
            child: Center(
              child: Text('Hello, world! $value'),
            ),
          ),
        ],
      ),
    );
  }
}
