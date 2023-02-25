import 'package:flutter/material.dart';
import 'package:login_signin/widget/container.dart';
import 'package:login_signin/widget/todotile.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _newTask = TextEditingController();

  void saveNewTask() {
    setState(() {
      todolist.add(_newTask.text);
      taskCompleted.add(false);
      _newTask.clear();
    });
    Navigator.of(context).pop();
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
      taskCompleted[index] = !taskCompleted[index];
    });
  }

  void removeTile( int index) {
    setState(() {
      todolist.removeAt(index);
      taskCompleted.removeAt(index);
    });
  }

  List<String> todolist = [];
  List<bool> taskCompleted = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 52, 52),
      appBar: AppBar(
        title: const Text(
          "Your List",
        ),
      ),
      body:ListView.builder(
              itemCount: todolist.length,
              padding: EdgeInsets.only(top: 20),
              itemBuilder: (context, index) {
                return Todotile(
                  task: todolist[index],
                  taskcompleted: taskCompleted[index],
                  onChanged: (value) => checkboxChanged(value, index),
                  deleteTile: ()=>removeTile(index),
                );
              },
            ),
             floatingActionButton :FloatingActionButton(
              elevation: 10,
            onPressed: () {
              callback();
            },
            child: const Icon(Icons.add),
          ),
          
       
      
    );
  }
}
