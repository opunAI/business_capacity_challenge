import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

import 'capacity_score.dart';

class CapacityWheel extends StatefulWidget {
  @override
  _CapacityWheelState createState() => _CapacityWheelState();
}

class _CapacityWheelState extends State<CapacityWheel> {
  final StreamController _dividerController = StreamController<int>();

  final _wheelNotifier = StreamController<double>();

  @override
  void dispose() {
    super.dispose();
    _dividerController.close();
    _wheelNotifier.close();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinningWheel(
          Image.asset('assets/images/numbers_jumbled.png'),
          width: 290,
          height: 290,
          initialSpinAngle: _generateRandomAngle(),
          spinResistance: 0.6,
          canInteractWhileSpinning: false,
          dividers: 8,
          onUpdate: _dividerController.add,
          onEnd: _dividerController.add,
          secondaryImage:
          Image.asset('assets/images/pointer.png'),
          secondaryImageHeight: 110,
          secondaryImageWidth: 110,
          shouldStartOrStop: _wheelNotifier.stream,
        ),
        SizedBox(height: 30),
        StreamBuilder(
          stream: _dividerController.stream,
          builder: (context, snapshot) =>
          snapshot.hasData ? CapacityScore(snapshot.data) : Container(),
        ),
        SizedBox(height: 30),
        new RaisedButton(
          child: new Text("Start"),
          onPressed: () =>
              _wheelNotifier.sink.add(_generateRandomVelocity()),
        )
      ],
    );
  }
  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}
