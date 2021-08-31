import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<List<String>> testList = [
    ["0", "#00ffff", "#6666ff"],
    ["0", "#00ffff", "#6666ff"],
    ["0", "#00ffff", "#6666ff"],
    ["0", "#00ffff", "#6666ff"],
    ["0", "#00ffff", "#6666ff"]
  ];

  var list = <List<int>>[
    [1, 6],
    [2, 8],
    [4, 20]
  ];
  bool resetColors = false;
  bool threeMovesExceed = false;
  Color _colorContainer = Colors.blue;

  final Color blockInitColor = Colors.red;
  final Color blockPressedColor = Colors.green;
  Color blockActualColor = Colors.red;

  void resetBlocksColor() {
    setState(() {
      resetColors = true;
    });
  }

  void changeColorOffPressedBlock(int x, int y) {}

  void _incrementSecondCardStartParametr() {
    setState(() {
      list[1][0] += 1;
    });
  }
  @override
  Function decrementEndParametr(idx) =>  () => setState((){
    list[idx][1] -= 1;
  });
  Widget build(BuildContext context) {
    List<Widget> _widgets = list
        .map((data) => DataCard(
            start: data[0],
            end: data[1],
            key: ValueKey(hashCode+list.indexOf(data)),
            decrementEndParametr: decrementEndParametr(list.indexOf(data))))
        .toList();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        //Here we can remove an item from the list and using setState
        //or BlocBuilder will rebuild the grid with the new list data
        onPressed: () => _incrementSecondCardStartParametr(),
      ),
      body: Center(
        child: Column(
          children: _widgets,
        ),
      ),
    );
  }

  Widget oneBlock(int x, int y) {
    return GestureDetector(
      onTap: () => setState(() {
        _colorContainer =
            _colorContainer == Colors.red ? Colors.blue : Colors.red;
      }),
      child: Container(
        key: ValueKey(hashCode + x + y),
        color: _colorContainer,
        child: Center(
            child: Text(
          testList[x][y].toString(),
          textScaleFactor: 5,
        )),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
 final int start;
 final int end;
 final Key key;

  DataCard({required this.start,required this.end,required this.key,required this.decrementEndParametr});

  final Function decrementEndParametr;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> decrementEndParametr,
      child: Card(

          color: Colors.blue,
      child: Text("$start $end $key",textScaleFactor: 5,)),
    );
  }
}
