import 'package:flutter/material.dart';
import 'package:opun_challenge/util/app_style.dart';
import 'package:opun_challenge/widgets/curve_clipper.dart';

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
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipPath(
                clipper: CurveClipper(),
                child: Image.asset(
                  'assets/images/crowded.jpg',
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Welcome to the Capacity Counter',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text(
                  'The CDC recommends businesses operate at a reduced capacity during the pandemic to minimize the risk of transmitting Covid-19. Please exercise caution and wait to enter if you are asked.',
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      //height: 1.5,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'By working together we can keep our communities healthy, happy, and safe!',
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Thank you!',
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: RaisedButton(
                  child: Text(
                      'CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/home'),
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
