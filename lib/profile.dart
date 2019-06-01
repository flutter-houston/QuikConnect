import 'package:flutter/material.dart';
import 'package:quick_connect/personal_info_form.dart';
import 'package:quick_connect/quik_connect_icons.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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