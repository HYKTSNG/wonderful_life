import 'package:flutter/material.dart';
import 'ontap_garbage_box.dart';
import 'todo_add_page.dart';
import 'ontap_done.dart';
import 'onPressedLoginView.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = ["誰かに挨拶しよう!", "ゴミ拾いしよう!", "誰かに感謝を伝えよう!"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        child: Drawer(
            child: ListView(
          children: [
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
              trailing: Icon(Icons.star, color: Colors.green),
              onTap: () async {
                final onTapDoneListPage = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return onTapPage();
                  }),
                );
              },
            ),
            ListTile(
              title: Text("Garbage box"),
              trailing: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onTap: () async {
                final onTapGarbageBoxListPage =
                    await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return onTapGarbageBoxPage();
                  }),
                );
              },
            ),
          ],
        )),
      ),
      appBar: AppBar(
        title: const Text('Wonderful Life'),
        actions: [
          IconButton(
              onPressed: () async {
                final onPressedLoginPage = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return onPressedLoginView();
                }));
              },
              icon: Icon(Icons.account_circle))
        ],
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
