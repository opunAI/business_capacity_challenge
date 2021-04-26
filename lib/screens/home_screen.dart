import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opun_challenge/models/business.dart';
import 'package:opun_challenge/screens/settings_screen.dart';
import 'package:opun_challenge/services/auth.dart';
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
      await database.createBusiness(
          Business(name: 'Code4Blessings', maxCapacity: 40));
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
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
        title: Text(
          'Capacity Counter',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => Navigator.pushNamed(context, '/welcome'),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => SettingsScreen.show(context),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _signOut(context),
          )
        ],
      ),
      body: _buildContents(context),
    );
  }
//It was challenging to incorporate the Firestore data around the UI so it was temporarily removed
// Once the Firestaore data streams on the page, will re-build UI around it.
  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Business>>(
      stream: database.businessStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          final businesses = snapshot.data;
          final children = businesses.map((business) =>
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        business.name,
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                ),
                  SizedBox(
                    height: 40,
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
                  ),
                ],

              )
          ).toList();
          return ListView(children: children);
        }
       if (snapshot.hasError) {
         return Center(child: Text('An error has occurred'));
       }
       return Center(child: CircularProgressIndicator());
      }
    );
  }
  
}

