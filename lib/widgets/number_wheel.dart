
import 'dart:async';

import 'package:flutter/material.dart';

class NumberWheel extends StatefulWidget {
  final int number;

  const NumberWheel({Key key, this.number}) : super(key: key);

  @override
  _NumberWheelState createState() => _NumberWheelState();
}

class _NumberWheelState extends State<NumberWheel> {
  static const double IMAGE_SIZE = 120;

  Timer timer;
  double _angle = 0;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 20), (timer) {
      setState(() => _angle += .01);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: IMAGE_SIZE + 40,
      height: IMAGE_SIZE + 40,
      child: Stack(
        children: [
          Center(
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.rotationZ(_angle),
              child: Image(
                  width: IMAGE_SIZE,
                  height: IMAGE_SIZE,
                  image: AssetImage('assets/images/numbers_jumbled.png')
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_downward),
            ],
          )
        ],
      ),
    );
  }
}
