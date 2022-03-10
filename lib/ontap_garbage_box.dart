import 'package:flutter/material.dart';

class onTapGarbageBoxPage extends StatefulWidget {
  @override
  _onTapGarbageBoxPageState createState() => _onTapGarbageBoxPageState();
}

class _onTapGarbageBoxPageState extends State<onTapGarbageBoxPage> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('delete list'),
        ),
        body: Center(
          child: Text("coming soon"),
        ));
  }
}
