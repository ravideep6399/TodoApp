import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  final String task;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function() deleteTile;
  Todotile(
      {super.key,
      required this.task,
      required this.taskcompleted,
      required this.onChanged,
      required this.deleteTile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        // onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Checkbox(
          value: taskcompleted,
          onChanged: onChanged,
        ),
        title: Text(
          "$task",
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0), borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            onPressed: deleteTile,
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
