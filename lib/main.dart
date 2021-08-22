import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<int>> gridState = [
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8]
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    double _height = MediaQuery.of(context).size.height - _statusBarHeight;

    return Scaffold(
      body: _buildGameBody(_width, _height, _statusBarHeight),
    );
  }

  Widget _buildGameBody(double _width, double _height, double statusBarHeight) {
    int gridStateLength = gridState.length;
    final double itemHeight =
        (MediaQuery.of(context).size.height - statusBarHeight) / 10;
    final double itemWidth = MediaQuery.of(context).size.width / 5;
    return Stack(
      children: [
        Positioned(
          top: 0 + statusBarHeight,
          left: 0,
          child: Container(
            color: Colors.green,
            width: _width,
            height: _height / 2,
            child: Center(
              child: Text("Player 2"),
            ),
          ),
        ),
        Positioned(
          top: _height / 2 + statusBarHeight,
          left: 0,
          child: Container(
            color: Colors.red,
            width: _width,
            height: _height / 2,
            //    padding: const EdgeInsets.all(8.0),
            //       margin: const EdgeInsets.all(8.0),
            //    decoration: BoxDecoration(
            //      border: Border.all(color: Colors.black, width: 2.0)),

            child: GridView.builder(
              padding: EdgeInsetsGeometry.lerp(
                  EdgeInsets.zero, EdgeInsets.zero, 0.0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: itemWidth / itemHeight,
                crossAxisCount: gridStateLength,
              ),
              itemBuilder: _buildGridItems,
              itemCount: gridStateLength * gridStateLength,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = gridState.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return GestureDetector(
      onTap: () => _gridItemTapped(x, y),
      child: Container(
        //  width: MediaQuery.of(context).size.width / 5,
        //    height: MediaQuery.of(context).size.height -
        //    MediaQuery.of(context).padding.top / 5,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
        child: Center(
          child: _buildGridItem(x, y),
        ),
      ),
    );
  }

  Widget _buildGridItem(int x, int y) {
    switch (gridState[x][y]) {
      case 1:
        return Text('1');
        break;
      case 2:
        return Container(
          color: Colors.blue,
        );
        break;
      case 3:
        return Container(
          color: Colors.yellow,
        );
        break;
      case 4:
        return Icon(
          Icons.terrain,
          size: 40.0,
          color: Colors.red,
        );
        break;
      case 5:
        return Icon(Icons.remove_red_eye, size: 40.0);
        break;
      default:
        return Text(gridState[x][y].toString());
    }
  }

  _gridItemTapped(int x, int y) {
    print(gridState[x][y]);
  }
}
