import 'package:hive_flutter/adapters.dart';

class TodoDatabase {
  List<String> todolist = [];
  List<bool> taskCompleted = [];
  final _mybox = Hive.box('mybox');

  void loaddata() {
    todolist = _mybox.get("TODOLIST");
    taskCompleted = _mybox.get("TASK");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", todolist);
    _mybox.put("TASK", taskCompleted);
  }
}
