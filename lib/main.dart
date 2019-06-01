import 'package:flutter/material.dart';
import 'package:quick_connect/profile.dart';

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
      home: ProfilePage(title: 'Profile Page'),
    );
  }
}
