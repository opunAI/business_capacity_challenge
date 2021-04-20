import 'package:flutter/cupertino.dart';

import 'auth.dart';

class AuthProvider extends InheritedWidget {
  final AuthBase auth;

  AuthProvider({@required this.auth});


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}

