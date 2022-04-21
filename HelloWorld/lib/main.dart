import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// https://github.com/material-components/material-components-flutter/tree/develop/docs/components

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.light(),
        home: Scaffold(
          body: Container(
            // margin: const EdgeInsets.all(20),
            alignment: FractionalOffset.center,
            // child: MyHomePage(),
            child: DataTableDemo(),
          ),
        ));
  }
}

// class MyHomePage extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TextFormField(
//         initialValue: 'Input text',
//         maxLength: 20,
//         decoration: const InputDecoration(
//           icon: Icon(Icons.calendar_today),
//           labelText: 'today',
//           labelStyle: TextStyle(
//             color: Color(0xFF6200EE),
//           ),
//           helperText: 'write you something news today',
//           // suffixIcon: Icon(
//           //   Icons.check_circle,
//           // ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF6200EE)),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TextFormField(
//         initialValue: 'Input text',
//         decoration: const InputDecoration(
//           labelText: 'Label text',
//           errorText: null,
//           border: OutlineInputBorder(),
//           suffixIcon: Icon(
//             Icons.error,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextFormField(
//             initialValue: 'Input text',
//             maxLength: 20,
//             decoration: const InputDecoration(
//               icon: Icon(Icons.favorite),
//               labelText: 'Label text',
//               helperText: 'Helper text',
//               suffixIcon: Icon(
//                 Icons.check_circle,
//               ),
//             ),
//           ),
//           TextFormField(
//             initialValue: 'Input text',
//             maxLength: 20,
//             decoration: const InputDecoration(
//               icon: Icon(Icons.favorite),
//               labelText: 'Label text',
//               helperText: 'Helper text',
//               errorText: 'Error message',
//               suffixIcon: Icon(
//                 Icons.error,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 200.0,
//             height: 100.0,
//             child: Shimmer.fromColors(
//               baseColor: Colors.red,
//               highlightColor: Colors.yellow,
//               child: const Text(
//                 'Shimmer',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 40.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Banners'),
//       ),
//       body: MaterialBanner(
//         content: const Text('Error message text'),
//         leading: CircleAvatar(child: Icon(Icons.delete)),
//         actions: [
//           FlatButton(
//             child: const Text('ACTION 1'),
//             onPressed: () {},
//           ),
//           FlatButton(
//             child: const Text('ACTION 2'),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//     int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         backgroundColor: Color(0xFF6200EE),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white.withOpacity(.6),
//         selectedFontSize: 14,
//         unselectedFontSize: 14,
//         onTap: (value) {
//           // Respond to item press.
//           setState(() => _currentIndex = value);
//         },
//         items: const[
//           BottomNavigationBarItem(
//             label: 'Favorites',
//             icon: Icon(Icons.favorite),
//           ),
//           BottomNavigationBarItem(
//             label: 'Music',
//             icon: Icon(Icons.music_note),
//           ),
//           BottomNavigationBarItem(
//             label: 'Places',
//             icon: Icon(Icons.location_on),
//           ),
//           BottomNavigationBarItem(
//             label: 'News',
//             icon: Icon(Icons.library_books),
//           ),
//         ],
//       ),
//       floatingActionButton:
//       FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         backgroundColor: Color(0xFF6200EE),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white.withOpacity(.6),
//         selectedFontSize: 14,
//         unselectedFontSize: 14,
//         onTap: (value) {
//           // Respond to item press.
//           setState(() => _currentIndex = value);
//         },
//         items: [
//           BottomNavigationBarItem(
//             label: 'Favorites',
//             icon: Icon(Icons.favorite),
//           ),
//           BottomNavigationBarItem(
//             label: 'Music',
//             icon: Icon(Icons.music_note),
//           ),
//           BottomNavigationBarItem(
//             label: 'Places',
//             icon: Icon(Icons.location_on),
//           ),
//           BottomNavigationBarItem(
//             label: 'News',
//             icon: Icon(Icons.library_books),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Card title 1'),
                  subtitle: Text(
                    'Secondary Text',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 1'),
                    ),
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 2'),
                    ),
                  ],
                ),
                Image.asset('assets/card-sample-image.jpg'),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Card title 2'),
                  subtitle: Text(
                    'Secondary Text',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 1'),
                    ),
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 2'),
                    ),
                  ],
                ),
                Image.asset('assets/card-sample-image-2.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataTableDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Tables'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PaginatedDataTable(
            header: Text('Header Text'),
            rowsPerPage: 4,
            columns: [
              DataColumn(label: Text('Header A')),
              DataColumn(label: Text('Header B')),
              DataColumn(label: Text('Header C')),
              DataColumn(label: Text('Header D')),
            ],
            source: _DataSource(context),
          ),
        ],
      ),
    );
  }
}

class _Row {
  _Row(
      this.valueA,
      this.valueB,
      this.valueC,
      this.valueD,
      );

  final String valueA;
  final String valueB;
  final String valueC;
  final int valueD;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _rows = <_Row>[
      _Row('Cell A1', 'CellB1', 'CellC1', 1),
      _Row('Cell A2', 'CellB2', 'CellC2', 2),
      _Row('Cell A3', 'CellB3', 'CellC3', 3),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
    ];
  }

  final BuildContext context;
  late List<_Row> _rows;

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return const DataRow(cells: <DataCell>[]);
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.valueA)),
        DataCell(Text(row.valueB)),
        DataCell(Text(row.valueC)),
        DataCell(Text(row.valueD.toString())),
      ],
    ); 
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => fals 
     
  @override
  int get selectedRowCount => _selectedCount;
}