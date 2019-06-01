import 'package:flutter/material.dart';

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
          ListTile()
        ],
      ),
    );
  }
}