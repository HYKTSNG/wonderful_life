import 'package:flutter/material.dart';

class onPressedLoginView extends StatefulWidget {
  @override
  _onPressedLoginViewState createState() => _onPressedLoginViewState();
}

class _onPressedLoginViewState extends State<onPressedLoginView> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Paage'),
      ),
    );
  }
}
