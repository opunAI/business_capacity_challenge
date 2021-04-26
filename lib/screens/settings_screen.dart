import 'package:flutter/material.dart';
import 'package:opun_challenge/models/business.dart';
import 'package:opun_challenge/services/auth.dart';
import 'package:opun_challenge/services/database.dart';
import 'package:provider/provider.dart';

// TODO: save these values and use them in the home screen

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key, this.database}) : super(key: key);

  final Database database;

  static Future<void> show(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SettingsScreen(database: database),
          fullscreenDialog: true,
        ),
    );
  }



  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name;

  int _maxCapacity;


  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if(_validateAndSaveForm()) {
      final business = Business(name: _name, maxCapacity: _maxCapacity);
      await widget.database.createBusiness(business);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
        actions: <Widget>[
          // FlatButton(
          //     child: Text(
          //       'Logout',
          //       style: TextStyle(
          //         fontSize: 18.0,
          //         color: Colors.white,
          //       ),
          //     ),
          //     onPressed: () =>_signOut(context)
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: _buildForm(),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

    Widget _buildForm() {
      return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child:TextFormField(
                decoration: InputDecoration(labelText: 'Business Name:'),
                validator: (value) => value.isNotEmpty ? null : 'Please give name of business',
                onSaved: (value) => _name = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Max Capacity:',
                ),
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                onSaved: (value) => _maxCapacity = int.tryParse(value) ?? 0,
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
                onPressed: _submit,
              ),
            ),
          ],
        ),
      );
    }
}

