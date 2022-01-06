import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class StepSequencer extends StatefulWidget {
  @override
  State<StepSequencer> createState() => _StepSequencerPageState();
}

class _StepSequencerPageState extends State<StepSequencer> {
  //List<Widget> listOfBars = [];

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return
        ListView.builder(
      //  scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, index) => Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Card(
                  child: Text(index.toString()),
                ),
              ),
            ],
          ));



  }
}
