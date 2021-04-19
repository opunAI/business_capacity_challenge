import 'package:flutter/material.dart';

class EmailSigninScreen extends StatelessWidget {
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
