import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

enum GenderList { male, female }

GenderList _gender;
bool _agreement = false;

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('User name', style: TextStyle(fontSize: 20.0)),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return 'Please, enter your name';
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('E-mail', style: TextStyle(fontSize: 20.0)),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return 'Please, enter your e-mail';
                    if (!isEmail(value)) return 'This is not e-mail';
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Gender', style: TextStyle(fontSize: 20.0)),
                RadioListTile(
                    title: Text('Men'),
                    value: GenderList.male,
                    groupValue: _gender,
                    onChanged: (GenderList value) {
                      setState(() {
                        _gender = value;
                      });
                    }),
                RadioListTile(
                    title: Text('Woman'),
                    value: GenderList.female,
                    groupValue: _gender,
                    onChanged: (GenderList value) {
                      setState(() {
                        _gender = value;
                      });
                    }),
                SizedBox(
                  height: 20.0,
                ),
                CheckboxListTile(
                    value: _agreement,
                    title: Text('I agreement'),
                    onChanged: (bool value) =>
                        setState(() => _agreement = value)),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Color color = Colors.red;
                    String text;

                    if (_formKey.currentState.validate()) {
                      print('Gender $_gender');
                      print('Agreement $_agreement');

                      if (_gender == null) {
                        text = 'Choose your gender';
                      } else if (_agreement == false) {
                        text = 'Did you agreement?';
                      } else {
                        text = 'Form is filled';
                        color = Colors.green;
                      }

                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(text),
                        backgroundColor: color,
                      ));
                    }
                  },
                  child: Text('Check'),
                  color: Colors.blue,
                  textColor: Colors.white,
                )
              ],
            )));
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter - форма ввода'),
          ),
          body: MyForm()),
    ));
