import 'package:flutter/material.dart';

import 'quik_connect_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quik Connect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Quik Connect Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(15), child: PersonalInfoForm()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanCode,
        tooltip: 'Scan QR Code',
        child: Icon(QuikConnect.qrcode_scan),
      ),
    );
  }

  _scanCode() {}
}

class PersonalInfoForm extends StatefulWidget {
  PersonalInfoForm({Key key}) : super(key: key);

  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

enum WorkStatus { looking, hiring, working }

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _emailController = TextEditingController();
  var _locationController = TextEditingController();
  WorkStatus _workStatus;
  var _lookingToHire = false;
  var _lookingToWork = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _firstNameController,
            textCapitalization: TextCapitalization.words,
            // initialValue: user?.firstName ?? '',  // enable this when editing and
            // we have a user
            decoration: const InputDecoration(
              hintText: 'What does your mamma call you?',
              labelText: 'First Name',
              // labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            validator: (val) =>
                val.trim().isNotEmpty ? null : "First Name is required",
          ),
          TextFormField(
            controller: _lastNameController,
            textCapitalization: TextCapitalization.words,
            // initialValue: user?.lastName ?? '',  // enable this when editing and
            // we have a user
            decoration: const InputDecoration(
              hintText: 'What is your family name?',
              labelText: 'Last Name',
              // labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            validator: (val) =>
                val.trim().isNotEmpty ? null : "Last Name is required",
          ),
          TextFormField(
            controller: _locationController,
            // initialValue: user?.lastName ?? '',  // enable this when editing and
            // we have a user
            decoration: const InputDecoration(
              hintText: 'Houston, TX',
              labelText: 'Location',
              // labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            validator: (val) =>
                val.trim().isNotEmpty ? null : "Location is required",
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Work Status:",
            style: Theme.of(context).textTheme.subhead,
          ),
          Row(
            children: <Widget>[
              Radio(
                value: WorkStatus.looking,
                groupValue: _workStatus,
                onChanged: (WorkStatus value) {
                  setState(() {
                    _workStatus = value;
                  });
                },
              ),
              Text('Looking'),
              Radio(
                value: WorkStatus.hiring,
                groupValue: _workStatus,
                onChanged: (WorkStatus value) {
                  setState(() {
                    _workStatus = value;
                  });
                },
              ),
              Text('Hiring'),
              Radio(
                value: WorkStatus.working,
                groupValue: _workStatus,
                onChanged: (WorkStatus value) {
                  setState(() {
                    _workStatus = value;
                  });
                },
              ),
              Text('Working'),
            ],
          ),
        ],
      ),
    );
  }
}
