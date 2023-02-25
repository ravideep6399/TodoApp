import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_signin/data/database.dart';
import 'package:login_signin/widget/container.dart';
import 'package:login_signin/widget/todotile.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _mybox = Hive.box('mybox');
  final _newTask = TextEditingController();
  TodoDatabase db = TodoDatabase();
  @override
  void initState() {
    if (_mybox.get("TODOLIST") != null) {
      db.loaddata();
    }
    super.initState();
  }

  void saveNewTask() {
    setState(() {
      db.todolist.add(_newTask.text);
      db.taskCompleted.add(false);
      _newTask.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void callback() {
    showDialog(
        context: context,
        builder: (context) {
          return Containers(
            newTask: _newTask,
            save: saveNewTask,
          );
        });
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.taskCompleted[index] = !db.taskCompleted[index];
    });
    db.updateDatabase();
  }

  void removeTile(int index) {
    setState(() {
      db.todolist.removeAt(index);
      db.taskCompleted.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 52, 52),
      appBar: AppBar(
        title: const Text(
          "Your List",
        ),
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        padding: EdgeInsets.only(top: 20),
        itemBuilder: (context, index) {
          return Todotile(
            task: db.todolist[index],
            taskcompleted: db.taskCompleted[index],
            onChanged: (value) => checkboxChanged(value, index),
            deleteTile: () => removeTile(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          callback();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
