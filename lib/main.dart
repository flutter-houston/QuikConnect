import 'package:flutter/material.dart';
import 'package:quikconnect/profile.dart';

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
      home: ProfilePage(title: 'Quik Connect Home Page'),
    );
  }
}
