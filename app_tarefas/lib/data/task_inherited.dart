import 'package:app_tarefas/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task(
        "Aprender Flutter",
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
        3,
        "aaaaaa"),
    Task(
        "Aprender Flutter",
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
        3,
        "Oie manito"),
  ];

  void newTask(String name, String photo, int dif, desc) {
    taskList.add(Task(name, photo, dif, desc));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWideget) {
    return oldWideget.taskList.length != taskList.length;
  }
}
