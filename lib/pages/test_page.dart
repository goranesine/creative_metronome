import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isTapped = false;
  bool isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: AnimatedContainer(
                //   padding:EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: isTapped == false
                        ? Colors.redAccent
                        : Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                duration: Duration(seconds: 1),
                curve: Curves.bounceInOut,
                width: isDisabled == false ? 100 : 0,
                height: 100 ,
                ),
          ),
        ),
        FloatingActionButton(onPressed:
        (){setState(() {
          isDisabled = !isDisabled;
        });})
      ],
    );
  }
}
