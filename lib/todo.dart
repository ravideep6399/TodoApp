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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 20),
            child: const Text(
              "All Todo's",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todolist.length,
              itemBuilder: (context, index) {
                return Todotile(
                  task: todolist[index],
                  taskcompleted: taskCompleted[index],
                  onChanged: (value) => checkboxChanged(value, index),
                  deleteTile: ()=>removeTile(index),
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              callback();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      )),
    );
  }
}
