import 'package:flutter/material.dart';
import 'package:opun_challenge/screens/email_signin_screen.dart';
import 'package:opun_challenge/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:opun_challenge/screens/landing_page.dart';

import 'package:opun_challenge/screens/settings_screen.dart';
import 'package:opun_challenge/screens/welcome_screen.dart';
import 'package:opun_challenge/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capacity Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        // default route:
        '/': (context) => LandingPage(auth: Auth()),
        '/welcome': (context) => WelcomeScreen(),
        '/home': (context) => MyHomePage(title: 'Capacity Counter'),
        '/settings': (context) => SettingsScreen(auth: Auth()),
        '/signIn': (context) => EmailSignInScreen(auth: Auth(),),
      },
    );
  }
}
