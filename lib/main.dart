import 'package:flutter/material.dart';
import 'todo_list_page.dart';

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
