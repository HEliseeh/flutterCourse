import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulaire'),
        ),
        body: Center(
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _role;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Firstname'),
            validator: (value) {
              if (value?.isEmpty == true) {
                return 'Please enter your firstname';
              }
              return null;
            },
            onSaved: (value) {
              _firstName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Lastname'),
            validator: (value) {
              if (value?.isEmpty == true) {
                return 'Please your Lastname';
              }
              return null;
            },
            onSaved: (value) {
              _lastName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value?.isEmpty == true) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (value) {
              _email = value;
            },
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Role'),
            value: _role,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Select a rôle ';
              }
              return null;
            },
            items: ['Front', 'Back', 'Full Stack', 'BDD'].map((role) {
              return DropdownMenuItem<String>(
                value: role,
                child: Text(role),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _role = value;
              });
            },
            onSaved: (value) {
              _role = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                print('Firstname: $_firstName');
                print('Lastname: $_lastName');
                print('Email: $_email');
                print('Role: $_role');
              }
            },
            child: Text('Soumettre'),
          )
        ],
      ),
    );
  }
}