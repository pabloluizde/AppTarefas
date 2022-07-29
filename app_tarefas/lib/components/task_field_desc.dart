import 'package:app_tarefas/components/task_wifgets.dart';
import 'package:flutter/material.dart';

class FieldDesc extends StatelessWidget {
  const FieldDesc({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final TasksList widget;

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
                    Text(
                      widget.desc,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
