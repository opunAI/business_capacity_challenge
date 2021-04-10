import 'package:flutter/material.dart';
import 'package:opun_challenge/util/app_style.dart';

//TODO: improve design of the welcome screen

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome', style: AppStyle.TITLE_TEXTSTYLE),
            SizedBox(
              height: 10,
            ),
            Text('To Capacity Counter', style: AppStyle.SUBTITLE_TEXTSTYLE),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'The CDC recommends businesses operate at a reduced capacity during the pandemic to minimize the risk of transmitting Covid-19. Please exercise caution and wait to enter if you are asked.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'By working together we can keep our communities healthy, happy, and safe!'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Thank you!'),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: Text('continue'),
              onPressed: () => Navigator.pushNamed(context, '/home'),
            )
          ],
        ),
      ),
    );
  }
}
