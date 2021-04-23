import 'package:flutter/material.dart';
import 'package:opun_challenge/services/auth_provider.dart';
import 'package:opun_challenge/util/app_style.dart';

// TODO: save these values and use them in the home screen

class SettingsScreen extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signOut();
      Navigator.of(context).pushNamed('/signIn');;
    }
    catch (err) {
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
        actions: <Widget>[
          FlatButton(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () =>_signOut(context)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: _buildContent(),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
    Widget _buildContent() {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child:TextField(
                decoration: InputDecoration(
                  labelText: 'Business Name:'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Max Capacity:'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: RaisedButton(
                child: Text(
                  'save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () => print('save pressed'),
              ),
            ),
          ],
        ),
      );
    }
      //Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Settings', style: AppStyle.TITLE_TEXTSTYLE),
      //       SizedBox(
      //         height: 50,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             'Max Capacity:',
      //             style: AppStyle.BOLD_TEXTSTYLE,
      //           ),
      //           SizedBox(
      //             width: 20,
      //           ),
      //           SizedBox(
      //             width: 100,
      //             child: TextField(),
      //           ),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             'Business Name:',
      //             style: AppStyle.BOLD_TEXTSTYLE,
      //           ),
      //           SizedBox(
      //             width: 20,
      //           ),
      //           SizedBox(
      //             width: 100,
      //             child: TextField(),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 50,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           // RaisedButton(
      //           //   child: Text(
      //           //     'back',
      //           //     style: TextStyle(
      //           //       color: Colors.white,
      //           //     ),
      //           //   ),
      //           //   color: Theme.of(context).primaryColor,
      //           //   onPressed: () => Navigator.pop(context),
      //           // ),
      //           RaisedButton(
      //             child: Text(
      //               'save',
      //               style: TextStyle(
      //                 color: Colors.white,
      //               ),
      //             ),
      //             color: Theme.of(context).primaryColor,
      //             onPressed: () => print('save pressed'),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),

  }

