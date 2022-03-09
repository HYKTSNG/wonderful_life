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

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = ["sample1", "sample2", "sample3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        child: Drawer(
            child: ListView(
          children: const [
            DrawerHeader(
              child: Text(
                "カテゴリー覧",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Done"),
              trailing: Icon(Icons.star, color: Colors.red),
            ),
            ListTile(
              title: Text("Garbage box"),
              trailing: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            ListTile(),
          ],
        )),
      ),
      appBar: AppBar(
        title: const Text('Wonderful Life'),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    todoList.remove(todoList[index]);
                  });
                  if (direction == DismissDirection.endToStart) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("delete"),
                      duration: Duration(seconds: 1),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("good job"),
                        duration: Duration(seconds: 1)));
                  }
                },
                secondaryBackground: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                background: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.green,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    title: Text(
                      todoList[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLength: 15,
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
              decoration: const InputDecoration(
                  hintText: "例: 誰かに挨拶", labelText: "やりたい良いことを入力してね。"),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
