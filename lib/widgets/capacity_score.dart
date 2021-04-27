import 'package:flutter/material.dart';

class CapacityScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '2',
    2: '7',
    3: '5',
    4: '9',
    5: '4',
    6: '8',
    7: '1',
    8: '6',
    9: '3',
    10: '0'
  };

  CapacityScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}