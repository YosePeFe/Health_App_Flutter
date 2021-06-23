import 'package:flutter/material.dart';
import 'package:health_app/src/pages/models/user.dart';
import 'package:health_app/src/services/database.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> genero = ['Mujer', 'Hombre'];
  final List<int> ages = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  String _currentName;
  String _currentGender;
  int _currentAge;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Username>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Modifica tu información',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        initialValue: userData.nombre,
                        validator: (val) =>
                            val.isEmpty ? 'Por favor ingresa tu nombre' : null,
                        onChanged: (val) => setState(() => _currentName = val)),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                      value: _currentGender ?? userData.genero,
                      items: genero.map((genero) {
                        return DropdownMenuItem(
                            value: genero, 
                            child: Text('$genero'));
                      }).toList(),
                      onChanged: (val) => setState(() => _currentGender = val),
                    ),
                    SizedBox(height: 10.0),
                    Slider(
                      value: (_currentAge ?? userData.edad).toDouble(),
                      activeColor: Colors.blue[_currentAge ?? userData.edad],
                      inactiveColor: Colors.blue[_currentAge ?? userData.edad],
                      min: 100.0,
                      max: 900,
                      divisions: 8,
                      onChanged: (val) =>
                          setState(() => _currentAge = val.round()),
                    ),
                    RaisedButton(
                        color: Colors.blue[400],
                        child: Text('Actualizar',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: user.uid).updateUserData(
                                _currentName ?? userData.nombre,
                                _currentGender ?? userData.genero,
                                _currentAge ?? userData.edad);
                          }
                          Navigator.pop(context);
                        })
                  ],
                ));
          } else {
            return Container();
          }
        });
  }
}
