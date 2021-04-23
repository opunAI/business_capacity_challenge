import 'package:flutter/foundation.dart';

class BusinessAccount with ChangeNotifier{
  final String id;
  final String name;
  final int capacity;

  BusinessAccount({
    @required this.id,
    @required this.name,
    @required this.capacity
  });
}