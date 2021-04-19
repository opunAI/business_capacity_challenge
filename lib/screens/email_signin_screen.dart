import 'package:flutter/material.dart';
import 'package:opun_challenge/services/auth.dart';

class EmailSignInScreen extends StatelessWidget {
  final AuthBase auth;

  const EmailSignInScreen({Key key, @required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 2.0,
      ),
      body: _buildContent(),
    );
  }

  _buildContent() {
    return Container();
  }
}
