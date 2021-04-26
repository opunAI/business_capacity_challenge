import 'package:flutter/foundation.dart';

class Business {
  final String name;
  final int maxCapacity;

  Business ({@required this.name, @required this.maxCapacity});

  factory Business.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final int maxCapacity = data['maxCapacity'];
    return Business(
      name: name,
      maxCapacity: maxCapacity
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'maxCapacity': maxCapacity
    };
  }
}