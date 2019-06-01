import 'package:flutter/material.dart';
import 'package:quick_connect/user.dart';

class PersonalInfoForm extends StatefulWidget {
  PersonalInfoForm({Key key, this.user}) : super(key: key);
  final User user;
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

enum WorkStatus { looking, hiring, working }

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  User get user => widget.user;
  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _emailController = TextEditingController();
  var _locationController = TextEditingController();
  WorkStatus _workStatus;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (user != null) {
      //setup our user data for editing
      _firstNameController.text = user.firstName ?? "";
      _lastNameController.text = user.lastName ?? "";
      _emailController.text = user.email ?? "";
      _locationController.text = user.firstName ?? "";
      _workStatus = user.workStatus ?? null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _firstNameController,
            textCapitalization: TextCapitalization.words,
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
            decoration: const InputDecoration(
              hintText: 'What is your family name?',
              labelText: 'Last Name',
              // labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            validator: (val) =>
                val.trim().isNotEmpty ? null : "Last Name is required",
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'user@example.com',
              labelText: 'Email',
              // labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            validator: (val) =>
                val.trim().isNotEmpty ? null : "Email is required",
          ),
          TextFormField(
            controller: _locationController,
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
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            onPressed: () => _submitForm(),
            child: Text("Save"),
          )
        ],
      ),
    );
  }

  _submitForm() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    var _user = User(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        location: _locationController.text,
        workStatus: _workStatus);
  }
  //TODO send this to firestore
}
