import 'package:flutter/material.dart';
import 'package:opun_challenge/util/app_style.dart';

//TODO: improve design of the welcome screen

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/crowded.jpg')
            ],
          ),
        ),
      ),
    );
  }
}
