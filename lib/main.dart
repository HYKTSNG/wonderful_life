import 'package:flutter/material.dart';

void main() {
  runApp(MyWonderfulLifeApp());
}

class MyWonderfulLifeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wonderful Life",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("リスト一覧画面"),
      ),
    );
  }
}
