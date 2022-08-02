import 'package:app_tarefas/components/task_wifgets.dart';
import 'package:flutter/material.dart';

class FieldDesc extends StatefulWidget {
  const FieldDesc({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final TasksList widget;

  @override
  State<FieldDesc> createState() => _FieldDescState();
}

class _FieldDescState extends State<FieldDesc> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2.0),
              child: Container(
                height: 110,
                alignment: Alignment.topLeft,
                child: ListView(
                  children: [
                    const Text(
                      "Descrição: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.widget.desc,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
