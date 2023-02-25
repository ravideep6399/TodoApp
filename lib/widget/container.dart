import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  final newTask;
  VoidCallback save;

  Containers({super.key, required this.newTask, required this.save});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: SizedBox(
          height: 140,
          width: 220,
          child: Column(
            children: [
              TextField(
                controller: newTask,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 57, 57, 57))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "add new task",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                autofocus: true,
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: save,
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 57, 57, 57))),
                child: const Text(
                  "ADD",
                ),
              ),
            ],
          ),
        ));
  }
}
