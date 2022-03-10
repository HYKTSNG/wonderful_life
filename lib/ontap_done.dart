import 'package:flutter/material.dart';

class onTapPage extends StatefulWidget {
  @override
  _onTapPageState createState() => _onTapPageState();
}

class _onTapPageState extends State<onTapPage> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('できたこと！'),
        ),
        body: Center(
          child: Text("coming soon"),
        ));
  }
}
