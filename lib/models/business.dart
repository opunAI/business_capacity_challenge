import 'package:flutter/foundation.dart';

class Business {
  final String name;
  final int maxCapacity;

  Business ({@required this.name, @required this.maxCapacity});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'maxCapacity': maxCapacity
    };
  }
}