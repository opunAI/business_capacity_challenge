import 'package:flutter/material.dart';
import 'package:opun_challenge/screens/email_signin_form.dart';
import 'package:opun_challenge/services/auth.dart';


class EmailSignInScreen extends StatelessWidget {
  final AuthBase auth;

  const EmailSignInScreen({Key key, @required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text(
            'Sign In To The Capacity Counter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        //toolbarHeight: 100,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
            child: EmailSignInForm(auth: auth),
        ),
      ),
      backgroundColor: Colors.grey[200],

    );

  }

}
