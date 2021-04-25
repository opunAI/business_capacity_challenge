import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opun_challenge/models/business.dart';
import 'package:opun_challenge/screens/settings_screen.dart';
import 'package:opun_challenge/widgets/number_wheel.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter(int inc) => setState(() => _counter += inc);

  Future<void> _createBusiness(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await database.createBusiness(Business(name: 'Code4Blessings', maxCapacity: 40));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                // TODO: remove this counter and show capacity by animating number wheels
                Text(
                  'Capacity:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(FontAwesomeIcons.userMinus),
                      onPressed: () => _incrementCounter(-1),
                    ),
                    FlatButton(
                      child: Text('Add Data'),
                      onPressed: () => _createBusiness(context),
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.userPlus),
                      onPressed: () => _incrementCounter(1),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberWheel(),
                        NumberWheel(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child:
                        // TODO: show business name here if it has been saved in the settings page
                        Text('Capacity Counter',
                            style: TextStyle(fontSize: 20)),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () => SettingsScreen.show(context),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
